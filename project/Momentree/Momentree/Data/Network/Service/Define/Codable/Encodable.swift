//
//  Encodable.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 요청 본문을 인코딩하는 기능을 정의합니다.

 - Parameter parameters: 인코딩할 파라미터 딕셔너리
 - Returns: 인코딩된 Data 객체, 실패 시 nil 반환
 */
protocol BodyEncoderable {
    func encode(
        _ parameters: [String: Any]
    ) -> Data?
}

/**
 JSON 형식으로 요청 본문을 인코딩하는 구현체입니다.

 - Note: JSONSerialization을 사용하여 파라미터를 JSON 데이터로 변환합니다.
 */
struct JSONBodyEncoder: BodyEncoderable {
    func encode(
        _ parameters: [String: Any]
    ) -> Data? {
        return try? JSONSerialization
            .data(
                withJSONObject: parameters
            )
    }
}
