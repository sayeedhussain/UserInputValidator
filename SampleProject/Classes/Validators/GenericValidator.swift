//
//  GenericValidator.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 29/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

/**
 All generic Validators like email, phone etc reside here.
 */
struct GenericValidator {
        
    func emailValidator() -> CompositeValidator {
        
        let field = "Email" //name of the field that will appear in the error message if validation fails.

        return CompositeValidator(validators: [
            StringNonEmptyValidator(fieldName: field),//shouldn't be empty
            StringNonSpaceValidator(fieldName: field),//shouldn't have spaces
            RegexValidator(fieldName: field, regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")//should satisfy this regex
            ])
    }
    
    
    func phoneNumberValidator() -> CompositeValidator {
        
        let field = "Phone" //name of the field that will appear in the error message if validation fails.

        return CompositeValidator(validators: [
            StringNonEmptyValidator(fieldName: field),//shouldn't be empty
            StringNonSpaceValidator(fieldName: field),//shouldn't have spaces
            StringMinLengthValidator(fieldName: field, minLength: 6),//should be min 6 digits
            StringMaxLengthValidator(fieldName: field, maxLength: 14),//should be max 14 digits
            StringIsIntegersValidator(fieldName: field)//should only be integers
            ])
    }
}
