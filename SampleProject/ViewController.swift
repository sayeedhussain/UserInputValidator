//
//  ViewController.swift
//  SampleProject
//
//  Created by Sayeed Munawar Hussain on 08/12/16.
//  Copyright © 2016 *. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var emailTxtFld: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.emailTxtFld.delegate = self
    }

    @IBAction func submitBtnPressed() {
        
        let validator = GenericValidator.sharedInstance.emailValidator()
        let result = validator.validate(emailTxtFld.text)
        
        if !result.success {//error
            let alert = UIAlertController(title: "Error", message: result.error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        //success
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
