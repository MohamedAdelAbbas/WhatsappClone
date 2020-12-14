//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

extension UIStoryboard
{
    enum StoryboardType: String
    {
        case main
        case auth
        case chat
        case home
        case sideMenu

        var filename: String
        {
            switch self
            {
            default:
                return rawValue.capitalizeFirst()
            }
        }
    }
    
    convenience init(storyboard: StoryboardType, bundle: Bundle? = nil)
    {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
    // MARK: - Class Functions
    
    class func storyboard(_ storyboard: StoryboardType, bundle: Bundle? = nil) -> UIStoryboard
    {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    // MARK: - View Controller Instantiation from Generics
    
    func instantiateViewController<T: UIViewController>() -> T
    {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else
        {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}

protocol StoryboardIdentifiable
{
    static var storyboardIdentifier: String { get }
    static func instantiate(storyboard: UIStoryboard.StoryboardType) -> Self
}

extension StoryboardIdentifiable where Self: UIViewController
{
    static var storyboardIdentifier: String
    {
        return String(describing: self)
    }
    
    static func instantiate(storyboard: UIStoryboard.StoryboardType) -> Self
    {
        return UIStoryboard(storyboard: storyboard).instantiateViewController()
    }
}

extension UIViewController: StoryboardIdentifiable { }
