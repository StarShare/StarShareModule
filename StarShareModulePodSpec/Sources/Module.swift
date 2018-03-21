//
//  Module.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

let kModuleInfoNameKey = "kModuleInfoNameKey"

public class Module {
  
  public static let shared = Module()
  private var modules: [[AnyHashable: Any]] = []
  private var moduleInstances: [ModuleProtocol] = []
  
  private let _onceToken = NSUUID().uuidString
  public var context: Context {
    didSet {
      DispatchQueue.once(token: _onceToken) {
      }
    }
  }
  
  init() {
    self.context = Context.shared
  }
  
  public func registerModule(_ moduleClass: AnyClass) {
    let className = NSStringFromClass(moduleClass)
    guard moduleClass is ModuleProtocol.Type else {
      assert(false, "\(className) module does not comply with ModuleProtocol protocol")
      return
    }
    
    var moduleInfo: [AnyHashable: Any] = [:]
    moduleInfo[kModuleInfoNameKey] = className
    self.modules.append(moduleInfo)
    
    if let moduleClass = NSClassFromString(className) as? ModuleProtocol.Type {
      let moduleInstance = moduleClass.init(Context.shared)
      moduleInstances.append(moduleInstance)
    }
  }
  
  public func triggerEvent(_ eventType: ModuleEventType) {
    switch eventType {
    case .setupEvent: handleModulesSetupEvent()
    case .tearDownEvent: handleModulesTearDownEvent()
    default: handleModuleEvent(eventType)
    }
  }
  
  func handleModulesSetupEvent() {
    for instance in moduleInstances {
      let bk: () -> Void = {
        instance.modSetUp(Context.shared)
      }
      if instance.async() {
        DispatchQueue.main.async {
          bk()
        }
      } else {
        bk()
      }
    }
  }
  
  func handleModulesTearDownEvent() {
    for index in (moduleInstances.count - 1)...0 {
      moduleInstances[index].modTearDown(Context.shared)
    }
  }
  
  func handleModuleEvent(_ eventType: ModuleEventType) {
    for instance in moduleInstances {
      switch eventType {
      case .splashEvent: instance.modSplash(Context.shared)
      case .willResignActiveEvent: instance.modWillResignActive(Context.shared)
      case .didEnterBackgroundEvent: instance.modDidEnterBackground(Context.shared)
      case .willEnterForegroundEvent: instance.modWillEnterForeground(Context.shared)
      case .didBecomeActiveEvent: instance.modDidBecomeActive(Context.shared)
      case .willTerminateEvent: instance.modWillTerminate(Context.shared)
      case .unmountEvent: instance.modUnmount(Context.shared)
      case .openURLEvent: instance.modOpenURL(Context.shared)
      case .didReceiveMemoryWarningEvent: instance.modDidReceiveMemoryWaring(Context.shared)
      case .didReceiveRemoteNotificationEvent: instance.modDidReceiveRemoteNotification(Context.shared)
      case .didFailToRegisterForRemoteNotificationsEvent: instance.modDidFailToRegister(forRemoteNotifications: Context.shared)
      case .didRegisterForRemoteNotificationsEvent: instance.modDidRegister(forRemoteNotifications: Context.shared)
      case .didReceiveLocalNotificationEvent: instance.modDidReceiveLocalNotification(Context.shared)
      case .willContinueUserActivityEvent: instance.modWillContinueUserActivity(Context.shared)
      case .continueUserActivityEvent: instance.modContinueUserActivity(Context.shared)
      case .didFailToContinueUserActivityEvent: instance.modDidFail(toContinueUserActivity: Context.shared)
      case .didUpdateUserActivityEvent: instance.modDidUpdateContinueUserActivity(Context.shared)
      case .quickActionEvent: instance.modQuickAction(Context.shared)
      default:
        instance.modDidCustomEvent(Context.shared)
      }
    }
  }
}

extension DispatchQueue {
  
  private static var _onceTracker = [String]()
  class func once(token: String, block: ()->Void) {
    objc_sync_enter(self);
    defer { objc_sync_exit(self) }
    
    if _onceTracker.contains(token) {
      return
    }
    
    _onceTracker.append(token)
    block()
  }
}
