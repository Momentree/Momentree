//
//  AroundScreen+Identifiable.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation

extension AroundScreen.State : Identifiable {
    var id : ID {
        switch self {
        case .around:
                .around
        }
    }
    
    enum ID : Identifiable {
        case around
        var id: ID { self }
    }
}
