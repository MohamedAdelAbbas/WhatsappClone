//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setMainAppNavigationBarStyle()
    }
}

extension UINavigationController
{
    func setupTransparentNavigation()
    {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
    }
    
    func updateNavigationTransparent()
    {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = .clear
        self.view.backgroundColor = .clear
        //self.navigationBar.tintColor = AppColors.background.color
        self.navigationItem.hidesBackButton = true
        self.viewWillLayoutSubviews()
    }
}

extension UINavigationController
{
    func setMainAppNavigationBarStyle()
    {
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .appBlue

        let titleAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.alJazeera(.regular(20)), .foregroundColor: UIColor.white]
        let largeTitleAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.alJazeera(.bold(32)), .foregroundColor: UIColor.white]
        
        navigationBar.titleTextAttributes = titleAttributes
        navigationBar.largeTitleTextAttributes = largeTitleAttributes
    }
}
