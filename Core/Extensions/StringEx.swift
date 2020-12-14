//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit
//import PhoneNumberKit

extension String
{
    /// Returns if a string hasn't whitespaces And Newlines
    var trimmed: String
    {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var localized: String
    {
        return LocalizationManager.shared.localizedString(for: self, value: "")
    }
    
    var html2String: String
    {
        guard let data = data(using: .utf8),
            let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) else {
                return self
        }
        return attributedString.string
    }
    
    func capitalizeFirst() -> String
    {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirst()
    {
        self = capitalizeFirst()
    }
}

// MARK: Validation

extension String
{
    var isNotEmpty: Bool
    {
        return !isEmpty
    }
    
    var isNotEmptyOrSpaces: Bool
    {
        return !isEmptyOrSpaces
    }
    
    var isEmptyOrSpaces: Bool
    {
        return isEmpty || trimmed.isEmpty
    }
    
    func isURL() -> Bool
    {
        return URL(string: self) != nil
    }
    
    func isBirthDateGreaterThan(_ years: Int) -> Bool
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY"
        let dateOfBirth = dateFormatter.date(from: self)!
        
        let today = Date()
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let age = gregorian.components([.year], from: dateOfBirth, to: today, options: [])
        
        if age.year! < years {
            return false
        }
        return true
    }
    
    var isValidEmail: Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let isValid = emailTest.evaluate(with: self)
        return isValid
    }
    
    var isValidName: Bool
    {
        let nameRegEx = "[A-Za-zء-ي]+[[ ._-]?[A-Z0-9a-zء-ي]+]*"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        let isValid = nameTest.evaluate(with: self)
        return isValid
    }
    
//    var isValidPhone: Bool
//    {
//        return PhoneNumberKit().isValidPhoneNumber(self)
//    }
    
    var isValidSaudiNumber: Bool
    {
        guard self.hasPrefix("+966") || self.hasPrefix("00966") else {
            return false
        }
        return true
    }
    
//    func isValidPhoneLength(length: Int) -> Bool
//    {
//        guard count == length && isValidPhone else {
//            return false
//        }
//        return true
//    }
}

// MARK: Subscript

extension String
{
    subscript (i: Int) -> String
    {
        return self[i ..< i + 1]
    }
    
    subscript (r: Range<Int>) -> String
    {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func substring(fromIndex: Int) -> String
    {
        return self[min(fromIndex, count) ..< count]
    }
    
    func substring(toIndex: Int) -> String
    {
        return self[0 ..< max(0, toIndex)]
    }
}
