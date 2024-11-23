//
//  ProfileImageModifier.swift
//  z-car
//
//  Created by Namuplanet on 9/5/24.
//

import SwiftUI

struct ProfileImageModifier : ViewModifier {
    
    var width : CGFloat
    var height : CGFloat
    var horizontalPadding : CGFloat
    
    func body(content : Content) -> some View {
        content
            .edgesIgnoringSafeArea(.all)
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipShape(Circle())
            .padding(.horizontal, horizontalPadding)
    }
}
