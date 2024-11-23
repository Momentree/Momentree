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
        var object: [Int : String] = [:]
        var objectServer:[Int : String] = [:]
        
        var objectViewoffsetY: CGFloat = 400
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
        case objectSave([Int : String])
        case objectCancel
    }
    
    enum ViewTransition {
        case editMode
        case objectAdd(Int)
    }
    
    enum AnyAction {
        case objectPosition(Int)
        case receiveImage((Int, String))
        case removeImage((Int, String))
    }
    
    var body : some ReducerOf<Self> {
        BindingReducer()
        
        viewTransitionReducer()
        networkResponseReducer()
        buttonTappedReducer()
        anyActionReducer()
    }
}
