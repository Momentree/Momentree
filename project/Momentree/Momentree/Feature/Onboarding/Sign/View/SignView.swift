//
//  SignView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct SignView : View {
    let store : StoreOf<SignFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("회원가입 화면")
            }
            .onAppear {
                store.send(.viewTransition(.onAppear))
            }

        }
    }
}
