//
//  AroundCoordinator.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct AroundCoordinatorView : View {
    let store : StoreOf<AroundCoordinator>
    
    var body: some View {
        TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
            switch screen.case {
            case let .around(store):
                AroundView(store: store)
            }
        }
    }
}

@Reducer
struct AroundCoordinator {
    @ObservableState
    struct State : Equatable {
        static let initialState = State(routes: [.root(.around(.init()), embedInNavigationView: true)])
        
        var routes: IdentifiedArrayOf<Route<AroundScreen.State>>
    }
    
    enum Action {
        case router(IdentifiedRouterActionOf<AroundScreen>)
    }
    
    var body : some ReducerOf<Self> {
        Reduce<State, Action> { state, action in
            switch action {
            default :
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
