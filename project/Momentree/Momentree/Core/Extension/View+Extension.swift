//
//  View+Extension.swift
//  z-car
//
//  Created by Namuplanet on 8/27/24.
//

import Foundation
import SwiftUI

extension View {
    func asButton(action: @escaping () -> Void ) -> some View {
        modifier(ButtonWrapper(action: action))
    }
    
    func textBackgroundModifier(width:CGFloat, height:CGFloat, cornerRadius:CGFloat, bgColor:UInt) -> some View {
        modifier(TextBackgroundModifier(width: width, height: height, cornerRadius: cornerRadius, bgColor: bgColor))
    }
    
    func fontModifier(fontSize : CGFloat, weight : Font.Weight, color : UInt) -> some View {
        modifier(FontModifier(fontSize: fontSize, weight: weight, color: Color(hex: color)))
    }
    
    func dynamicFontSizeModifier(lineLimit : Int = 1, scaleFactor : CGFloat = 0.01) -> some View {
        modifier(DynamicFontSizeModifier(lineLimit: lineLimit, scaleFactor: scaleFactor))
    }
    
    func textTobuttonModifier(fontSize : CGFloat, weight : Font.Weight = .bold, width : CGFloat, height:CGFloat, cornerRadius : CGFloat = 4, textColor : UInt, bgColor : UInt, isButton: Bool = true,action: @escaping () -> Void) -> some View{
        modifier(TextToButtonModifier(fontSize: fontSize, weight: .bold, width: width, height: height, cornerRadius: cornerRadius, textColor: textColor, bgColor: bgColor, isButton:isButton, action: action))
    }
    
    func profileImageModifier(width : CGFloat, height : CGFloat, horizontalPadding : CGFloat) -> some View {
        modifier(ProfileImageModifier(width: width, height: height, horizontalPadding: horizontalPadding))
    }
    
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
    
    func redactedModifier(_ isVisible : Bool, redactedType : RedactedModifier.RedactedType = .blur) -> some View {
        modifier(RedactedModifier(isVisible: isVisible, redactedType: redactedType))
    }
}
