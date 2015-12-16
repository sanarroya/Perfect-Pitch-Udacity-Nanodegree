//
//  Validator.swift
//  Perfect Pitch
//
//  Created by URpin on 12/16/15.
//  Copyright © 2015 Santiago Avila Arroyave. All rights reserved.
//

import Foundation

class Validator {
    
    class func stringIsEmpty(string: String) -> Bool {
        if(string.isEmpty) {
            return true
        }else {
            return false
        }
    }
    
    class func stringHasEmptySpace(string: String) -> Bool {
        let characters = Array(string.characters)
        var hasSpaces = false
        for c in characters {
            if (c == " ") {
                hasSpaces = true
                return hasSpaces
            }
        }
        return hasSpaces
    }
    
    class func stringLengthIsValid(string: String) -> Bool {
        if (string.characters.count >= 2) {
            return true
        }else {
            return false
        }
    }
    class func stringHasSpecialCharactersCombination(string: String) -> Bool {
        //Preguntar cual es la combinacion
        return true
    }
    
    class func passwordIsEqualToUsername(username: String, password: String) -> Bool {
        if (username == password) {
            return true
        }else {
            return false
        }
    }
    
    class func emailIsValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluateWithObject(email)
    }
    
    
}