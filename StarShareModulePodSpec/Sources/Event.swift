//
//  Event.swift
//  Titan
//
//  Created by BUBUKO on 2018/3/23.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

public enum EventType: Int {
  
  case setupEvent = 0
  case tearDownEvent
  case splashEvent
  case quickActionEvent
  case willResignActiveEvent
  case didEnterBackgroundEvent
  case willEnterForegroundEvent
  case didBecomeActiveEvent
  case willTerminateEvent
  case unmountEvent
  case openURLEvent
  case didReceiveMemoryWarningEvent
  case didFailToRegisterForRemoteNotificationsEvent
  case didRegisterForRemoteNotificationsEvent
  case didReceiveRemoteNotificationEvent
  case didReceiveLocalNotificationEvent
  case willContinueUserActivityEvent
  case continueUserActivityEvent
  case didFailToContinueUserActivityEvent
  case didUpdateUserActivityEvent
}

public typealias NotificationResultHandler = (UIBackgroundFetchResult) -> Void

public struct NotificationsItem {
  var notificationsError: Error?
  var deviceToken: Data?
  var userInfo: [AnyHashable: Any] = [:]
  var notificationResultHander: NotificationResultHandler?
  var localNotification: UILocalNotification?
}

public struct OpenURLItem {
  var openURL: URL?
  var sourceApplication: String = ""
  var options: [AnyHashable: Any] = [:]
}

typealias ShortcutItemCompletionHandler = (Bool) -> Void

public struct ShortcutItem {
  var shortcutItem: UIApplicationShortcutItem?
  var scompletionHandler: ShortcutItemCompletionHandler?
}

public typealias RestorationHandler = ([Any]?) -> Void

public struct UserActivityItem {
  var userActivityType: String = ""
  var userActivity: NSUserActivity?
  var userActivityError: Error?
  var restorationHandler: RestorationHandler?
}
