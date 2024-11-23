//
//  TreeCoordinatorView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct TreeCoordinatorView : View {
    let store : StoreOf<TreeCoordinator>

    var body: some View {
        TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
            switch screen.case {
            case let .tree(store):
                TreeView(store: store)
            }
        }
    }
}

@Reducer
struct TreeCoordinator {
    @ObservableState
    struct State : Equatable {
        static var initialState = State(routes: [.root(.tree(.init()), embedInNavigationView: true)])
        
        var routes: IdentifiedArrayOf<Route<TreeScreen.State>>
    }
    
    enum Action {
        case router(IdentifiedRouterActionOf<TreeScreen>)
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
