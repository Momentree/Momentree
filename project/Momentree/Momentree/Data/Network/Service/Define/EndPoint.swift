//
//  EndPoint.swift
//  FindBerryMap
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 HTTP 요청 메서드 타입을 정의합니다.
 - Case
    - get: GET 메서드
    - post: POST 메서드
 */
enum HTTPMethodType: String {
    case get = "GET"
    case post = "POST"
}

/**
 네트워크 요청에 필요한 정보를 정의하는 프로토콜입니다.
 
 이 프로토콜은 URL 요청 생성에 필요한 모든 컴포넌트를 포함합니다.
 
 - Properties:
   - baseURLString: 기본 URL 문자열 (Optional)
   - path: API EndPoint 경로
   - method: HTTP 요청 메서드
   - headerParameters: HTTP Header 파라미터
   - pathParameter: URL Path 파라미터 (Optional)
   - queryParametersEncodable: 인코딩 가능한 Query 파라미터 (Optional)
   - queryParameters: 일반 Query 파라미터
   - bodyParametersEncodable: 인코딩 가능한 Body 파라미터 (Optional)
   - bodyParameters: 일반 Body 파라미터
   - bodyEncoder: 요청 바디 인코더
 */
protocol Requestable {
    var baseURLString: String? { get }
    var path: APIEndPoints.APIPath { get }
    var method: HTTPMethodType { get }
    var headerParameters: [String: String] { get }
    var pathParameter: String? { get }
    var queryParametersEncodable: Encodable? { get }
    var queryParameters: [String: Any] { get }
    var bodyParametersEncodable: Encodable? { get }
    var bodyParameters: [String: Any] { get }
    var bodyEncoder: BodyEncoderable { get }
    
    func urlRequest(
        with config: NetworkConfigurable
    ) throws -> URLRequest
}

extension Requestable {
    func url(
        with config: NetworkConfigurable
    ) throws -> URL {
        
        let baseURL: String
        if let baseURLString = baseURLString {
            baseURL = baseURLString
        }
        else {
            baseURL = config.baseURL
        }
        
        var endpoint = baseURL.appending(path.rawValue)
        
        if let pathParameter = pathParameter {
            endpoint.append("/"+pathParameter)
        }
        
        guard var urlComponent = URLComponents(
            string: endpoint
        ) else { throw NetworkError.URLError }
        
        var urlQueryItems = [URLQueryItem]()
        
        let queryParameters = queryParametersEncodable?.toDictionary ?? self.queryParameters
        
        queryParameters.forEach {
            urlQueryItems.append(
                URLQueryItem(
                    name: $0.key,
                    value: "\($0.value)"
                )
            )
        }
        
        config.queryParameters.forEach {
            urlQueryItems.append(
                URLQueryItem(
                    name: $0.key,
                    value: "\($0.value)"
                )
            )
        }
        
        urlComponent.queryItems = urlQueryItems.isEmpty == false
        ? urlQueryItems
        : nil
        
        guard let url = urlComponent.url
        else { throw NetworkError.URLError }
        
        return url
    }
    
    func urlRequest(
        with config: NetworkConfigurable
    ) throws -> URLRequest {
        let url = try self.url(with: config)
        var urlRequest = URLRequest(url: url)
        var header = config.header
        headerParameters.forEach { header.updateValue($1, forKey: $0) }
        
        urlRequest.addValue("Bearer \(LoginVC.userToken)", forHTTPHeaderField: "Authorization")
        
        let bodyParameters = bodyParametersEncodable?.toDictionary ?? self.bodyParameters
        if bodyParameters.isEmpty == false {
            urlRequest.httpBody = bodyEncoder.encode(bodyParameters)
        }
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = header
        
        return urlRequest
    }
   
}

/**
 응답을 디코딩할 수 있는 요청을 정의하는 프로토콜입니다.
 
 - Associatedtype Response: Response 타입
 - Property responseDecoder: Response 디코더
 */
protocol ResponseRequestable: Requestable {
    associatedtype Response
    
    var responseDecoder: ResponseDecoderable { get }
}

struct EndPoint<R>: ResponseRequestable {
    typealias Response = R
    
    let baseURLString: String?
    let path: APIEndPoints.APIPath
    let method: HTTPMethodType
    let headerParameters: [String : String]
    let pathParameter: String?
    let queryParametersEncodable: Encodable?
    let queryParameters: [String : Any]
    let bodyParametersEncodable: Encodable?
    let bodyParameters: [String : Any]
    let bodyEncoder: BodyEncoderable
    let responseDecoder: ResponseDecoderable
    
    init(
        baseURLString: String? = nil,
        path: APIEndPoints.APIPath,
        method: HTTPMethodType,
        headerParameters: [String : String] = [:],
        pathParameter: String? = nil,
        queryParametersEncodable: Encodable? = nil,
        queryParameters: [String : Any] = [:],
        bodyParametersEncodable: Encodable? = nil,
        bodyParameters: [String : Any] = [:],
        bodyEncoder: BodyEncoderable = JSONBodyEncoder(),
        responseDecoder: ResponseDecoderable = JSONResponseDecoder()
    ) {
        self.baseURLString = baseURLString
        self.path = path
        self.method = method
        self.headerParameters = headerParameters
        self.pathParameter = pathParameter
        self.queryParametersEncodable = queryParametersEncodable
        self.queryParameters = queryParameters
        self.bodyParametersEncodable = bodyParametersEncodable
        self.bodyParameters = bodyParameters
        self.bodyEncoder = bodyEncoder
        self.responseDecoder = responseDecoder
    }
}
