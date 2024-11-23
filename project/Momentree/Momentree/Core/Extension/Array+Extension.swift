//
//  Array+Extension.swift
//  z-car
//
//  Created by Namuplanet on 9/20/24.
//

extension Array {
    public func flatten() -> [Element] {
        return Array.flatten(0, self)
    }

    // 내부 제네릭 매개변수 이름을 T로 변경
    public static func flatten<T>(_ index: Int, _ toFlat: [T]) -> [T] {
        guard index < toFlat.count else { return [] }

        var flatten: [T] = []

        if let itemArr = toFlat[index] as? [T] {
            flatten = flatten + itemArr.flatten()  // flatten은 여전히 Element를 사용
        } else {
            flatten.append(toFlat[index])
        }

        return flatten + Array.flatten(index + 1, toFlat)
    }
}
