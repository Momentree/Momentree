//
//  Encodable.swift
//  Momentree
//
//  Created by Importants on 11/24/24.
//

import Foundation

extension Encodable {
    /**
     Encodable 타입을 [String: Any] 딕셔너리로 변환합니다.
     
     - Returns: 변환된 [String: Any] 딕셔너리. 변환 실패 시 nil 반환.
     
     이 속성은 Encodable 객체를 JSON 형식의 딕셔너리로 변환합니다.
     JSONEncoder와 JSONSerialization을 사용하여 변환을 수행합니다.
     
     - Note: 변환 과정에서 오류 발생 시 nil을 반환합니다.
     
     Example:
     ```swift
     let user = User(name: "Importants", age: 27) // Encodable 객체
     if let dict = user.toDictionary {
        print(dict) // ["name": "John", "age": 27]
     }
     ```
     */
    var toDictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self)
        else { return nil }
        return (
            try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
            )
        ).flatMap {
            $0 as? [String: Any]
        }
    }
}
