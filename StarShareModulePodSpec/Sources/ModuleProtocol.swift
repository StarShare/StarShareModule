//
//  ModuleProtocol.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public protocol ModuleProtocol {
  
  func async() -> Bool
  init(_ context: Context)
  func modSetUp(_ context: Context)
  func modSplash(_ context: Context)
  func modQuickAction(_ context: Context)
  func modTearDown(_ context: Context)
  func modWillResignActive(_ context: Context)
  func modDidEnterBackground(_ context: Context)
  func modWillEnterForeground(_ context: Context)
  func modDidBecomeActive(_ context: Context)
  func modWillTerminate(_ context: Context)
  func modUnmount(_ context: Context)
  func modOpenURL(_ context: Context)
  func modDidReceiveMemoryWaring(_ context: Context)
  func modDidFailToRegister(forRemoteNotifications context: Context)
  func modDidRegister(forRemoteNotifications context: Context)
  func modDidReceiveRemoteNotification(_ context: Context)
  func modDidReceiveLocalNotification(_ context: Context)
  func modWillContinueUserActivity(_ context: Context)
  func modContinueUserActivity(_ context: Context)
  func modDidFail(toContinueUserActivity context: Context)
  func modDidUpdateContinueUserActivity(_ context: Context)
  func modDidCustomEvent(_ context: Context)
}

public extension ModuleProtocol {
  
  func async() -> Bool { return false }
  func modSetUp(_ context: Context) {}
  func modSplash(_ context: Context) {}
  func modQuickAction(_ context: Context) {}
  func modTearDown(_ context: Context) {}
  func modWillResignActive(_ context: Context) {}
  func modDidEnterBackground(_ context: Context) {}
  func modWillEnterForeground(_ context: Context) {}
  func modDidBecomeActive(_ context: Context) {}
  func modWillTerminate(_ context: Context) {}
  func modUnmount(_ context: Context) {}
  func modOpenURL(_ context: Context) {}
  func modDidReceiveMemoryWaring(_ context: Context) {}
  func modDidFailToRegister(forRemoteNotifications context: Context) {}
  func modDidRegister(forRemoteNotifications context: Context) {}
  func modDidReceiveRemoteNotification(_ context: Context) {}
  func modDidReceiveLocalNotification(_ context: Context) {}
  func modWillContinueUserActivity(_ context: Context) {}
  func modContinueUserActivity(_ context: Context) {}
  func modDidFail(toContinueUserActivity context: Context) {}
  func modDidUpdateContinueUserActivity(_ context: Context) {}
  func modDidCustomEvent(_ context: Context) {}
}
