//
//  Image+Extension.swift
//  z-car
//
//  Created by Namuplanet on 9/5/24.
//

import SwiftUI
import UIKit

extension Image {
    init?(data: Data) {
        if let uiImage = UIImage(data: data) {
            self = Image(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
