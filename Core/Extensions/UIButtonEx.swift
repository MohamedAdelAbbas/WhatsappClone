//
//  UIButtonEx.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

extension UIButton
{
    func setStyle(text: String, placeholder: String, isSelected: Bool, status: UIControl.State = .normal)
    {
        let color: UIColor = isSelected ? .lightGray : .appBlue
        let name = isSelected ? placeholder.localized : text
        setTitle(name, for: status)
        setTitleColor(color, for: status)
    }
}
