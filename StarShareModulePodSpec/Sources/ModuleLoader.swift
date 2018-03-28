//
//  ModuleLoader.swift
//  Titan
//
//  Created by BUBUKO on 2018/3/22.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public class ModuleLoader {
  static let shared = ModuleLoader()
  
  func load(_ moduleConfig: ModuleConfig) throws -> Module {
    
    guard moduleConfig.enabled == true else {
      throw ModuleError.moduleDisable
    }
    
    guard moduleConfig.name.count > 0 else {
      throw ModuleError.missModuleName
    }
    
    guard moduleConfig.version.count > 0 else {
      throw ModuleError.missModuleVersion
    }
    
    let cls: Module.Type = moduleConfig.moduleClass
    
    titan_log(
      "加载:\(moduleConfig.name) -> \(moduleConfig.version)",
      identifier: "ModuleLoader"
    )
    
    let module = cls.init(moduleConfig)
    module.registerServices()
    return module
  }
}
