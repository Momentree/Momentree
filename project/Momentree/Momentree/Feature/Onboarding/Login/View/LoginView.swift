//
//  LoginView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct LoginView : View {
    let store : StoreOf<LoginFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("로그인 화면")
                
            }
            .onAppear {
                store.send(.viewTransition(.onAppear))
            }

        }
    }
}
