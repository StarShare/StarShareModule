//
//  ModuleConfig.swift
//  Titan
//
//  Created by BUBUKO on 2018/3/22.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public class ModuleConfig {
  
  public var name: String
  public var desc: String
  public var version: String
  public var enabled: Bool
  public var moduleClass: Module.Type
  public var services: [ServiceName: AnyClass]
  public var customEvents: [EventName]
  
  init(name: String = "",
       desc: String = "",
       version: String = "",
       enabled: Bool = true,
       moduleClass: Module.Type,
       services: [ServiceName: AnyClass] = [:],
       customEvents: [EventName] = []) {
    self.name = name
    self.desc = desc
    self.version = version
    self.enabled = enabled
    self.moduleClass = moduleClass
    self.services = services
    self.customEvents = customEvents
  }
}

