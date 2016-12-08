//
//  CompositeValidator.swift
//  assetplus
//
//  Created by Sayeed Munawar Hussain on 29/11/16.
//  Copyright © 2016 Sayeed Munawar Hussain. All rights reserved.
//

struct CompositeValidator {
    
    let validators: [UserInputValidator]
    
    init(validators: [UserInputValidator]) {
        self.validators = validators
    }
        
    func validate(_ value: String?) -> (success: Bool, error: String?) {
        
        for validator in validators {
            
            let result = validator.validateValue(value)
            
            switch result {
                
            case .Invalid(let reason):
                return (false, reason)
                
            default:
                break
            }
        }
        
        return (true, nil)
    }
}
