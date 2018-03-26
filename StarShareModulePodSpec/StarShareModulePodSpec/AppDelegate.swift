//
//  AppDelegate.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: ModuleDelegate {
  var window: UIWindow?
  
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let signModuleConfig = ModuleConfig(
      name: "认证模块",
      version: "v0.0.1",
      moduleClass: SignModule.self
    )
    
    if let module = ModuleService.shared.loadAndRegister(signModuleConfig) {
      titan_log((module.getName()) + "加载成功")
      print(module)
    }
    
    if let module = ModuleManager.shared.find("认证模块") {
      titan_log((module.getName()) + "获取成功")
      print(module)
    }
    
    if let module = ModuleManager.shared.find(SignModule.self) {
      module.destroy()
      print(module)
    }
    
    _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
    return true
  }

}

