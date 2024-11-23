//
//  SignView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct SignView : View {
    @State var store : StoreOf<SignFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 0) {
                Spacer()
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 182, height: 182)
                Spacer()
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                            .frame(width: 20)
                        TextField("아이디", text: $store.password)
                    }
                    .frame(height: 56)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 4))
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("중복 확인")
                            Spacer()
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 10)
                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: 20)
                    TextField("비밀번호", text: $store.password)
                }
                .frame(height: 56)
                .background(.white)
                .clipShape(.rect(cornerRadius: 4))
                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: 20)
                    TextField("비밀번호 확인", text: $store.password)
                }
                .frame(height: 56)
                .background(.white)
                .clipShape(.rect(cornerRadius: 4))
                Spacer()
                    .frame(height: 20)
                Button{
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("회원가입")
                            .foregroundStyle(.white)
                        Spacer()
                    }
                }
                .frame(height: 56)
                .clipShape(.rect(cornerRadius: 4))
                .background(
                    Color(
                        hex: store.signActive ? ColorSystem.red.rawValue : ColorSystem.disable.rawValue
                    )
                )
                
                
                Spacer()
                    .frame(height: 40)
                
                VStack(spacing: 0) {
                    Text("멘트리가 처음이신가요?")
                    HStack(spacing: 0) {
                        Text("여기를 눌러 ")
                        Text("회원가입")
                            .underline()
                            .foregroundColor(Color(hex: ColorSystem.underline.rawValue)) // 클릭 가능한 텍스트임을 나타내기 위한 색상 변경
                            .onTapGesture {
                                // 여기에 회원가입 클릭 시 실행할 코드 작성
                                // 예: viewStore.send(.signUpTapped)
                            }
                        Text("을 진행해주세요.")
                    }
                }
                .fontModifier(fontSize: 12, weight: .medium, color: ColorSystem.treeText.rawValue)
                
                Spacer()
                    .frame(height: 106)
            }
            .padding(.horizontal, 20)
            .background(Color(hex: ColorSystem.backgroundLogin.rawValue))
            .onAppear {
                store.send(.viewTransition(.onAppear))
            }

        }
    }
}

#Preview {
    SignView(store: .init(initialState: .init(), reducer: {
        SignFeature()
    }))
}
