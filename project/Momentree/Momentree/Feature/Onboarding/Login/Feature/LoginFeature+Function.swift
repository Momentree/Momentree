//
//  LoginFeature+Function.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation
import ComposableArchitecture

extension LoginFeature {
    func viewTransitionReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            default:
                break
            }
            
            return .none
        }
    }
    
    func networkResponseReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
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
    
    func anyActionReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            default:
                break
            }
            
            return .none
        }
    }
}

