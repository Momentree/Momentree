//
//  SignFeature.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct SignFeature {
    
    @ObservableState
    struct State : Equatable {
        let id = UUID()
        var userId: String = ""
        var password: String = ""
        var confirmPassword: String = ""
        var duplicateActive: Bool = false
        var signActive: Bool = false
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case viewTransition(ViewTransition)
        case buttonTapped(ButtonTapped)
        case networkResponse(NetworkReponse)
    }
    
    enum ViewTransition {
        case onAppear
        case onDisappear
    }
    
    enum ButtonTapped {
        
    }
    
    enum NetworkReponse {

    }
    
    var body : some Reducer<State, Action> {
        viewTransitionReducer()
        buttonTappedReducer()
        networkResponseReducer()
    }
}
