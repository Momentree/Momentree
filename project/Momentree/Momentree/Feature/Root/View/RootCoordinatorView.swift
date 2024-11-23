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
                /// 온보딩 화면
                OnboardingCoordinatorView(store: store.scope(state: \.onboarding, action: \.onboarding))
                    .zIndex(1)
                
                /// 메인 탭 뷰 화면
                MainCoordinatorView(store: store.scope(state: \.main, action: \.main))
                    .zIndex(1)
            }
            .onAppear {
                
            }
            .onDisappear {
                
            }
        }
    }
}
