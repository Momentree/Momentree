//
//  Notification.name+Extension.swift
//  z-car
//
//  Created by Namuplanet on 8/29/24.
//

import Foundation
import UIKit

extension Notification.Name {
    static let naverLoginComplete = Notification.Name(rawValue: "naverLoginComplete")
    static let naverLogoutnaverLoginComplete = Notification.Name(rawValue: "naverLogoutComplete")
    static let keyboardUp = UIResponder.keyboardWillShowNotification
    static let keyboardDown = UIResponder.keyboardWillHideNotification
    static let appVersionCheck = Notification.Name(rawValue: "appVersionCheck")
}
