//
//  NetworkService.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 네트워크 서비스를 위한 프로토콜입니다.
 
 이 프로토콜은 네트워크 요청을 수행하고 응답 데이터를 디코딩하는 기능을 정의합니다.
 */
protocol NetworkServiceProtocol {
    /**
     네트워크 요청을 수행하고, 응답 데이터를 JSON 객체로 디코딩합니다.
     
     - Parameter endPoint: 네트워크 요청에 사용될 엔드포인트 정보
     - Returns: 응답 데이터가 디코딩된 모델 객체
     - Throws: 네트워크 요청 실패 시 NetworkError
     */
    func asyncRequest<T: Decodable, E: ResponseRequestable>(with endPoint: E) async throws(NetworkError) -> T where E.Response == T
}

final class NetworkService: NetworkServiceProtocol {
    private let config: NetworkConfigurable
    private let session: URLSession
    
    init(
        config: NetworkConfigurable,
        session: URLSession = URLSession.createDefaultSession()
    ) {
        self.config = config
        self.session = session
    }
    
    func asyncRequest<T: Decodable, E: ResponseRequestable>(
        with endpoint: E
    ) async throws(NetworkError) -> T where E.Response == T {
        do {
            let urlRequest = try endpoint.urlRequest(with: config)
            Logger.network.logRequest(urlRequest)
            
            let (data, response) = try await session.data(for: urlRequest)

            Logger.network.logResponse(data)
            
            return try self.manageResponse(
                data: data,
                response: response,
                decoder: endpoint.responseDecoder
            )
        }
        catch let error as NetworkError {
            throw error
        }
        catch {
            throw .error(error.localizedDescription)
        }
    }
    
    private func manageResponse<T: Decodable>(
        data: Data,
        response: URLResponse,
        decoder: ResponseDecoderable
    ) throws(NetworkError) -> T {
        guard let response = response as? HTTPURLResponse
        else { throw .invalidResponse }
        
        switch response.statusCode {
        case 200...299:
            do {
                return try decoder.decode(data)
            }
            catch {
                throw .invalidFormat
            }

        default:
            throw .statusCodeError(
                code: response.statusCode
            )
        }
    }
}
