//
//  ObjectListFeature.swift
//  Momentree
//
//  Created by Namuplanet on 11/24/24.
//

import SwiftUI
import UIKit
import ComposableArchitecture

@Reducer
struct ObjectListFeature {
    
    @ObservableState
    struct State : Equatable {
        let id = UUID()
        let imageList : [String] = ObjectList.allCases.map { $0.rawValue }
        
        var position : Int = 0
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
        case objectSelected((Int, String))
    }
    
    enum ViewTransition {
        case onAppear
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
