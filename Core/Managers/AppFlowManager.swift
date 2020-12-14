//
//  AppFlowManager.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//



import UIKit
/*
class AppFlowManager
{
    private var containerController: ContainerViewController!
    private var window: UIWindow?
    
    func start()
    {
        coordinateToLogin()
    }
    
    private func setupAppRoot(with controller: UIViewController)
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    
    private func setupContainer()
    {
        containerController = ContainerViewController.instantiate(storyboard: .container)
    }
}

extension AppFlowManager
{
    #warning("just for testing")
    // MARK: Just For Testing
    
    func coordinateToLogin()
    {
        let nav = BaseNavController()
        let controller = LoginBuilder.createLoginModule()
        
        setupAppRoot(with: nav)
        nav.pushViewController(controller, animated: true)
    }
    
    func coordinateToChatRoom()
    {
        let nav = BaseNavController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        let participant = ChatUser(ID: 100, name: "Essam Mohamed Fahmi", photoURL: "")
        let chatVC: ChatVC = ChatVC.instantiate(storyboard: .chat)
        ChatBuilder.createChatModule(around: chatVC, participant: participant)
        nav.pushViewController(chatVC, animated: true)
    }
    
    func coordinateToTest()
    {
        let nav = BaseNavController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        let controller = CourseDetailsViewController.instantiate(storyboard: .courseDetails)
        CourseDetailsBuilder.create(around: controller)
        nav.pushViewController(controller, animated: true)
    }
}
*/
