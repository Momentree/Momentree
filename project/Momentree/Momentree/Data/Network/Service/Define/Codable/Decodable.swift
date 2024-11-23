//
//  Decodable.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 데이터를 디코딩하는 기능을 정의합니다.

 - Parameter data: 디코딩할 Data 객체
 - Returns: 디코딩된 Decodable 타입의 객체
 - Throws: 디코딩 실패 시 에러 발생
 */
protocol ResponseDecoderable {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

/**
 JSON 형식의 데이터를 디코딩하는 구현체입니다.

 - Note: JSONDecoder를 사용하여 데이터를 디코딩합니다.
 */
class JSONResponseDecoder: ResponseDecoderable {
    private let jsonDecoder = JSONDecoder()
    
    func decode<T>(
        _ data: Data
    ) throws -> T where T : Decodable {
        try jsonDecoder.decode(T.self, from: data)
    }
}
