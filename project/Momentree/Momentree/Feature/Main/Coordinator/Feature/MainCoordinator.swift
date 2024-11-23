//
//  MainCoordinator.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

@Reducer
struct MainCoordinator {
    @ObservableState
    struct State : Equatable {
        static let initialState = State(selectedTab: .calendar, calendar: .initialState, tree: .initialState, around: .initialState)
        var selectedTab: Tab
        
        var calendar: CalendarCoordinator.State
        var tree: TreeCoordinator.State
        var around: AroundCoordinator.State
    }
    
    enum Action : BindableAction {
        case binding(BindingAction<State>)
        case tabSelected(Tab)
        case calendar(CalendarCoordinator.Action)
        case tree(TreeCoordinator.Action)
        case around(AroundCoordinator.Action)
        case viewTransition(ViewTransition)
        case networkResponse(NetworkReponse)
        case anyAction(AnyAction)
    }
    
    enum Tab : Hashable {
        case calendar
        case tree
        case around
    }
    
    enum ViewTransition {
        
    }
    
    enum NetworkReponse {
        
    }
    
    enum AnyAction {
        
    }
    
    var body : some ReducerOf<Self> {
        BindingReducer()
            
        Scope(state: \.calendar, action: \.calendar) {
            CalendarCoordinator()
        }
        
        Scope(state: \.tree, action: \.tree) {
            TreeCoordinator()
        }

        Scope(state: \.around, action: \.around) {
            AroundCoordinator()
        }
        
        tabSelectedReducer()
        viewTransitionReducer()
        networkResponseReducer()
        anyActionReducer()
    }
}
