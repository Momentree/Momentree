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
                                    store.send(.buttonTapped(.objectSave(store.object)))
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
                    Text(store.editMode ? "공간을 선택해주세요": "`\(store.userId)`의 트리")
                        .fontModifier(fontSize: store.editMode ? 20 : 24, weight: .bold, color: ColorSystem.black.rawValue)
                        .padding(.top, 22)

                    Spacer()
                    
                    Image(.mainTree)
                        .padding(.bottom, 30)
                }
            
                if store.editMode {
                    VStack(spacing: 1) {
                        objectItem(position: 1)
                        
                        HStack(spacing: 0) {
                            objectItem(position: 2)
                            objectItem(position: 3)
                        }
                        
                        HStack(spacing: 0) {
                            objectItem(position: 4)
                            objectItem(position: 5)
                            objectItem(position: 6)
                        }
                        
                        HStack(spacing: 0) {
                            objectItem(position: 7)
                            objectItem(position: 8)
                            objectItem(position: 9)
                            objectItem(position: 10)
                        }
                        
                        HStack(spacing: 0) {
                            objectItem(position: 11)
                            objectItem(position: 12)
                            objectItem(position: 13)
                            objectItem(position: 14)
                        }
                        .padding(.trailing, 21)
                        
                        HStack(spacing: 0) {
                            objectItem(position: 15)
                            objectItem(position: 16)
                            objectItem(position: 17)
                            objectItem(position: 18)
                        }
                    }
                } else {
                    VStack(spacing: 1) {
                        objectServerItem(position: 1)
                        
                        HStack(spacing: 0) {
                            objectServerItem(position: 2)
                            objectServerItem(position: 3)
                        }
                        
                        HStack(spacing: 0) {
                            objectServerItem(position: 4)
                            objectServerItem(position: 5)
                            objectServerItem(position: 6)
                        }
                        
                        HStack(spacing: 0) {
                            objectServerItem(position: 7)
                            objectServerItem(position: 8)
                            objectServerItem(position: 9)
                            objectServerItem(position: 10)
                        }
                        
                        HStack(spacing: 0) {
                            objectServerItem(position: 11)
                            objectServerItem(position: 12)
                            objectServerItem(position: 13)
                            objectServerItem(position: 14)
                        }
                        .padding(.trailing, 21)
                        
                        HStack(spacing: 0) {
                            objectServerItem(position: 15)
                            objectServerItem(position: 16)
                            objectServerItem(position: 17)
                            objectServerItem(position: 18)
                        }
                    }
                }
            }
            .animation(.easeIn(duration: 0.2), value: store.editMode)
        }
    }
}

extension TreeView {
    fileprivate func objectItem(position : Int) -> some View {
        return Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5, 3]))
            .foregroundStyle(Color(hex: ColorSystem.objectStroke.rawValue))
            .frame(width: 80, height: 80)
            .overlay {
                if let objectId = store.object[position], !objectId.isEmpty {
                    Image(objectId)
                        .resizable()
                        .frame(width: 56, height: 56)
                        .asButton {
                            store.send(.anyAction(.removeImage((position, objectId))))
                        }
                } else {
                    Image(.objectAdd)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .asButton {
                            store.send(.anyAction(.objectPosition(position)))
                            store.send(.viewTransition(.objectAdd(position)))
                        }
                }
            }
    }
    
    fileprivate func objectServerItem(position : Int) -> some View {
        return Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5, 3]))
            .foregroundStyle(Color.clear)
            .frame(width: 80, height: 80)
            .overlay {
                if let objectId = store.objectServer[position], !objectId.isEmpty {
                    Image(objectId)
                        .resizable()
                        .frame(width: 56, height: 56)
                }
            }
    }
}

