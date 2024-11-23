//
//  CalendarFeature.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct CalendarFeature {
    
    @ObservableState
    struct State : Equatable {
        let id = UUID()
    }
    
    enum Action : BindableAction {
        case binding(BindingAction<State>)
        case viewTransition(ViewTransition)
        case buttonTapped(ButtonTapped)
        case networkResponse(NetworkReponse)
        case anyAction(AnyAction)
    }
    
    enum NetworkReponse {
        
    }
    
    enum ButtonTapped {
        case goToDiary
    }
    
    enum ViewTransition {
        case sendDayToDiary(Int)
    }
    
    enum AnyAction {

    }
    
    var body : some ReducerOf<Self> {
        BindingReducer()
        
        viewTransitionReducer()
        networkResponseReducer()
        buttonTappedReducer()
    }
}
