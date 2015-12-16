//
//  ValidatorTests.swift
//  Perfect Pitch
//
//  Created by URpin on 12/16/15.
//  Copyright © 2015 Santiago Avila Arroyave. All rights reserved.
//

import XCTest
@testable import Perfect_Pitch

class ValidatorTests: XCTestCase {
    
    var username: String = ""
    var password: String = ""
    
    override func setUp() {
        super.setUp()
        username = "sanarroya"
        password = "contra"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUserNameIsEmpty() {
        XCTAssert(Validator.stringIsEmpty(""))
        XCTAssertFalse(Validator.stringIsEmpty(username))
    }
    
    func testUserHasSpaces() {
        XCTAssert(Validator.stringHasEmptySpace("asvdcuksjv shfdasjcsd "))
        XCTAssertFalse(Validator.stringHasEmptySpace(username))
    }
    
    func testStringHasSpecialCharactersCombination() {
        
    }
    
    func testPasswordIsEqualToUsername() {
        XCTAssertFalse(Validator.passwordIsEqualToUsername(username, password: password))
        XCTAssert(Validator.passwordIsEqualToUsername(username, password: username))
    }
    
    func testEmailIsValid() {
        XCTAssert(Validator.emailIsValid("sanarroya@gmail.com"))
        XCTAssert(Validator.emailIsValid("xxx@xxx.xxx"))
        XCTAssert(Validator.emailIsValid("asdadf@7777.com.co"))
        XCTAssert(Validator.emailIsValid("s.avila@uniandes.edu.co"))
        XCTAssertFalse(Validator.emailIsValid("666@666"))
        XCTAssertFalse(Validator.emailIsValid("#$%%%@@%^%^%^$.*((*(*("))
        XCTAssertFalse(Validator.emailIsValid("sant^"))
        XCTAssertFalse(Validator.emailIsValid("sanarroya@gmail"))
        XCTAssertFalse(Validator.emailIsValid("sanarroya@gmail.*"))
        XCTAssertFalse(Validator.emailIsValid("sanarroyagmail.com"))
        XCTAssertFalse(Validator.emailIsValid("san%^7@gmail.com"))
        XCTAssertFalse(Validator.emailIsValid("sanadbfsfgbfsjds"))
        XCTAssertFalse(Validator.emailIsValid("`~!@#$%^&*()_+{[]};:'\\\"/?.>,<@sghsbuv.,sgsdg"))
        XCTAssertFalse(Validator.emailIsValid("assdfsdf@sasgsdg"))
        XCTAssertFalse(Validator.emailIsValid("^%€"))
        XCTAssertFalse(Validator.emailIsValid(""))
    }
    

    
}
