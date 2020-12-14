//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import UIKit

extension UIViewController
{
    typealias AlertCompletionHandler = () -> Void

    func showAlert(_ title: String,
                   _ message: String,
                   addCancelAction: Bool = false,
                   okayHandler: AlertCompletionHandler? = nil,
                   _ cancelHandler: AlertCompletionHandler? = nil)
    {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay".localized, style: .default, handler:
            { (alertAction) in
            if let okayHandler = okayHandler {
                okayHandler()
            }
        }))
        
        if (addCancelAction){
            alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler:
                { alert in
                if let okayHandler = cancelHandler {
                    okayHandler()
                }
            }))
        }
        
        DispatchQueue.main.async(execute: { [weak self] in
            self?.present(alert,animated: true,completion: nil)
        })
    }
    
    func animateConstraint(_ constraint: NSLayoutConstraint, to value: CGFloat, with duration: Double)
    {
        if constraint.constant != value
        {
            constraint.constant = value
            UIView.animate(withDuration: duration) { [weak self] in
                self?.view.layoutIfNeeded()
            }
        }
    }
}

// MARK: - Navigation

extension UIViewController
{
    var isModal: Bool
    {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation =
            navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
    func pop(with animation: Bool = true)
    {
        navigationController?.popViewController(animated: animation)
    }
    
    func push(viewController: UIViewController, animated: Bool = true)
    {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func present(viewController: UIViewController, animated: Bool = true)
    {
        present(viewController, animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true)
    {
        if isModal
        {
            dismiss(animated: animated, completion: nil)
        }
        else
        {
            pop()
        }
    }
}

// MARK:- Actions

extension UIViewController
{
    @IBAction func dismissAction(_ sender: Any)
    {
        dismiss()
    }
}
