//
//  ValidationEnums.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

enum ValidatorType
{
    case email
    case name
    case phone(_ countryCode: String = "")
    case password
    case passwordMatches(confirmPassword: String)
    case age
    case required(fieldKey: String)
    case normal
}

enum ValidationErorr: Error, LocalizedError
{
    case emptyUserName
    case shortUserName
    case longUserName
    case invalidUserName
    case invalidEmail
    case emailEmpty
    case passwordCount
    case passwordMatch
    case emptyPassword
    case emptyText(_ placeholder: String)
    case invalidAge
    case invalidPhone
    case requiredField(key: String)
    
    var localizedDescription: String
    {
        switch self
        {
            case .emptyUserName:
                return "Name must not be empty".localized
            
            case .shortUserName:
                return "Name must contain more than three characters".localized
            
            case .longUserName:
                return "Name must not conain more than 18 characters".localized
            
            case .invalidUserName:
                return "Invalid name, name should not contain whitespaces, numbers or special characters".localized
            
            case .emailEmpty:
                return "Email is required".localized
            
            case .invalidEmail:
                return "Wrong Email format".localized
            
            case .emptyPassword:
                return "Password is required!".localized
            
            case .passwordCount:
                return "Password is too short".localized
            
            case .passwordMatch:
                return "Password not matches".localized
            
            case let .emptyText(placeholder):
                return "\(placeholder) is empty, check inputs!".localized
            
            case .invalidAge:
                return "Age is under 18".localized
            
            case .invalidPhone:
                return "Check Phone length and format".localized
            
            case .requiredField(let key):
                return "\(key.localized) is required!".localized
        }
    }
}
