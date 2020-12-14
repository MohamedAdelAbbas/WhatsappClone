//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

extension UIView
{
    static var nib: UINib
    {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
    static func instantiateFromNib() -> Self?
    {
        return nib.instantiate() as? Self
    }
    
    static var identifier: String
    {
        return "\(self)"
    }
    
    func loadXIBFromMemory()
    {
        Bundle.main.loadNibNamed("\(Self.self)", owner: self, options: nil)
    }
}

extension UINib
{
    func instantiate() -> Any?
    {
        return instantiate(withOwner: nil, options: nil).first
    }
}
