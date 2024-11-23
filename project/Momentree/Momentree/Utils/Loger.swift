//
//  Loger.swift
//  Momentree
//
//  Created by Importants on 11/23/24.
//

import Foundation

/**
 전역적으로 사용되는 로깅 기능을 정의하는 프로토콜입니다.
 
 이 프로토콜은 애플리케이션 전반에 걸쳐 일관된 로깅 메커니즘을 제공합니다.
 */
protocol LoggerInterface {
    /**
     지정된 메시지와 로그 레벨로 로그를 기록합니다.
     
     - Parameters:
         - message: 기록할 로그 메시지
         - level: 로그의 중요도 수준
     */
    func log(_ message: String, level: Logger.Level)
}


/**
 네트워크 서비스에 특화된 로깅 기능을 정의하는 프로토콜입니다.
 
 이 프로토콜은 네트워크 요청과 응답에 대한 상세한 로깅을 제공합니다.
 */
protocol NetworkLoggerInterface {
    /**
     네트워크 Request 정보를 로깅합니다.
     
     - Parameter request: 로깅할 URLRequest 객체
     */
    func logRequest(_ request: URLRequest)
    
    /**
     네트워크 Response 데이터를 로깅합니다.
     
     - Parameter data: 로깅할 응답 데이터
     */
    func logResponse(_ data: Data)
}

final class Logger: LoggerInterface {
    
    enum Level: String {
        case debug = "DEBUG"
        case info = "INFO"
        case warning = "WARNING"
        case error = "ERROR"
    }
    
    static let shared: LoggerInterface = Logger()
    
    private init() {}
    
    func log(_ message: String, level: Level = .info) {
        let timeStamp = ISO8601DateFormatter().string(from: Date())
        print("\(timeStamp) [\(level.rawValue)]:\n \(message)")
    }
}

extension Logger: NetworkLoggerInterface {
    
    static let network: NetworkLoggerInterface = Logger()
    
    func logRequest(_ request: URLRequest) {
        print("\n - - - - - - - - - - Request - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = URLComponents(string: urlAsString)
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        var logMessage = """
      \(urlAsString) \n\n
      \(method) \(path)?\(query) HTTP/1.1 \n
      HOST: \(host)\n
      """
        for (key,value) in request.allHTTPHeaderFields ?? [:] {
            logMessage += "\(key): \(value) \n"
        }
        if let body = request.httpBody {
            logMessage += "\n \(String(data: body, encoding: .utf8) ?? "")"
        }
        log(logMessage, level: .debug)
    }
    
    func logResponse(_ data: Data) {
        print("\n - - - - - - - - - - Response - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        
        var logMessage = ""
        if let responseString = String(data: data, encoding: .utf8)
        {
            logMessage += responseString
        }
        else {
            logMessage += "Error"
        }
        
        log(logMessage, level: .debug)
    }
}
