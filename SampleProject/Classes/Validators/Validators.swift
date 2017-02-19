//
//  Validators.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 29/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

import Foundation

enum ValidatorResult {
    
    case Valid
    case Invalid(reason: String)
}

protocol UserInputValidator {
    
    func validateValue(_ value: String?) -> ValidatorResult
}

struct StringNonEmptyValidator: UserInputValidator {
    
    let fieldName: String
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }
        
        if value.isEmpty {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }
        
        if value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).length == 0 {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }
        
        return .Valid
    }
}

struct StringNonSpaceValidator: UserInputValidator {
    
    let fieldName: String
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }

        if value.containsSpaces {
            return ValidatorResult.Invalid(reason: "\(fieldName) has spaces.")
        }
        
        return .Valid
    }
}

struct StringLengthValidator: UserInputValidator {
    
    let fieldName: String
    let length: Int
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }
        
        if value.length != length {
            return ValidatorResult.Invalid(reason: "\(fieldName) should be \(length) characters.")
        }
        
        return .Valid
    }
}

struct StringMaxLengthValidator: UserInputValidator {
    
    let fieldName: String
    let maxLength: Int
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }

        if value.length > maxLength {
            return ValidatorResult.Invalid(reason: "\(fieldName) should be max \(maxLength) characters.")
        }
        
        return .Valid
    }
}

struct StringMinLengthValidator: UserInputValidator {
    
    let fieldName: String
    let minLength: Int
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }

        if value.length < minLength {
            return ValidatorResult.Invalid(reason: "\(fieldName) should be min \(minLength) characters.")
        }
        
        return .Valid
    }
}

struct StringInCharactersValidator: UserInputValidator {
    
    let fieldName: String
    let charactersSet: CharacterSet
    
    init(fieldName: String, characters: String) {
        self.fieldName = fieldName
        self.charactersSet = CharacterSet(charactersIn: characters)
    }
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }

        let _phoneNSString = value as NSString
        
        let invalidSet = self.charactersSet.inverted as NSCharacterSet
        
        let invalidChars = NSMutableString()
        var i : Int = 0
        
        while (i < _phoneNSString.length) {
            let _ch : unichar = _phoneNSString.character(at: i)
            if (invalidSet.characterIsMember(_ch)) {
                invalidChars.appendFormat("%c", _ch)
            }
            i += 1;
        }
        
        if invalidChars.length > 0 {
            return ValidatorResult.Invalid(reason: "\(fieldName) has invalid characters '\(String(invalidChars))'")
        }
        
        return .Valid
    }
}

struct StringIsIntegersValidator: UserInputValidator {
    
    let fieldName: String
    let charactersSet = CharacterSet(charactersIn: "0123456789")
    
    init(fieldName: String) {
        self.fieldName = fieldName
    }
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }

        let _phoneNSString = value as NSString
        
        let invalidSet = self.charactersSet.inverted as NSCharacterSet
        
        let invalidChars = NSMutableString()
        var i : Int = 0
        
        while (i < _phoneNSString.length) {
            let _ch : unichar = _phoneNSString.character(at: i)
            if (invalidSet.characterIsMember(_ch)) {
                invalidChars.appendFormat("%c", _ch)
            }
            i += 1;
        }
        
        if invalidChars.length > 0 {
            return ValidatorResult.Invalid(reason: "\(fieldName) has invalid characters '\(String(invalidChars))'")
        }
        
        return .Valid
    }
}

struct RegexValidator: UserInputValidator {
    
    let fieldName: String
    let regex: String
    
    func validateValue(_ _value: String?) -> ValidatorResult {
        
        guard let value = _value else {
            return ValidatorResult.Invalid(reason: "\(fieldName) is empty.")
        }

        let test = NSPredicate(format:"SELF MATCHES %@", regex)
        
        if !(test.evaluate(with: value)) {
            return ValidatorResult.Invalid(reason: "\(fieldName) is invalid.")
        }
        
        return .Valid
    }
}
