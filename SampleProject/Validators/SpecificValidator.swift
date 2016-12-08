//
//  SpecificValidator.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 29/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

/**
 All app specific Validators like firstName, lastName, OTP etc. reside here.
 */
struct SpecificValidator {
    
    static let sharedInstance = SpecificValidator()
    
    func passwordValidator() -> CompositeValidator {
        
        let field = "Password" //name of the field that will appear in the error message if validation fails.
        
        return CompositeValidator(validators: [
            StringNonEmptyValidator(fieldName: field),//shouldn't be empty
            StringNonSpaceValidator(fieldName: field),//shouldn't have spaces
            StringMinLengthValidator(fieldName: field, minLength: 6),//should be minimum length 6
            ])
    }
    
    func otpValidator() -> CompositeValidator {
        
        let field = "OTP" //name of the field that will appear in the error message if validation fails.
        
        return CompositeValidator(validators: [
            StringNonEmptyValidator(fieldName: field),//shouldn't be empty
            StringNonSpaceValidator(fieldName: field),//shouldn't have spaces
            StringLengthValidator(fieldName: field, length: 4),//should be of length 4
            StringIsIntegersValidator(fieldName: field)//should only be integers
            ])
    }

    //Other specific validators can go here
}
