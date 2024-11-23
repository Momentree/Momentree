//
//  DiaryFeature.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct DiaryFeature {
    
    @ObservableState
    struct State : Equatable {
        let id = UUID()
        var content: String = ""
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

    }
    
    enum ViewTransition {

    }
    
    enum AnyAction {

    }
    
    var body : some ReducerOf<Self> {
        BindingReducer()
    }
}
