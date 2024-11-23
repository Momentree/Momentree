//
//  ButtonWrapper.swift
//  z-car
//
//  Created by Namuplanet on 8/27/24.
//

import SwiftUI

struct ButtonWrapper: ViewModifier {
    
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(
            action:action,
            label: { content }
        )
    }
}
