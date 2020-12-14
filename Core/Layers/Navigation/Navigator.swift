//
//  Navigator.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import UIKit

protocol Navigator: class
{
    associatedtype Destination: Navigatable
    
    var viewController: UIViewController? { get }
    func dismiss()
    func navigate(to destination: Destination)
    func present(destination: Destination)
}

extension Navigator
{
    func dismiss()
    {
        viewController?.dismiss()
    }
    
    func navigate(to controller: Destination)
    {
        viewController?.push(navigatable: controller)
    }
    
    func present(destination: Destination)
    {
        viewController?.present(navigatable: destination)
    }
}
