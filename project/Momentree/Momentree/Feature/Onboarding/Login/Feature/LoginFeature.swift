//
//  LoginFeature.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct LoginFeature {
    
    @ObservableState
    struct State : Equatable {
        let id = UUID()
        var userId: String = ""
        var password: String = ""
        var loginButtonActive: Bool = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case viewTransition(ViewTransition)
        case buttonTapped(ButtonTapped)
        case networkResponse(NetworkReponse)
        case anyAction(AnyAction)
    }
    
    enum ViewTransition {
        case onAppear
        case onDisappear
        
        case goToMain
    }
    
    enum ButtonTapped {
        
    }
    
    enum NetworkReponse {

    }
    
    enum AnyAction {
        case loginComplete
        case signupComplete
    }
    
    var body : some Reducer<State, Action> {
        viewTransitionReducer()
        buttonTappedReducer()
        networkResponseReducer()
        anyActionReducer()
        
    }
}
