//
//  StringValidationManager.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

extension String
{
    func validatedText(_ validationType: ValidatorType) throws
    {
        switch validationType
        {
            case .name:
                try validateUsername()
            
            case .email:
                try validateEmail()
            
            case .phone(let coutnryCode):
                try validatePhoneNumber(with: coutnryCode)
            
            case .password:
                try validatePassword()
            
            case .passwordMatches(let confirmPassword):
                try matchPassword(with: confirmPassword)
            
            case .age:
                try validateBirthDate()
            
            case .required(let fieldKey):
                try validateRequired(key: fieldKey)
            
            case .normal:
                try validateEmpty()
        }
    }
    
    // MARK: Private Methods
    
    private func validateRequired(key: String) throws
    {
        if isEmpty
        {
            throw ValidationErorr.requiredField(key: key)
        }
    }
    
    private func validateUsername() throws
    {
        if isEmpty
        {
            throw ValidationErorr.emptyUserName
        }
        
        if !isValidName
        {
            throw ValidationErorr.invalidUserName
        }
        
        if count < 3
        {
            throw ValidationErorr.shortUserName
        }
        
        if count > 18
        {
            throw ValidationErorr.longUserName
        }
    }
    
    private func validatePhoneNumber(with coutnryCode: String) throws
    {
//        if !"\(coutnryCode)\(self)".isValidPhone
//        {
//            throw ValidationErorr.invalidPhone
//        }
    }
    
    private func validatePassword() throws
    {
        if isEmpty
        {
            throw ValidationErorr.emptyPassword
        }
        
        if count < 3
        {
            throw ValidationErorr.passwordCount
        }
    }
    
    private func validateEmail() throws
    {
        if isEmpty
        {
            throw ValidationErorr.emailEmpty
        }
        
        if !isValidEmail
        {
            throw ValidationErorr.invalidEmail
        }
    }
    
    private func matchPassword(with confirmPassword: String) throws
    {
        if self != confirmPassword
        {
            throw ValidationErorr.passwordMatch
        }
    }
    
    private func validateBirthDate(greaterThan age: Int = 18) throws
    {
        if isEmpty
        {
            throw ValidationErorr.emptyText("Birth Date")
        }
        
        if !isBirthDateGreaterThan(age)
        {
            throw ValidationErorr.invalidAge
        }
    }
    
    private func validateEmpty() throws
    {
        if isEmptyOrSpaces
        {
            throw ValidationErorr.emptyText("")
        }
    }
}
