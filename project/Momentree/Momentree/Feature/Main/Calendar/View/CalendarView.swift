//
//  CalendarView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct CalendarView: View {
    @State var store : StoreOf<CalendarFeature>
    
    var body: some View {
        // uikit 이용시 코드
//        StoryboardRepresentable()
//            .ignoresSafeArea(edges: .top)
        
        LoginRepresentable().ignoresSafeArea(edges: .top)
        
//        WithPerceptionTracking {
//            VStack {
//                Text("달력")
//                
//                Button("다이러이 이동") {
//                    store.send(.buttonTapped(.goToDiary))
//                }
//            }
//            .onAppear {
//            }
//        }
    }
}
