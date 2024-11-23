//
//  LoginView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct LoginView : View {
    @State var store : StoreOf<LoginFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                VStack(spacing: 0) {
                    TextField("아이디", text: $store.userId)
                    Spacer()
                        .frame(height: 10)
                    TextField("비밀번호", text: $store.password)
                    Spacer()
                        .frame(height: 20)
                    Button("로그인"){
                        
                    }
                    
                }
            }
            .onAppear {
                store.send(.viewTransition(.onAppear))
            }
        }
    }
}


#Preview {
    LoginView(store: .init(initialState: .init(), reducer: {
        LoginFeature()
    }))
}
