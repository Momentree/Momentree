//
//  RootCoordinatorView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct RootCoordinatorView : View {
    @State var store : StoreOf<RootCoordinator>    
    
    var body : some View {
        WithPerceptionTracking {
            ZStack {
                if store.isLogin {
                    /// 메인 탭 뷰 화면
                    MainCoordinatorView(store: store.scope(state: \.main, action: \.main))
                        .zIndex(1)
                } else {
                    /// 온보딩 화면
                    OnboardingCoordinatorView(store: store.scope(state: \.onboarding, action: \.onboarding))
                        .zIndex(1)
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: .login) .receive(on: RunLoop.main)) { notification in
                print(#function, "onReceive(NotificationCenter.default.publisher(for: .login")
                store.send(.anyAction(.loginComplete))
            }
            .onReceive(NotificationCenter.default.publisher(for: .signUp).receive(on: RunLoop.main)) { notification in
                print(#function, "onReceive(NotificationCenter.default.publisher(for: .login")
                store.send(.anyAction(.signupComplete))
            }
            .onAppear {
                
            }
            .onDisappear {
                
            }
        }
    }
}
