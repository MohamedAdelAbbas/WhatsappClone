//
//  NotificationsManager.swift
//  WChat
//
//  Created by Mohamed Adel on 7/4/20.
//  Copyright © 2020 Mohamed Adel. All rights reserved.
//

import FirebaseCore
import FirebaseAuth
//import FirebaseMessaging
/*
class NotificationsManager: NSObject, MessagingDelegate, UNUserNotificationCenterDelegate
{
    // MARK: Properties
    
    static var shared = NotificationsManager()

    // MARK: Init
    
    private override init() { super.init() }

    // MARK: Methods
    
    func setup()
    {
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    // MARK: UserNotificationCenter
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }
    
    // This method is called when user CLICKED on the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        completionHandler()
    }
    
    // MARK: Firebase Messaging
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String)
    {
        #warning("New FCM Token - Send to server")
    }
}

// MARK: AppDelegate Extensions

extension AppDelegate
{
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification notification: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler:
                        @escaping (UIBackgroundFetchResult) -> Void)
    {
        if Auth.auth().canHandleNotification(notification)
        {
            // notification is for Firebase Auth
            completionHandler(.noData)
            return
        }
        
        // notification is for the app
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        // for firebase authentication purposes
        Auth.auth().setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
    }
}
*/
