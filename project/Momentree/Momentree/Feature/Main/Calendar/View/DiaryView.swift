//
//  DiaryView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct DiaryView: View {
    @State var store : StoreOf<DiaryFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack(alignment: .center, spacing: 0) {
                HStack {
                    Button("취소") {
                        store.send(.buttonTapped(.cancel))
                    }
                    .frame(width: 50)
                    Spacer()
                    
                    Button("저장") {
                        store.send(.buttonTapped(.create))
                    }
                }
                .frame(height: 32)
                .font(.system(size: 16, weight: .bold))
                .fontModifier(fontSize: 16, weight: .bold, color: ColorSystem.treeText.rawValue)
                
                Spacer()
                    .frame(height: 20)
                Text("13일 금요일")
                    .foregroundColor(.red)
                    .fontModifier(fontSize: 16, weight: .bold, color: ColorSystem.red.rawValue)
                Spacer()
                    .frame(height: 16)
                Image(systemName: "gift.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.gray)
                Spacer()
                    .frame(height: 20)
                
                TextField(
                    "하루를 기록해주세요.",
                    text: $store.content,
                    axis: .vertical
                )
                    .lineLimit(1...10) // 최소 5줄, 최대 10줄
                    .padding()
                Spacer()
            }
            .padding(.horizontal, 10)
            .onAppear {
                
            }
        }
    }
}

// 12월 1일
// (빨간색)

#Preview {
    DiaryView(store: .init(initialState: .init(), reducer: {
        DiaryFeature()
    }))
}

