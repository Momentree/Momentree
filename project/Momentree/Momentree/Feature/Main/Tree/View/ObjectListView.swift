//
//  ObjectListView.swift
//  Momentree
//
//  Created by Namuplanet on 11/24/24.
//

import SwiftUI
import ComposableArchitecture

struct ObjectListView: View {
    @State var store : StoreOf<ObjectListFeature>
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Text("오브제를 선택해주세요")
                    .fontModifier(fontSize: 20, weight: .bold, color: ColorSystem.black.rawValue)
                    .padding(.bottom, 62)
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(store.imageList, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .frame(width: 56, height: 56)
                            .onTapGesture {
                                store.send(.buttonTapped(.objectSelected(((store.position, image)))))
                            }
                    }
                    .background(Color.clear)
                }
            }
            .onAppear {
                store.send(.viewTransition(.onAppear))
            }
        }
    }
}

