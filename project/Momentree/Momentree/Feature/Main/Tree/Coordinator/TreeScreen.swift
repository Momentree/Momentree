//
//  TreeScreen.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation
import ComposableArchitecture

@Reducer(state: .equatable)
enum TreeScreen {
    case tree(TreeFeature)
}
