# Validators
A simple library to validate any kind of user input like Email, Name, Phone, OTP etc.

# Credits
To give credit where it's due, this library is based on ideas mentioned here http://hotcocoatouch.com/2016/11/16/composite-validators

# Installation
Download and import the source.

# Usage

    let emailValidator = CompositeValidator(validators: [
        StringNonEmptyValidator(fieldName: "email"),//shouldn't be empty
        StringNonSpaceValidator(fieldName: "email"),//shouldn't have spaces
        RegexValidator(fieldName: "email", regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")//should satisfy this regex
    ]
            
    let result = emailValidator.validate("abc@gmail")
                    
    if !result.success {
      print(result.error)//prints "Email is invalid."
    }

            
