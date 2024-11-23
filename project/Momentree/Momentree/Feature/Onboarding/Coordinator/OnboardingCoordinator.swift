//
//  OnboardingCoordinator.swift
//  z-car
//
//  Created by Namuplanet on 8/27/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct OnboardingCoordinatorView : View {
    let store : StoreOf<OnboardingCoordinator>
    
    var body: some View {
        
        TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
            switch screen.case {
            case let .login(store):
                LoginView(store: store)
            case let .sign(store):
                SignView(store: store)
            }
        }        
    }
}

@Reducer
struct OnboardingCoordinator {
    @ObservableState
    struct State : Equatable {
        static var initialState = State(routes: [.root(.login(.init()), embedInNavigationView: true)])
        var routes : [Route<OnbaordingScreen.State>]
    }
    
    enum Action {
        case router(IndexedRouterActionOf<OnbaordingScreen>)
    }
    
    var body : some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            default:
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
