//
//  ModuleDelegate.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation
import UIKit

open class ModuleDelegate: UIResponder, UIApplicationDelegate {
  
  open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    Context.shared.application = application
    Context.shared.launchOptions = launchOptions ?? [:]
    Module.shared.context = Context.shared
    
    Module.shared.triggerEvent(.setupEvent)
    DispatchQueue.main.async {
      Module.shared.triggerEvent(.splashEvent)
    }
    
    return true
  }
  
  open func applicationDidBecomeActive(_ application: UIApplication) {
    Module.shared.triggerEvent(.didBecomeActiveEvent)
  }
  
  open func applicationWillResignActive(_ application: UIApplication) {
    Module.shared.triggerEvent(.willResignActiveEvent)
  }
  
  open func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    Module.shared.context.openURLItem.openURL = url
    Module.shared.context.openURLItem.sourceApplication = sourceApplication ?? ""
    Module.shared.triggerEvent(.openURLEvent)
    return true
  }
  
  open func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
    Module.shared.context.openURLItem.openURL = url
    Module.shared.context.openURLItem.options = options
    Module.shared.triggerEvent(.openURLEvent)
    return true
  }
  
  open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
    Module.shared.triggerEvent(.didReceiveMemoryWarningEvent)
  }
  
  open func applicationWillTerminate(_ application: UIApplication) {
    Module.shared.triggerEvent(.willTerminateEvent)
  }
  
  open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Module.shared.context.notificationsItem.deviceToken = deviceToken
    Module.shared.triggerEvent(.didRegisterForRemoteNotificationsEvent)
  }
  
  open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    Module.shared.context.notificationsItem.notificationsError = error
    Module.shared.triggerEvent(.didFailToRegisterForRemoteNotificationsEvent)
  }
  
  open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    Module.shared.context.notificationsItem.userInfo = userInfo
    Module.shared.triggerEvent(.didReceiveRemoteNotificationEvent)
  }
  
  open func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    Module.shared.context.notificationsItem.localNotification = notification
    Module.shared.triggerEvent(.didReceiveLocalNotificationEvent)
  }
  
  open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    Module.shared.context.notificationsItem.userInfo = userInfo
    Module.shared.context.notificationsItem.notificationResultHander = completionHandler
    Module.shared.triggerEvent(.didReceiveRemoteNotificationEvent)
  }
  
  open func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
    Module.shared.context.touchShortcutItem.shortcutItem = shortcutItem
    Module.shared.context.touchShortcutItem.scompletionHandler = completionHandler
    Module.shared.triggerEvent(.quickActionEvent)
  }
  
  open func applicationDidEnterBackground(_ application: UIApplication) {
    Module.shared.triggerEvent(.didEnterBackgroundEvent)
  }
  
  open func applicationWillEnterForeground(_ application: UIApplication) {
    Module.shared.triggerEvent(.willEnterForegroundEvent)
  }
  
  open func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
    Module.shared.context.userActivityItem.userActivityType = userActivityType
    Module.shared.triggerEvent(.willContinueUserActivityEvent)
    return true
  }
  
  open func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
    Module.shared.context.userActivityItem.userActivity = userActivity
    Module.shared.context.userActivityItem.restorationHandler = restorationHandler
    Module.shared.triggerEvent(.continueUserActivityEvent)
    return true
  }
  
  open func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
    Module.shared.context.userActivityItem.userActivityType = userActivityType
    Module.shared.context.userActivityItem.userActivityError = error
    Module.shared.triggerEvent(.didFailToContinueUserActivityEvent)
  }
  
  open func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
    Module.shared.context.userActivityItem.userActivity = userActivity
    Module.shared.triggerEvent(.didUpdateUserActivityEvent)
  }
}
