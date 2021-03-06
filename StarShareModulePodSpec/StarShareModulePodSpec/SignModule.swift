//
//  SignModule.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

class SignModule: Module {
  
  private var name: String
  private var desc: String?
  private var version: String
  private var creation: Date
  private var enable = true
  private var services: [ServiceName:AnyClass]
  private var customEvents: [EventName]
  
  required init(_ config: ModuleConfig) {
    name = config.name
    desc = config.desc
    version = config.version
    enable = config.enabled
    creation = Date()
    services = config.services
    customEvents = config.customEvents
  }
  
  func getEnable() -> Bool {
    return enable
  }
  
  func getName() -> String {
    return name
  }
  
  func getVersion() -> String {
    return version
  }
  
  func getCreation() -> Date {
    return creation
  }
  
  func getSercvices() -> [ServiceName:AnyClass] {
    return services
  }
  
  func getCustomEvents() -> [EventName] {
    return customEvents
  }
  
  func destroy() {
    
  }
}

extension SignModule {
  
  func modSetUp(_ context: Context) {
    print("SignModule modSetUp")
  }
  
  func modWillResignActive(_ context: Context) {
    print("SignModule modWillResignActive")
  }
  
  func modDidEnterBackground(_ context: Context) {
    print("SignModule modDidEnterBackground")
  }
  
  func modWillEnterForeground(_ context: Context) {
    print("SignModule modWillEnterForeground")
  }
  
  func modDidBecomeActive(_ context: Context) {
    print("SignModule modDidBecomeActive")
  }
  
  func modWillTerminate(_ context: Context) {
    print("SignModule modWillTerminate")
  }
  
  func modDidCustomEvent(_ context: Context, name: EventName, object: Any?) {
    print("SignModule modDidCustomEvent: name -> \(name.rawValue) | object -> \(object ?? "nil")")
  }
}
