//
//  Double+Extension.swift
//  z-car
//
//  Created by Namuplanet on 9/19/24.
//

import Foundation

extension Double {
    
    enum RoundLength : String {
        case one = "%.1f"
        case two = "%.2f"
        case three = "%.3f"
    }
    
    func toString(length : RoundLength = .one) -> String {
        return String(format: length.rawValue, self)
    }
        
    var isZero: Bool {
        return self == 0
    }
}
