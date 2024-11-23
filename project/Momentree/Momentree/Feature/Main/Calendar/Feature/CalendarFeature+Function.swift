//
//  CalendarFeature+Function.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation
import ComposableArchitecture

extension CalendarFeature {
    func viewTransitionReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewTransition(.onAppear):
                return .run { send in
                    try await send(
                        .networkResponse(.getList(networkRepository.getList()))
                    )
                }
            default:
                break
            }
            
            return .none
        }
    }
    
    func networkResponseReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .networkResponse(.getList(objects)):
                state.objects = objects
                
            default:
                break
            }
            
            return .none
        }
    }
    
    func buttonTappedReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {

            default:
                break
            }
            
            return .none
        }
    }
}
