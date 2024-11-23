//
//  ImageLoaderService.swift
//  FindBerryMap
//
//  Created by Importants on 10/13/24.
//

import Foundation
import UIKit

/**
 이미지 로딩 서비스를 위한 프로토콜입니다.
 
 이 프로토콜은 URL을 통해 이미지를 비동기적으로 로드하는 기능을 정의합니다.
 - Image Cache 구현
 - Image load 로직 구현
 */
protocol ImageLoaderServiceProtocol {
    /**
     지정된 URL에서 이미지를 로드합니다.
     
     - Parameter url: 이미지 URL
     - Returns: 로드된 UIImage 객체
     - Throws: 이미지 로드 실패 시 ImageLoaderError
     */
    func load(url: NSURL) async throws -> UIImage
}

/**
 이미지 로드 요청을 관리하는 액터입니다.
 
 pendingTasks에 중복 접근하여 Error가 발생하는 문제를 해결하기 위해 추가하였습니다.
 
 요청이 중복되는 경우 해당 요청을 대기열에 추가하고, 이미지 로드가 완료되면 관련된 모든 요청에 결과를 전달합니다.
 */
actor ImageLoaderTaskManager {
    
    private var pendingTasks: [NSURL: [CheckedContinuation<UIImage, Error>]] = [:]
    
    /**
     이미지 로드 요청을 대기열에 추가합니다.
     
     - Parameter url: 이미지 URL
     - Parameter continuation: 로드 결과를 받을 CheckedContinuation
     - Returns: 요청이 중복되어 대기열에 추가되었는지 여부
     */
    func addTaskWithCheck (
        for url: NSURL,
        continuation: CheckedContinuation<UIImage, Error>
    ) -> Bool {
        pendingTasks[url, default: []].append(continuation)
        return pendingTasks[url, default: []].count == 1
    }
    
    /**
     이미지 로드 요청을 완료하고, 대기열의 모든 요청에 결과를 전달합니다.
     
     - Parameter url: 완료된 요청의 이미지 URL
     - Parameter image: 로드된 이미지 객체
     */
    func fulfillTask(for url: NSURL, with image: UIImage) {
        guard let continuations = pendingTasks[url] else { return }
        continuations.forEach { $0.resume(returning: image) }
        pendingTasks[url] = nil
    }
    
    /**
     이미지 로드 요청 실패 시, 대기열의 모든 요청에 에러를 전달합니다.
     
     - Parameter url: 실패한 요청의 이미지 URL
     - Parameter error: 발생한 에러 객체
     */
    func failTask(for url: NSURL, with error: Error) {
        guard let continuations = pendingTasks[url] else { return }
        continuations.forEach { $0.resume(throwing: error) }
        pendingTasks[url] = nil
    }
}

final class ImageLoaderService: ImageLoaderServiceProtocol {
    private let session: URLSession
    private let imageLoaderActor = ImageLoaderTaskManager()
    private let cachedImages = NSCache<NSURL, UIImage>()
    
    init(
        session: URLSession = URLSession.createImageSession()
    ) {
        self.session = session
    }
    
    private func getImage(url: NSURL) -> UIImage? {
        cachedImages.object(forKey: url)
    }
    
    func load(url: NSURL) async throws -> UIImage {
        if let cachedImage = getImage(url: url) {
            return cachedImage
        }
        
        do {
            // TODO: 이미지 로더 바꾸기 비동기
            let result = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<UIImage, Error>) in
               Task {
                   if await imageLoaderActor.addTaskWithCheck(
                    for: url,
                    continuation: continuation
                   ) {
                       do {
                           let (data, response) = try await session.data(from: url as URL)
                           guard let response = response as? HTTPURLResponse
                           else {
                               let error = NetworkError.invalidResponse
                               await imageLoaderActor.failTask(for: url, with: error)
                               return
                           }
                           
                           switch response.statusCode {
                           case 200...299:
                               guard let image = UIImage(data: data) else {
                                   let error = ImageLoaderError.imageNotFound
                                   await imageLoaderActor.failTask(for: url, with: error)
                                   return
                               }
                               
                               cachedImages.setObject(image, forKey: url, cost: data.count)
                               await imageLoaderActor.fulfillTask(for: url, with: image)
                               
                           default:
                               let error = NetworkError.statusCodeError(code: response.statusCode)
                               await imageLoaderActor.failTask(for: url, with: error)
                           }
                       }
                       catch {
                           await imageLoaderActor.failTask(
                            for: url,
                            with: error
                           )
                       }
                   }
               }
           }
            return result
        }
        catch let error as NetworkError {
            throw .networkError(error)
        }
        catch let error as ImageLoaderError {
            throw error
        }
        catch {
            throw .networkError(
                .error(error.localizedDescription)
            )
        }
    }
}
