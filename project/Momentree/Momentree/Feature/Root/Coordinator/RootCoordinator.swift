//
//  RootCoordinator.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct RootCoordinator {
    @ObservableState
    struct State : Equatable {
        static let initialState = State(main: .initialState, onboarding: .initialState)
        var main : MainCoordinator.State
        var onboarding : OnboardingCoordinator.State
        var isLogin : Bool = false
    }
    
    enum Action : BindableAction {
        case viewTransition(ViewTransition)
        case initialState
        case onboarding(OnboardingCoordinator.Action)
        case main(MainCoordinator.Action)
        case networkResponse(NetworkReponse)
        case anyAction(AnyAction)
        case binding(BindingAction<State>)
    }
    
    enum ViewTransition {

    }
    
    enum NetworkReponse {
    }
    
    enum AnyAction {
        case loginComplete
        case signupComplete
    }
    
    var body : some ReducerOf<Self>  {
        BindingReducer()

        Scope(state: \.main, action: \.main) {
            MainCoordinator()
        }
        Scope(state: \.onboarding, action: \.onboarding) {
             OnboardingCoordinator()
        }
        
        viewTransitionReducer()
        networkResponseReducer()
        anyActionReducer()
    }
}
