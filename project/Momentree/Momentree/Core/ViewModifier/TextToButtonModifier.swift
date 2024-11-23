//
//  TextToButtonModifier.swift
//  z-car
//
//  Created by Namuplanet on 9/5/24.
//

import Foundation
import SwiftUI

struct TextToButtonModifier : ViewModifier {
    var fontSize : CGFloat
    var weight : Font.Weight = .bold
    var width : CGFloat
    var height : CGFloat
    var cornerRadius : CGFloat = 4
    var textColor : UInt
    var bgColor : UInt
    var isButton : Bool = true
    let action: () -> Void
    
    
    func body(content: Content) -> some View {
        
        if isButton {
            content
                .font(.system(size: fontSize, weight: weight))
                .foregroundStyle(Color(hex: textColor))
                .frame(maxWidth: width, minHeight: height, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(Color(hex: bgColor))
                        .frame(maxWidth: width, minHeight: height, alignment: .center)
                }
                .asButton {
                    action()
                }
        } else {
            content
                .font(.system(size: fontSize, weight: weight))
                .foregroundStyle(Color(hex: textColor))
                .frame(maxWidth: width, minHeight: height, alignment: .center)
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .foregroundColor(Color(hex: bgColor))
                        .frame(maxWidth: width, minHeight: height, alignment: .center)
                }
        }
    }
}

