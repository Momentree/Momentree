//
//  LoginFeature.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct LoginFeature {
    
    @ObservableState
    struct State : Equatable {
        let id = UUID()
    }
    
    enum Action {
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
