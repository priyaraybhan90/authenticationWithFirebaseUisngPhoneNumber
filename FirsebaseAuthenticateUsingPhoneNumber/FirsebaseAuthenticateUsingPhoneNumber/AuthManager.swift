//
//  AuthManager.swift
//  FirsebaseAuthenticateUsingPhoneNumber
//
//  Created by Admin on 10/03/22.
//

import Foundation
import UIKit
import Firebase

class AuthManager: UIViewController, UITextFieldDelegate
{
    static let shared =  AuthManager()

    func getVerificationIdWithNumber(phonenNumber: String){
        Auth.auth().languageCode = "en"

        // Step 4: Request SMS
        PhoneAuthProvider.provider().verifyPhoneNumber(phonenNumber, uiDelegate: nil) { (verificationID, error) in
          if let error = error {
              self.verifyPhoneNumberAlert(message: "enter valid phone number")
              return
          }
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            self.verifyPhoneNumberAlert(message: "Please enter verification code")
 
      }
    }

    func verifyPhoneNumberAlert(message: String) {
        let alert = UIAlertController(title: "Verify Phone", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
          guard let code = alert.textFields?.first?.text, code != ""     else {
          return
     }
            if message == "Please enter verification code"
                
            {
        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")
        
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID ?? "", verificationCode: code)

            
        Auth.auth().signIn(with: credential) { (authResult, error) in
      if let error = error {
          self.verifyPhoneNumberAlert(message: error.localizedDescription)
        } else {
            print(authResult?.user.uid ?? "")
            self.verifyPhoneNumberAlert(message: "Authentication with phone number has been successfull.")

         }
      }
        }
    }
        if message == "Please enter verification code"
        {
       alert.addTextField { textfield in
       textfield.keyboardType = .phonePad
       textfield.textContentType = .oneTimeCode
       textfield.placeholder = "Enter code"
       textfield.delegate = self
        }
      }
      alert.addAction(okAction)
        topmostController()?.present(alert, animated: true, completion: nil)
    }

    
    func topmostController() -> UIViewController? {
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
