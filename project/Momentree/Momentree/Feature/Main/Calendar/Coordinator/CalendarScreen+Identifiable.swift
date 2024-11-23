//
//  CalendarScreen+Identifiable.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation

extension CalendarScreen.State : Identifiable {
    var id : ID {
        switch self {
        case .calendar:
                .calendar
        case .diary:
                .diary
        }
    }
    
    enum ID : Identifiable {
        case calendar
        case diary
        var id: ID { self }
    }
}
