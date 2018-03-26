//
//  ModuleService.swift
//  Titan
//
//  Created by BUBUKO on 2018/3/22.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public class ModuleService {
  static let shared = ModuleService()
  private let moduleManager = ModuleManager.shared
  private let moduleLoader  = ModuleLoader.shared
  
  @discardableResult
  func loadAndRegister(_ moduleConfig: ModuleConfig) -> Module? {
    
    if moduleConfig.enabled == true {
      do {
        let module = try moduleLoader.load(moduleConfig)
        moduleManager.register(module)
        return module
      } catch let e {
        titan_log(
          "加载失败:\(moduleConfig.name) -> \(moduleConfig.version) : \(e.localizedDescription)",
          identifier: "ModuleService"
        )
        return nil
      }
    }
    
    titan_log(
      "模块状态被禁用:\(moduleConfig.name) -> \(moduleConfig.version)",
      identifier: "ModuleService")
    removeModule(moduleConfig.name)
    titan_log(
      "移除被禁用模块:\(moduleConfig.name) -> \(moduleConfig.version)",
      identifier: "ModuleService")
    return nil
  }
  
  @discardableResult
  private func removeModule(_ moduleName: String) -> Module? {
    let removed = moduleManager.remove(moduleName)
    return removed
  }
}
