//
//  UINavigationControllerEx.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

extension UINavigationController
{
    func popToViewController(ofType type: UIViewController.Type, animated: Bool = true)
    {
        if let controller = viewControllers.first (where: { $0.isKind(of: type) })
        {
            popToViewController(controller, animated: animated)
        }
    }
}
