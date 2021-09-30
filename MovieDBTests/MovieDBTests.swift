//
//  MovieDBTests.swift
//  MovieDBTests
//
//  Created by River Camacho on 9/24/21.
//

import XCTest
@testable import MovieDB

class MovieDBTests: XCTestCase {
    var login = LoginVC()
    override func setUp() {
        login = LoginVC()
    }
    override func tearDown() {
    }
    
    func testEmailValidation() {
        XCTAssertTrue(login.emailValidation("faerfaerfer"))
        XCTAssertFalse(login.emailValidation("12"))
        XCTAssertFalse(login.emailValidation(""))
    }
    
    func testPasswordValidation() {
        XCTAssertTrue(login.passwordValidation("arfaerfaerf"))
        XCTAssertFalse(login.passwordValidation("12"))
        XCTAssertFalse(login.passwordValidation(""))
    }

}
