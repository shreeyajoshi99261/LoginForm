//
//  Extension.swift
//  login
//
//  Created by ishwar lal janwa on 09/06/21.
//

import Foundation

//MARK:- String -
extension String {
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isBlank:Bool {
        return self.trim.isEmpty
    }
    
    var isValidEmail: Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let predicate = NSPredicate(
            format:"SELF MATCHES %@",
            emailRegEx
        )
        return predicate.evaluate(with:self.trim)
    }
    
    var isValidPassword: Bool {
        
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{3,16}$"
        
        let predicate = NSPredicate(
            format:"SELF MATCHES %@",
            passwordRegEx
        )
        return predicate.evaluate(with:self.trim)
    }
    
}
