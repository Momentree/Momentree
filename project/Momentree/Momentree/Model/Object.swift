//
//  Object.swift
//  Momentree
//
//  Created by Importants on 11/24/24.
//

import Foundation

struct Object: Equatable, Decodable {
    var day: Int
    var content: String
    var openStatus: String
    
    init (day: Int, content: String, openStatus: String = "OPEN") {
        self.day = day
        self.content = content
        self.openStatus = openStatus
    }
    
    static func ==(lhs: Object, rhs: Object) -> Bool {
        lhs.day == rhs.day
    }
}
