//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

extension UIColor
{
    convenience init(hexString: String)
    {
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner:Scanner = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let customred = Int(color >> 16) & mask
        let customgreen = Int(color >> 8) & mask
        let customblue = Int(color) & mask
        
        let red = CGFloat(customred) / 255.0
        let green = CGFloat(customgreen) / 255.0
        let blue = CGFloat(customblue) / 255.0
        self.init(red: red, green: green, blue:blue, alpha: 1)
    }
    
    convenience init(red: Int, green: Int, blue: Int)
    {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    static var random: UIColor
    {
        return UIColor(red: .random(in: 0.0...1.0),
                       green: .random(in: 0.0...1.0),
                       blue: .random(in: 0.0...1.0),
                       alpha: 1.0)
    }
}

extension UIColor
{
    static var appBackground: UIColor
    {
        return #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    }
    
    static var appNavBackground: UIColor
    {
        return #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
    }
    
    static var appPrimary: UIColor
    {
        return #colorLiteral(red: 0.2509803922, green: 0.5568627451, blue: 1, alpha: 1)
    }

    static var appDarkBlue: UIColor
    {
        return #colorLiteral(red: 0.1058823529, green: 0.2470588235, blue: 0.368627451, alpha: 1)
    }
    
    static var appOrange: UIColor
    {
        return UIColor(red: 242/255, green: 101/255, blue: 34/255, alpha: 1)
    }
    
    static var appYellow: UIColor
    {
        return UIColor(red: 251/255, green: 169/255, blue: 25/255, alpha: 1)
    }
    
    static var underLineValidText: UIColor
    {
        return #colorLiteral(red: 0.2509803922, green: 0.5568627451, blue: 1, alpha: 1)
    }
    
    static var appActivity: UIColor
    {
        return #colorLiteral(red: 0.2509803922, green: 0.5568627451, blue: 1, alpha: 1)
    }
    
    static var underLineErrorText: UIColor
    {
        return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }

    static var appRed: UIColor
    {
        return #colorLiteral(red: 1, green: 0.2705882353, blue: 0.2274509804, alpha: 1)
    }
    
    static var appBlue: UIColor
    {
        return #colorLiteral(red: 0.2392156863, green: 0.5294117647, blue: 1, alpha: 1)
    }
    
    static var appBlack: UIColor
    {
        return #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.1058823529, alpha: 1)
    }
    
    static var appGray: UIColor
    {
        return #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    }
    
    static var appLighterGray: UIColor
    {
        return #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.2)
    }
}
