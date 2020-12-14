//
//  Colors.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit
    
    enum Colors
    {
        case primary
        case textPrimary
        case textSecondry
        case actionTextPrimary
        case actionTextColor
        case sperator
        case background
        case activityColor
        case navBackground
        
        func withAlpha(_ alpha: Double) -> UIColor
        {
            return color.withAlphaComponent(CGFloat(alpha))
        }
        
        var color: UIColor {
            switch self {
            case .primary: return #colorLiteral(red: 1, green: 0.6901960784, blue: 0, alpha: 1)
            case .textPrimary: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .textSecondry: return #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
            case .actionTextPrimary: return #colorLiteral(red: 1, green: 0.6901960784, blue: 0, alpha: 1)
            case .actionTextColor: return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            case .activityColor: return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            case .background,.sperator:return #colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1)
            case .navBackground: return #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
                
            }
        }
}


