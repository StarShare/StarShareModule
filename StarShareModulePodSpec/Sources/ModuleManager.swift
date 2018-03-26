//
//  ModuleManager.swift
//  Titan
//
//  Created by BUBUKO on 2018/3/22.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public class ModuleManager {
  static let shared = ModuleManager()
  
  private var modules: [String:Module] = [:]
  private var moduleClasses: [String:String] = [:]
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
  
  func doEvent(_ eventType: EventType) {
    switch eventType {
    case .setupEvent: handleModulesSetupEvent()
    case .tearDownEvent: handleModulesTearDownEvent()
    default: handleModuleEvent(eventType)
    }
  }
  
  func handleModulesSetupEvent() {
    for instance in modules.map({ (key, value) -> Module in
      value
    }).filter({ $0.getEnable() == true }) {
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
    for index in (modules.values.count - 1)...0 {
      modules.map({ (key, value) -> Module in
        value
      }).filter({ $0.getEnable() == true })[index].modTearDown(Context.shared)
    }
  }
  
  func handleModuleEvent(_ eventType: EventType) {
    for instance in modules.map({ (key, value) -> Module in
      value
    }).filter({ $0.getEnable() == true }) {
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
        break
      }
    }
  }
  
  func find(_ name: String) -> Module? {
    return modules[name]
  }
  
  func find(_ type: Module.Type) -> Module? {
    let className = "\(type)"
    let name = moduleClasses.filter({ (key,value) -> Bool in
      return value == className
    }).map { (key,value) -> String in
      return key
    }.first
    if name == nil {
      return nil
    }
    
    return modules[name!]
  }
  
  func getModules() -> [Module] {
    return modules.map({ (key,value) -> Module in
      return value
    })
  }
  
  @discardableResult
  func register(_ module: Module) -> Module? {
    let oldModule = find(module.getName())
    if oldModule != nil {
      remove(oldModule!.getName())
    }
    
    if let className = "\(type(of: module))".components(separatedBy: ".").last {
      moduleClasses[module.getName()] = className
    }
    modules[module.getName()] = module
    
    titan_log(
      "注册:\(module.getName()) -> \(module.getVersion())",
      identifier: "ModuleManager"
    )
    return oldModule
  }
  
  @discardableResult
  func remove(_ name: String) -> Module? {
    let oldModule = find(name)
    if oldModule != nil {
      oldModule!.destroy()
      modules.removeValue(forKey: name)
      moduleClasses.removeValue(forKey: name)
      titan_log(
        "移除:\(oldModule!.getName()) -> \(oldModule!.getVersion())",
        identifier: "ModuleManager"
      )
    }
    
    return oldModule
  }
  
  func destroy() {
    modules.forEach { (key,module) in
      module.destroy()
    }
    modules.removeAll()
    moduleClasses.removeAll()
    
    titan_log(
      "销毁所有模块！",
      identifier: "ModuleManager"
    )
  }
}

fileprivate extension DispatchQueue {
  
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
