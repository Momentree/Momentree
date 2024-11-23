//
//  OnbaordingScreen.swift
//  z-car
//
//  Created by Namuplanet on 8/27/24.
//

import Foundation
import ComposableArchitecture

@Reducer(state: .equatable)
enum OnbaordingScreen {
    case login(LoginFeature)
    case sign(SignFeature)
}
