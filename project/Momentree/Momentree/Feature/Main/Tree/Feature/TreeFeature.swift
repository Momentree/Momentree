//
//  TreeFeature.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct TreeFeature {
    
    @ObservableState
    struct State : Equatable {
        let id = UUID()
        var userId : String = "ID"
        var editMode : Bool = false
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
        case objectSave
        case objectCancel
    }
    
    enum ViewTransition {
        case editMode
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
