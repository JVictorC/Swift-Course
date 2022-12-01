//
//  StringUtils.swift
//  Introducao-XcTest
//
//  Created by Joao Victor on 29/07/22.
//

import Foundation

extension String {
    func removeWhiteSpaces() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
    func replace(string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: .literal, range: nil)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
