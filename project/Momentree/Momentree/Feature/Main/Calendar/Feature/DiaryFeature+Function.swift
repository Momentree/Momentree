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
                case let .create(result):
                    return .send(.viewTransition(.goBack))
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
                            // Server Error
                            // -> 팝업
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
    
    func anyActionReducer() -> some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case let .anyAction(.receiveDay(day)):
                state.day = day
                
            default:
                break
            }
            
            return .none
        }
    }
}

// 뷰에 들어왔을 때 데이터를 찔려서 보여주기
