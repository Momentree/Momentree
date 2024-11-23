//
//  Color.swift
//  z-car
//
//  Created by Namuplanet on 8/30/24.
//

import SwiftUI

enum ColorSystem: UInt {
    case red = 0xE86161
    case red2 = 0xBB4444
    case black = 0x2D2D2D
    case backgroundLogin = 0xFBF4EE
    case backgroundMain = 0xA7B5E1
    case treeText = 0x766969
    
    var uIntToString: String {
        return String(format: "%06X", self.rawValue)
    }
}



//MARK: - SwiftUI
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

//MARK: - RSSI 값 변경 목적
extension Color {
    static func colorForRSSI(_ rssi: Int) -> Color {
        // RSSI 값을 0 (가장 강한)에서 -100 (가장 약한)으로 설정
        let normalizedValue = Double(rssi + 100) / 100.0
        
        // 약한 신호 (빨간색)에서 강한 신호 (초록색)으로 색상 변화
        return Color(red: 1.0 - normalizedValue, green: normalizedValue, blue: 0.0)
    }
}

//MARK: - UIKit
extension UIColor {
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
//        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
