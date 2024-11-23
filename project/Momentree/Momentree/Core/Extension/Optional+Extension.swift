//
//  Optional+Extension.swift
//  z-car
//
//  Created by Namuplanet on 8/27/24.
//

import Foundation

extension Optional where Wrapped == String {
    func unwrap(_ placeHolder: String = "") -> Wrapped {
        guard let self = self else { return placeHolder }
        return self
    }
    
    func unwrapZero(_ placeHolder: String = "0") -> Wrapped {
        guard let self = self else { return placeHolder }
        return self
    }
    
    func isNilOrEmpty() -> Bool {
        return self?.isEmpty ?? true
    }
}

extension Optional where Wrapped == Float {
    var orZero: Float {
        return self ?? 0
    }
}

extension Optional where Wrapped == Double {
    var orZero: Double {
        return self ?? 0
    }
}
