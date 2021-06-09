//
//  LoginViewModel.swift
//  login
//
//  Created by ishwar lal janwa on 09/06/21.
//

import Foundation

class LoginViewModel: NSObject {

     var email : String = ""
     var password : String = ""
    
    override init() {
        super.init()

    }
}

//MARK:- Validation
extension LoginViewModel {
    
    func validateData(_ txtEmail:DTTextField , txtPassword:DTTextField) -> Bool {
        self.email = txtEmail.text ?? ""
        self.password = txtPassword.text ?? ""
    
        guard !self.email.isBlank else {
            txtEmail.showError(message: "Email can't be blank.")
            return false
        }
        
        guard self.email.isValidEmail else {
            txtEmail.showError(message: "This is a invalid email.")
            return false
        }
        
        guard !self.password.isBlank else {
            txtPassword.showError(message: "Password can't be blank.")
            return false
        }

        guard self.password.isValidPassword else {
            txtPassword.showError(message: "Passwords require at least 1 uppercase, 1 lowercase, and 1 number.")
            return false
        }
        
        return true
    }
}
