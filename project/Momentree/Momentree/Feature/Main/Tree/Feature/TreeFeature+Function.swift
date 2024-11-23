//
//  TreeFeature+Function.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation
import ComposableArchitecture

extension TreeFeature {
    func viewTransitionReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .viewTransition(.editMode):
                state.editMode = true
                
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

            case .buttonTapped(.objectCancel):
                state.editMode = false
                
            default:
                break
            }
            
            return .none
        }
    }
    
    func anyActionReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case let .anyAction(.objectPosition(position)):
                state.object[position] = .init()
                           
            case let .anyAction(.receiveImage((position, objectId))):
                state.object[position] = objectId
                break
                
            default:
                break
            }
            
            return .none
        }
    }
}
