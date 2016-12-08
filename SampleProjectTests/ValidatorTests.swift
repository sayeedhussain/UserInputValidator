//
//  SampleProjectTests.swift
//  SampleProjectTests
//
//  Created by Sayeed Munawar Hussain on 08/12/16.
//  Copyright © 2016 *. All rights reserved.
//

import XCTest

//To avoid launching iOS Simulator, we are testing Validators as macOS unit tests.

class ValidatorTests: XCTestCase {
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
    
    //MARK:- StringNonEmptyValidator
    
    func testStringNonEmpty_Nil() {
        
        let result = StringNonEmptyValidator(fieldName: "MyField").validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }

    func testStringNonEmpty_Empty() {
        
        let result = StringNonEmptyValidator(fieldName: "MyField").validateValue("")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringNonEmpty_Valid() {
        
        let result = StringNonEmptyValidator(fieldName: "MyField").validateValue("A")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    //MARK:- StringNonSpaceValidator

    func testStringNonSpace_Nil() {
        
        let result = StringNonSpaceValidator(fieldName: "MyField").validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }

    func testStringNonSpace_Space() {
        
        let result = StringNonSpaceValidator(fieldName: "MyField").validateValue("ABC ")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringNonSpace_Valid() {
        
        let result = StringNonSpaceValidator(fieldName: "MyField").validateValue("A")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    //MARK:- StringLengthValidator

    func testStringLength_Nil() {
        
        let result = StringLengthValidator(fieldName: "MyField", length: 6).validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringLength_Invalid() {
        
        let result = StringLengthValidator(fieldName: "MyField", length: 4).validateValue("A")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringLength_Valid() {
        
        let result = StringLengthValidator(fieldName: "MyField", length: 3).validateValue("ABC")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    //MARK:- StringMaxLengthValidator
    
    func testStringMaxLength_Nil() {
        
        let result = StringMaxLengthValidator(fieldName: "MyField", maxLength: 6).validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringMaxLength_Invalid() {
        
        let result = StringMaxLengthValidator(fieldName: "MyField", maxLength: 4).validateValue("ABCDEFGH")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringMaxLength_Valid1() {
        
        let result = StringMaxLengthValidator(fieldName: "MyField", maxLength: 3).validateValue("ABC")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }

    func testStringMaxLength_Valid2() {
        
        let result = StringMaxLengthValidator(fieldName: "MyField", maxLength: 3).validateValue("A")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    //MARK:- StringMinLengthValidator
    
    func testStringMinLength_Nil() {
        
        let result = StringMinLengthValidator(fieldName: "MyField", minLength: 6).validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringMinLength_Invalid() {
        
        let result = StringMinLengthValidator(fieldName: "MyField", minLength: 10).validateValue("A")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringMinLength_Valid1() {
        
        let result = StringMinLengthValidator(fieldName: "MyField", minLength: 3).validateValue("ABC")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    func testStringMinLength_Valid2() {
        
        let result = StringMinLengthValidator(fieldName: "MyField", minLength: 3).validateValue("ABCDEFGH")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    //MARK:- StringInCharactersValidator
    
    func testStringInCharacters_Nil() {
        
        let result = StringInCharactersValidator(fieldName: "MyField", characters: "ABCDE").validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringInCharacters_Invalid() {
        
        let result = StringInCharactersValidator(fieldName: "MyField", characters: "ABCDE").validateValue("ABCDE123")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringInCharacters_Valid1() {
        
        let result = StringInCharactersValidator(fieldName: "MyField", characters: "ABCDE").validateValue("ABC")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    func testStringInCharacters_Valid2() {
        
        let result = StringInCharactersValidator(fieldName: "MyField", characters: "ABCDE").validateValue("ABCDE")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
    //MARK:- StringIsIntegersValidator
    
    func testStringIsIntegers_Nil() {
        
        let result = StringIsIntegersValidator(fieldName: "MyField").validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testStringIsIntegers_Invalid1() {
        
        let result = StringIsIntegersValidator(fieldName: "MyField").validateValue("A12345")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }

    func testStringIsIntegers_Invalid2() {
        
        let result = StringIsIntegersValidator(fieldName: "MyField").validateValue("123.12")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }

    func testStringIsIntegers_Valid() {
        
        let result = StringIsIntegersValidator(fieldName: "MyField").validateValue("12345")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }

    //MARK:- RegexValidator

    func testRegex_Nil() {
        
        let result = RegexValidator(fieldName: "MyField", regex: "[A-Z0-9a-z._%+-]").validateValue(nil)
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testRegex_Invalid() {
        
        let result = RegexValidator(fieldName: "MyField", regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").validateValue("abc@pqr")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            break
            
        default:
            XCTAssertTrue(false)
        }
    }
    
    func testRegex_Valid() {
        
        let result = RegexValidator(fieldName: "MyField", regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").validateValue("abc@gmail.com")
        
        switch result {
            
        case .Invalid(let reason):
            print(reason)
            XCTAssertTrue(false)
            
        default:
            break
        }
    }
    
}
