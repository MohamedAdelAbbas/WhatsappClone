//
//  Environment.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import Foundation

enum Environment: String
{
    case development = "development"
    case production = "production"

    var baseURL: String
    {
        switch self
        {
        case .development: return ""
        case .production: return ""
        }
    }

    static var current: Environment
    {
        let currentEnvironment = UserDefaults.standard.string(forKey: "environment") ?? Environment.production.rawValue
        return Environment(rawValue: currentEnvironment)!
    }
}
