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
            ZStack {
                Color(hex: ColorSystem.backgroundMain.rawValue)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        if store.editMode {
                            Text("취소")
                                .fontModifier(fontSize: 16, weight: .bold, color: ColorSystem.treeText.rawValue)
                                .padding(EdgeInsets(top: 6.5, leading: 10, bottom: 6.5, trailing: 10))
                                .asButton {
                                    store.send(.buttonTapped(.objectCancel))
                                }
                        }
                        
                        Spacer()
                        if store.editMode {
                            Text("저장")
                                .fontModifier(fontSize: 16, weight: .bold, color: ColorSystem.treeText.rawValue)
                                .padding(EdgeInsets(top: 6.5, leading: 10, bottom: 6.5, trailing: 10))
                                .asButton {
                                    store.send(.buttonTapped(.objectSave))
                                }
                        } else {
                            Text("꾸미기")
                                .fontModifier(fontSize: 16, weight: .bold, color: ColorSystem.treeText.rawValue)
                                .padding(EdgeInsets(top: 6.5, leading: 10, bottom: 6.5, trailing: 10))
                                .asButton {
                                    store.send(.viewTransition(.editMode))
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    Spacer()
                }
                .padding(.top, 20)
                
                VStack {
                    if !store.editMode {
                        Text("`\(store.userId)`의 트리")
                            .fontModifier(fontSize: 24, weight: .bold, color: ColorSystem.black.rawValue)
                            .padding(.top, 22)
                    }

                    Spacer()
                    
                    Image(.mainTree)
                        .padding(.bottom, 20)
                }
                
            }
            .animation(.easeIn(duration: 0.2), value: store.editMode)
        }
    }
}
