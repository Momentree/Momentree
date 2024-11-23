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
        var objects = [Object]()
    }
    
    enum Action : BindableAction {
        case binding(BindingAction<State>)
        case viewTransition(ViewTransition)
        case buttonTapped(ButtonTapped)
        case networkResponse(NetworkReponse)
        case anyAction(AnyAction)
    }
    
    enum NetworkReponse {
        case getList([Object])
    }
    
    enum ButtonTapped {
        case goToDiary
    }
    
    enum ViewTransition {
        case sendDayToDiary(Int)
        case onAppear
    }
    
    enum AnyAction {

    }
    
    @Dependency(\.networkRepository) var networkRepository
    
    var body : some ReducerOf<Self> {
        BindingReducer()
        
        viewTransitionReducer()
        networkResponseReducer()
        buttonTappedReducer()
        viewTransitionReducer()
    }
}
