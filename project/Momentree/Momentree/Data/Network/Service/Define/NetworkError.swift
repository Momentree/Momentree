//
//  NetworkError.swift
//  FindBerryMap
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 네트워크 작업 중 발생할 수 있는 오류를 정의합니다.

 - Cases:
   - invalidHTTPBody: 유효하지 않은 HTTP 본문
   - invalidResponse: 유효하지 않은 응답
   - invalidFormat: 유효하지 않은 데이터 형식
   - URLError: URL 관련 오류
   - statusCodeError: HTTP 상태 코드 오류
   - unKnownedError: 알 수 없는 오류
   - error: 일반적인 오류 메시지

 - Note: Equatable 프로토콜을 준수하여 오류 비교가 가능합니다.
 */
public enum NetworkError: Error, Equatable {
    case invalidHTTPBody
    case invalidResponse
    case invalidFormat
    case URLError
    case statusCodeError(code: Int)
    case unKnownedError
    case error(String)
    
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidHTTPBody, .invalidHTTPBody),
             (.invalidResponse, .invalidResponse),
             (.invalidFormat, .invalidFormat),
             (.URLError, .URLError),
             (.unKnownedError, .unKnownedError):
            return true
        case let (.statusCodeError(code1), .statusCodeError(code2)):
            return code1 == code2
        case let (.error(message1), .error(message2)):
            return message1 == message2
        default:
            return false
        }
    }
}

/**
 ImageLoaderError를 NetworkError로 변환합니다.

 - Parameter imageError: 변환할 ImageLoaderError 인스턴스
 - Returns: 변환된 NetworkError 인스턴스
 */
extension NetworkError {
    public static func from(_ imageError: ImageLoaderError) -> NetworkError {
        return imageError.mappingNetworkError()
    }
}

/**
 이미지 로딩 중 발생할 수 있는 오류를 정의합니다.

 - Cases:
   - imageNotFound: 이미지를 찾을 수 없음
   - networkError: 네트워크 관련 오류

 - Note: Equatable 프로토콜을 준수하여 오류 비교가 가능합니다.
 */
public enum ImageLoaderError: Error, Equatable {
    case imageNotFound
    case networkError(NetworkError)

    fileprivate func mappingNetworkError() -> NetworkError {
        switch self {
        case .imageNotFound:
            return .error("Image not found")
        case .networkError(let error):
            return error
        }
    }
}
