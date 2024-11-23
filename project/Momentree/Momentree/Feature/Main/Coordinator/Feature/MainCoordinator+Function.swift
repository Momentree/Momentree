//
//  MainCoordinator+Function.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import ComposableArchitecture
import TCACoordinators

extension MainCoordinator {
    func tabSelectedReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .tabSelected(tab):
                state.selectedTab = tab
            default:
                break
            }
            
            return .none
        }
    }
    
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
