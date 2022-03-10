//
//  ViewController.swift
//  FirsebaseAuthenticateUsingPhoneNumber
//
//  Created by Admin on 09/03/22.
//

import UIKit
import Firebase

class PhoneNumberAuthController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtPhoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // Step 3 (Optional) - Default language is English
      
        // Do any additional setup after loading the view.
        addDoneButtonOnKeyboard()

    }
    @IBAction func btnVerifyPhoneNumberPressed(_ sender: Any) {
        AuthManager.shared.getVerificationIdWithNumber(phonenNumber: "+" + (txtPhoneNumber.text ?? ""))

    }
    
    // MARK : UITextFieldDelegate
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtPhoneNumber.resignFirstResponder()
        return true
    }
    
    func addDoneButtonOnKeyboard()
    {

    }

    func doneButtonAction()
    {
        self.txtPhoneNumber.resignFirstResponder()
    }
}

