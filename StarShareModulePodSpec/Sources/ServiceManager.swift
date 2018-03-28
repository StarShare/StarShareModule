//
//  ServiceManager.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/28.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public class ServiceManager {
  static let shared = ServiceManager()
  
  var allServices: [ServiceName: String] = [:]
  var safeServices: [ServiceName: String] {
    lock.lock()
    let dic = allServices
    lock.unlock()
    return dic
  }
  lazy var lock = NSRecursiveLock()
  
  func register(service: ServiceName, implClass: AnyClass) {
    if !(implClass is Service.Type) {
      titan_log(
        "注册服务失败:\(service.rawValue) -> \(NSStringFromClass(implClass)) module does not comply with Service protocol",
        identifier: "ServiceManager"
      )
    }
    if checkValid(service: service) {
      titan_log(
        "服务已注册过:\(service.rawValue) -> protocol has been registed",
        identifier: "ServiceManager"
      )
    }
    
    lock.lock()
    allServices[service] = NSStringFromClass(implClass)
    lock.unlock()
  }
  
  func create(service: ServiceName) throws -> AnyObject {
    if !checkValid(service: service) {
      titan_log(
        "服务未注册:\(service.rawValue) -> protocol has been registed",
        identifier: "ServiceManager"
      )
      throw ServiceError.serviceHasBeenRegisted
    }
    guard let implClass = try serviceImplClass(service) as? Service.Type else {
      titan_log(
        "服务Class创建失败:\(service.rawValue) -> service Impl Class is nill or not comply Service",
        identifier: "ServiceManager"
      )
      throw ServiceError.serviceInstantiationFailure
    }
    
    if implClass.singleton() {
      let implInstance = implClass.shareInstance()
      if implInstance == nil {
        throw ServiceError.createServiceFailed
      }
      return implInstance!
    } else {
      return implClass.init() as AnyObject
    }
  }
  
  // MARK: Private
  
  func serviceImplClass(_ service: ServiceName) throws -> AnyClass {
    for (key, value) in safeServices {
      if key == service {
        guard let implClass = NSClassFromString(value) else {
          throw ServiceError.createServiceClassFailed
        }
        return implClass
      }
    }
    throw ServiceError.createServiceClassFailed
  }
  
  func checkValid(service: ServiceName) -> Bool {
    for (key, _) in safeServices {
      if key == service {
        return true
      }
    }
    return false
  }
}
