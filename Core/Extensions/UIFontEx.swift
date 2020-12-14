//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

enum FontTypes
{
    case bold(_ size: CGFloat)
    case light(_ size: CGFloat)
    case regular(_ size: CGFloat)
}

extension UIFont
{
    class func alJazeera(_ type: FontTypes) -> UIFont
    {
        switch type
        {
        case .bold(let size):
            return UIFont(name: "Al-Jazeera-Arabic-Bold", size: size)!
        case .light(let size):
            return UIFont(name: "Al-Jazeera-Arabic-Light", size: size)!
        case .regular(let size):
            return UIFont(name: "Al-Jazeera-Arabic-Regular", size: size)!
        }
    }
}
