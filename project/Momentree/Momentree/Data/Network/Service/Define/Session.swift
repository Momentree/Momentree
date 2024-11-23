//
//  Session.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

extension URLSession {
    static func createDefaultSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        
        return URLSession(configuration: configuration)
    }
    
    static func createImageSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        
        return URLSession(configuration: configuration)
    }
}
