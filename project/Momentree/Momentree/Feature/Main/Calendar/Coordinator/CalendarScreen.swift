//
//  CalendarScreen.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation
import ComposableArchitecture

@Reducer(state: .equatable)
enum CalendarScreen {
    case calendar(CalendarFeature)
    case diary(DiaryFeature)
}
