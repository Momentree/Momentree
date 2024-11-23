//
//  DiaryFeature+Function.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation
import ComposableArchitecture

extension DiaryFeature {
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
            case let .networkResponse(response):
                switch response {
                case .create:
                    break
                }
                
            default:
                break
            }
            
            return .none
        }
    }
    
    func buttonTappedReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .buttonTapped(response):
                switch response {
                case .create:
                    let object = Object(day: state.day, content: state.content)
                    return .run { send in
                        do {
                            try await send(
                                .networkResponse(
                                    .create(
                                        networkRepository.create(object: object)
                                    )
                                    
                                )
                            )
                        }
                        catch {
                            
                        }
                    }
                    
                case .cancel:
                    return .none
                }
            default:
                break
            }
            
            return .none
        }
    }
}
