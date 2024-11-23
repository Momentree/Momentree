//
//  LoginView.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import UIKit
import ComposableArchitecture

struct LoginView : View {
    @State var store : StoreOf<LoginFeature>
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                MyViewControllerView()
            }
            .onAppear {
                store.send(.viewTransition(.onAppear))
            }
        }
    }
}

struct MyViewControllerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginVC")
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // 필요 시 업데이트 로직 구현
    }
}
