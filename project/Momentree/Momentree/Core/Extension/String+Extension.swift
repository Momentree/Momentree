//
//  String+Extension.swift
//  z-car
//
//  Created by Namuplanet on 8/27/24.
//

import Foundation
import SwiftUI

// MARK: Util
extension String {
    
    func urlEncode() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
    var toUIImageString: String {
        let imgString1 = self.replacingOccurrences(of: "\n", with: "")
        let imgString2 = imgString1.replacingOccurrences(of: "\\", with: "")
        
        return imgString2
    }
    
    func splitCharacter() -> String {
        return self.split(separator: "").joined(separator: "\u{200B}")
    }
    
    func toInt() -> Int? {
        return Int(self)
    }
    
    func toIntWithoutSeperated() -> Int? {
        // 쉼표 제거
        let cleanedString = self.replacingOccurrences(of: ",", with: "")
        // Int로 변환
        return Int(cleanedString)
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }   
    
    func toDoubleWithoutSeperated() -> Double? {
        // 쉼표 제거
        let cleanedString = self.replacingOccurrences(of: ",", with: "")
        // Int로 변환
        return Double(cleanedString)
    }
    
    func formattedWithSeparator() -> String {
        if let number = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = ","
            return formatter.string(from: NSNumber(value: number)) ?? self
        }
        return self
    }
    
    mutating func insert(string: String, offsetIndex: Int) {
        guard count > offsetIndex else {
            return
        }
        insert(contentsOf: string, at: string.index(string.startIndex, offsetBy: offsetIndex) )
    }
    
    func trim() -> String {
        return trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var isNotBlank: Bool {
        return !self.isBlank
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    var isZero : Bool {
        if self == "0" {
            return true
        } else {
            return false
        }
    }
    
    var isResultY: Bool {
        uppercased() == "Y"
    }
    
    var isNumeric: Bool {
        let numberChars = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberChars) == nil
    }
    
    // LEFT
    // Returns the specified number of chars from the left of the string
    // let str = "Hello"
    // print(str.left(3))         // Hel
    func left(_ to: Int) -> String {
        if self.count <= to {
            return self
        }
        
        return "\(self[..<self.index(startIndex, offsetBy: to)])"
    }
    
    // RIGHT
    // Returns the specified number of chars from the right of the string
    // let str = "Hello"
    // print(str.left(3))         // llo
    func right(_ from: Int) -> String {
        return "\(self[self.index(startIndex, offsetBy: self.count - from)...])"
    }
    
    var prettyString: String {
        guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false), let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
            return self
        }
        
        return json.description.prettyString
    }
    
    var json: [String: AnyObject]? {
        guard let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false), let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
            return nil
        }
        
        return json
    }
    
    var removeCountryCodeAndHyphen : String {
        var temp : String = ""
        
        if (self.starts(with: "+")) {
            var startIndex = self.firstIndex(of: " ") ?? self.endIndex
            startIndex = self.index(after: startIndex)
            
            temp = "0\(self.suffix(from: startIndex))"
        }

        return temp.replacingOccurrences(of: "-", with: "")
    }
    
    func toFormattedDateString() -> String? {
        // ISO 8601 형식의 날짜 파서
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        // 입력된 문자열을 Date로 변환
        if let date = isoDateFormatter.date(from: self) {
            // 원하는 출력 형식 지정
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM.dd"
            
            // Date를 원하는 형식의 문자열로 변환
            return dateFormatter.string(from: date)
        } else {
            return nil // 변환 실패 시 nil 반환
        }
    }
    
    func toFormattedDateStringFormal() -> String? {
        // ISO 8601 형식의 날짜 파서
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        // 입력된 문자열을 Date로 변환
        if let date = isoDateFormatter.date(from: self) {
            // 원하는 출력 형식 지정
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm:ss"
            
            // Date를 원하는 형식의 문자열로 변환
            return dateFormatter.string(from: date)
        } else {
            return nil // 변환 실패 시 nil 반환
        }
    }
    
    func withThousandSeparator() -> String? {
        // 문자열을 숫자로 변환
        guard let number = Double(self) else { return nil }
        
        // NumberFormatter 설정
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "," // 천 단위 구분자 설정
        formatter.maximumFractionDigits = 2 // 소수점 2자리까지 표시
        
        // 숫자를 포맷팅하여 문자열로 변환
        return formatter.string(from: NSNumber(value: number))
    }
    
    func removingNewlinesAndSpaces() -> String {
        return self.components(separatedBy: CharacterSet.whitespacesAndNewlines).joined()
    }
    
    func replacingSpecialCharacters() -> String {
        return self
            .replacingOccurrences(of: "\\r", with: "\r")
            .replacingOccurrences(of: "\\n", with: "\n")
            .replacingOccurrences(of: "<br>", with: "\n")
    }    
    
    func applyFontSizeToLastCharacters(fontSize: CGFloat, count: Int) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let fullRange = NSRange(location: 0, length: self.count)
        let originalFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        
        // Apply the default font to the entire string
        attributedString.addAttribute(.font, value: originalFont, range: fullRange)

        // Apply smaller font to the last 'count' characters
        if self.count >= count {
            let range = NSRange(location: self.count - count, length: count)
            let smallerFont = UIFont.systemFont(ofSize: fontSize)
            attributedString.addAttribute(.font, value: smallerFont, range: range)
        }

        return attributedString
    }
}
