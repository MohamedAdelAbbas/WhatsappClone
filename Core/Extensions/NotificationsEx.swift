//
//  NotificationsExtensions.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//


import Foundation

extension Notification.Name
{
    static let updateMessagesBadge = Notification.Name(rawValue: "updateMessagesBadge")
    static let newNotification = Notification.Name(rawValue: "newNotification")
    static let newMessage = Notification.Name(rawValue: "newMessage")
    static let openSideMenu = Notification.Name("openSideMenu")
    static let closeSideMenu = Notification.Name("closeSideMenu")
    static let changeTheLanguage = Notification.Name("changeTheLanguage")
    static let updateProfile = Notification.Name("updateProfile")
}


