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
        WithPerceptionTracking {
            VStack {
                Text("달력")
            }
            .onAppear {
                
            }
        }
    }
}
