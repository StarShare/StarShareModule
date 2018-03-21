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
    
    Module.shared.registerModule(NetModule.self)
    
    _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
    return true
  }

}

