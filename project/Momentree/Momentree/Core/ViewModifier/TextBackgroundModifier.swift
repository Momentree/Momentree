//
//  TextBackgroundModifier.swift
//  z-car
//
//  Created by Namuplanet on 9/12/24.
//

import SwiftUI

struct TextBackgroundModifier : ViewModifier {
    var width : CGFloat
    var height : CGFloat
    var cornerRadius : CGFloat = 4
    var bgColor : UInt
    
    func body(content: Content) -> some View {
        content
            .fixedSize(horizontal: true, vertical: false)
            .padding()
            .frame(width: width, height: height)
            .background(
                Rectangle()
                    .fill(Color(hex: bgColor))
                    .cornerRadius(cornerRadius)
            )
    }
}
