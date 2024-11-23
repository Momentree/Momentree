//
//  UIDevice+Extension.swift
//  z-car
//
//  Created by Namuplanet on 11/20/24.
//

import SwiftUI
import Foundation

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isMacOS: Bool {
        UIDevice.current.userInterfaceIdiom == .mac
    }
}
