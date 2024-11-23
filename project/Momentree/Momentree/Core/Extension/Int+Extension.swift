//
//  Int+Extension.swift
//  z-car
//
//  Created by Namuplanet on 9/4/24.
//

import Foundation

extension Int {
    /**
     ex) ordinal
     english: 25 -> 25th
     korean : 25 -> 25번째
     */
    var ordinal: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        return numberFormatter.string(from: self as NSNumber) ?? String(self)
    }
    
    var withComma: String {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = .decimal
        return decimalFormatter.string(from: self as NSNumber) ?? String(self)
    }
    
    var string: String {
        return String(self)
    }
    
    var decimalCurrency: String {
        return self.withComma
    }
    
    func isZero() -> Bool {
        return self == 0
    }
    
    func isLessThan(_ other: Int) -> Bool {
        return self < other
    }
    
    func isLessOr(_ other: Int) -> Bool {
        return self <= other
    }
    
    func isMoreThan(_ other: Int) -> Bool {
        return self > other
    }
    
    func isMoreOr(_ other: Int) -> Bool {
        return self >= other
    }
}

extension Int64 {
    var withComma: String {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = NumberFormatter.Style.decimal
        decimalFormatter.groupingSeparator = ","
        decimalFormatter.groupingSize = 3
        
        return decimalFormatter.string(from: self as NSNumber) ?? String(self)
    }
}

extension Int {
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    
    var toDobule : Double {
        return Double(self)
    }
}
