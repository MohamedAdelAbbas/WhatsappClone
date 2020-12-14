//
//  UITextFieldEx.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

extension UITextField
{
    open override func awakeFromNib()
    {
        super.awakeFromNib()
        
        if textAlignment == .center { return }
        
        if LocalizationManager.shared.getLanguage() == .arabic
        {
            textAlignment = .right
        }
        else
        {
            textAlignment = .left
        }
    }
}
