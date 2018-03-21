//
//  NetModule.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

class NetModule: ModuleProtocol {
  
  required init(_ context: Context) {
    print("NetModule Init")
  }
  
  func modSetUp(_ context: Context) {
    print("NetModule modSetUp")
  }
  
  func modWillResignActive(_ context: Context) {
    print("NetModule modWillResignActive")
  }
  
  func modDidEnterBackground(_ context: Context) {
    print("NetModule modDidEnterBackground")
  }
  
  func modWillEnterForeground(_ context: Context) {
    print("NetModule modWillEnterForeground")
  }
  
  func modDidBecomeActive(_ context: Context) {
    print("NetModule modDidBecomeActive")
  }
  
  func modWillTerminate(_ context: Context) {
    print("NetModule modWillTerminate")
  }
}
