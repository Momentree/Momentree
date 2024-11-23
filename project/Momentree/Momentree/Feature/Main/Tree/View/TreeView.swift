//
//  TreeView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct TreeView: View {
    @State var store : StoreOf<TreeFeature>
    
    var body: some View {
        
        WithPerceptionTracking {
            VStack {
                Text("크리마스 트리")
            }
            .onAppear {
                
            }
        }
    }
}
