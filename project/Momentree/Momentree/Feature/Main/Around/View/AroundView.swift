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
                Text("둘러보기")
            }
            .onAppear {
                
            }
        }
    }
}
