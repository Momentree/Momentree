//
//  CalendarCoordinator.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct CalendarCoordinatorView : View {
    let store : StoreOf<CalendarCoordinator>
    
    var body: some View {
        TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
            switch screen.case {
            case let .calendar(store):
                CalendarView(store: store)
            case let .diary(store):
                DiaryView(store: store)
            }
        }
    }
}

@Reducer
struct CalendarCoordinator {
    @ObservableState
    struct State : Equatable, Sendable {
        static let initialState = State(routes: [.root(.calendar(.init()), embedInNavigationView: true)])
        
        var routes: IdentifiedArrayOf<Route<CalendarScreen.State>>
    }
    
    enum Action {
        case router(IdentifiedRouterActionOf<CalendarScreen>)
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
