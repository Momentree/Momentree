//
//  MomentreeApp.swift
//  Momentree
//
//  Created by Namuplanet on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct MomentreeApp: App {
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(store: Store(initialState: .initialState, reducer: {
                RootCoordinator()
            }))
        }
    }
}
