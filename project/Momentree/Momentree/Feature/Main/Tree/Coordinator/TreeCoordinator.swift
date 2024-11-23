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
            case let .objectAdd(store):
                ObjectListView(store: store)
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
            case let .router(.routeAction(id: .tree, action: .tree(.viewTransition(.objectAdd(position))))):
                state.routes.presentSheet(.objectAdd(.init(position:position)))
                
            case let .router(.routeAction(id: .objectAdd, action: .objectAdd(.buttonTapped(.objectSelected((position, objectId)))))):
                                
                state.routes.dismiss()
                
                return .send(.router(.routeAction(id: .tree, action: .tree(.anyAction(.receiveImage((position, objectId)))))))
                
            default :
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
