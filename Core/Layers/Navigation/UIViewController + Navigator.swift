//
//  UIViewController + Navigator.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//



import UIKit

extension UIViewController
{
    func present(navigatable: Navigatable, animated: Bool = true)
    {
        present(navigatable.viewController, animated: true, completion: nil)
    }
    
    func push(navigatable: Navigatable, animated: Bool = true)
    {
        navigationController?.pushViewController(navigatable.viewController, animated: animated)
    }
}
