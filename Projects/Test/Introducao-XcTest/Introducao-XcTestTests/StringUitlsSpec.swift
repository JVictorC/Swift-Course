//
//  StringUitlsSpec.swift
//  Introducao-XcTestTests
//
//  Created by Joao Victor on 29/07/22.
//

import XCTest
@testable import Introducao_XcTest

class StringUitlsSpec: XCTestCase {
    func testIsValidEmail() {
        let email = "curso@gmail.com"
        
        let value = email.isValidEmail()
        
        XCTAssertTrue(value, "Esperava que fosse um email valido")
    }
    
    
    func testRemoveWhiteSpaces() {
        let string = "teste para remover espacos"
        
        let stringWithouSpaces = string.removeWhiteSpaces()
        
        
        XCTAssert(stringWithouSpaces == "testepararemoverespacos")
    }

}
