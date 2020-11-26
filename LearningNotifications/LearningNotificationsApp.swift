//
//  LearningNotificationsApp.swift
//  LearningNotifications
//
//  Created by tezz on 26/11/20.
//

import SwiftUI


class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions)
        -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UNUserNotificationCenter.current().delegate = self
        return true
    }
}

@main
struct LearningNotificationsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
