//
//  RedactedModifier.swift
//  z-car
//
//  Created by Namuplanet on 10/18/24.
//

import SwiftUI

struct RedactedModifier: ViewModifier {
    var isVisible : Bool
    var redactedType : RedactedType = .blur
    
    func body(content: Content) -> some View {
        switch redactedType {
        case .placeHolder:
            content
                .redacted(reason: isVisible ? [] : .placeholder)
        case .blur:
            content
                .accessibility(label: Text("Blurred"))
                .blur(radius: isVisible ? 0 : 5)
        }
    }
}

extension RedactedModifier {
    enum RedactedType {
        case placeHolder
        case blur
    }
}
