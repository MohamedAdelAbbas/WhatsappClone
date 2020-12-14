//
//  LocalizationManager.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

#warning("Move UserDefaults to its own manager")

protocol LocalizationDelegate: class
{
    func resetApp()
}

class LocalizationManager
{
    // MARK: Enum
    
    enum LanguageDirection
    {
        case leftToRight
        case rightToLeft
    }
    
    enum Language: String, CaseIterable
    {
        case english = "en"
        case arabic = "ar"
    }
    
    // MARK: Properties
    
    static let shared = LocalizationManager()
    private var bundle: Bundle? = nil
    private var languageKey = "UKPrefLang"
    weak var delegate: LocalizationDelegate?
    
    // MARK: init
    
    private init() { }
    
    // MARK: Private Methods
    
    private func isLanguageAvailable(_ code: String) -> Language?
    {
        var finalCode = ""
        for language in Language.allCases
        {
            if code.contains(language.rawValue)
            {
                finalCode = language.rawValue
                break
            }
        }
        return Language(rawValue: finalCode)
    }
    
    private func getLanguageDirection() -> LanguageDirection
    {
        if let lang = getLanguage()
        {
            switch lang
            {
                case .english:
                    return .leftToRight
                
                case .arabic:
                    return .rightToLeft
            }
        }
        
        return .rightToLeft
    }
    
    private func changeUISemantic(with semantic: UISemanticContentAttribute)
    {
        UITabBar.appearance().semanticContentAttribute = semantic
        UIView.appearance().semanticContentAttribute = semantic
        UINavigationBar.appearance().semanticContentAttribute = semantic
    }
    
    // MARK: Public Methods
    
    /// get currently selected language from user defaults
    func getLanguage() -> Language?
    {
        if let languageCode = UserDefaults.standard.string(forKey: languageKey),
            let language = Language(rawValue: languageCode)
        {
            return language
        }
        return nil
    }
    
    func localizedString(for key: String, value comment: String) -> String
    {
        let localized = bundle!.localizedString(forKey: key, value: comment, table: nil)
        return localized
    }
    
    func setLanguage(language: Language)
    {
        UserDefaults.standard.set(language.rawValue, forKey: languageKey)
        if let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        {
            bundle = Bundle(path: path)
            Bundle.setLanguage(language.rawValue)
        }
        else
        {
            resetLocalization()
        }
        resetApp()
    }
    
    /// reset bundle
    func resetLocalization()
    {
        bundle = Bundle.main
    }
    
    /// reset app for the new language
    func resetApp()
    {
        let dir = getLanguageDirection()
        var semantic: UISemanticContentAttribute!
        switch dir
        {
            case .leftToRight:
                semantic = .forceLeftToRight
            
            case .rightToLeft:
                semantic = .forceRightToLeft
        }
        
        changeUISemantic(with: semantic)
        delegate?.resetApp()
    }
    
    /// configure startup language
    func setInitLanguage()
    {
        if let selectedLanguage = getLanguage()
        {
            setLanguage(language: selectedLanguage)
        }
        else
        {
            // no language was selected
            let languageCode = Locale.preferredLanguages.first
            if let code = languageCode, let language = isLanguageAvailable(code)
            {
                setLanguage(language: language)
            }
            else
            {
                setLanguage(language: .arabic)
            }
        }
        resetApp()
    }
}
