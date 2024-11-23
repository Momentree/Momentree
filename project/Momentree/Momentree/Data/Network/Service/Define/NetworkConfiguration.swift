//
//  NetworkConfiguration.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 네트워크 설정을 위한 구성 요소를 정의합니다.

 이 프로토콜은 네트워크 요청에 필요한 기본적인 설정을 제공합니다.

 - Properties:
   - baseURL: API의 기본 URL 문자열
   - header: HTTP 요청 헤더에 포함될 키-값 쌍
   - queryParameters: URL 쿼리 파라미터로 사용될 키-값 쌍

 - Note:NetworkConfigurable을 통해 네트워크 요청의 기본 구성을 제공해야 합니다.
 */
protocol NetworkConfigurable {
    var baseURL: String { get set }
    var header: [String: String] { get }
    var queryParameters: [String: Any] { get }
}

struct NetworkConfiguration: NetworkConfigurable {
    var baseURL: String
    let header: [String: String]
    let queryParameters: [String: Any]
    
    init(
        baseURL: String,
        header: [String : String] = [:],
        queryParameters: [String : Any] = [:]
    ) {
        var baseURL = baseURL
        if baseURL.hasSuffix("/") == false {
            baseURL.append("/")
        }
        self.baseURL = baseURL
        self.header = header
        self.queryParameters = queryParameters
    }
}
