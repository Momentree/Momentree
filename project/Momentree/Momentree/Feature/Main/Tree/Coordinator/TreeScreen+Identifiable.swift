//
//  TreeScreen+Identifiable.swift
//  TCATemplate
//
//  Created by Namuplanet on 11/23/24.
//

import Foundation

extension TreeScreen.State : Identifiable {
    var id : ID {
        switch self {
        case .tree:
                .tree
        }
    }
    
    enum ID : Identifiable {
        case tree
        var id: ID { self }
    }
}
