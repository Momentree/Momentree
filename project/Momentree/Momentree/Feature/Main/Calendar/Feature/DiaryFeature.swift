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
        var day: Int = 0 // FIXME:
    }
    
    enum Action : BindableAction {
        case binding(BindingAction<State>)
        case viewTransition(ViewTransition)
        case buttonTapped(ButtonTapped)
        case networkResponse(NetworkReponse)
        case anyAction(AnyAction)
    }
    
    enum NetworkReponse {
        case create(Result<CreateObjectResponse, NetworkError>)
    }

    enum ButtonTapped {
        case create
        case cancel
    }
    
    enum ViewTransition {

    }
    
    enum AnyAction {
        case receiveDay(Int)
    }
    
    @Dependency(\.networkRepository) var networkRepository
    
    var body : some ReducerOf<Self> {
        BindingReducer()
        
        anyActionReducer()
    }
}
