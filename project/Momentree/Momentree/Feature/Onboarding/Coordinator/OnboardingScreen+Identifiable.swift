//
//  OnboardingScreen+Identifiable.swift
//  z-car
//
//  Created by Namuplanet on 8/27/24.
//

extension OnbaordingScreen.State : Identifiable {
    var id : ID {
        switch self {
        case .login:
                .login
        case .sign:
                .sign
        }
    }
    
    enum ID : Identifiable {
        case login
        case sign
        
        var id : ID { self }
    }
}
