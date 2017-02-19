//
//  GenericValidatorTests.swift
//  SampleProject
//
//  Created by Sayeed Munawar Hussain on 08/12/16.
//  Copyright © 2016 *. All rights reserved.
//

import XCTest

class GenericValidatorTests: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }

    func testValidateEmail_Nil() {
        
        let validator = GenericValidator().emailValidator()
        
        let result = validator.validate(nil)
        
        print(result.error!)

        XCTAssertTrue(!result.success)
    }

    func testValidateEmail_Empty() {
        
        let validator = GenericValidator().emailValidator()
        
        let result = validator.validate("")

        print(result.error!)
        
        XCTAssertTrue(!result.success)
    }

    func testValidateEmail_Spaces() {
        
        let validator = GenericValidator().emailValidator()
        
        let result = validator.validate("abc @gmail")
        
        print(result.error!)

        XCTAssertTrue(!result.success)
    }

    func testValidateEmail_Invalid() {
        
        let validator = GenericValidator().emailValidator()
        
        let result = validator.validate("abc@gmail")
        
        print(result.error!)

        XCTAssertTrue(!result.success)
    }

    func testValidateEmail_Valid() {
        
        let validator = GenericValidator().emailValidator()
        
        let result = validator.validate("abc@gmail.com")
        
        XCTAssertTrue(result.success)
    }
    
}
