//
//  CalendarView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct AroundView: View {
    @State var store : StoreOf<AroundFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: 16)
//                    TextField("아이디를 입력해주세요", text: $store.userId)
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .frame(width: 48, height: 48)
                    }
                    
                }
                .frame(height: 56)
                .background(.white)
                .overlay(
                    Capsule(style: .circular)
                        .stroke(Color.black, lineWidth: 1)
                )
                .clipShape(Capsule(style: .circular))
                .padding(.horizontal, 20)
            }
            .onAppear {
                
            }
        }
    }
}
