//
//  Config.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public class Config {
  
  public static let shared = Config()
  private var config: [AnyHashable: Any] = [:]
  
  public func get(_ key: String) -> Any? {
    return config[key]
  }
  
  public func has(_ key: String) -> Bool {
    if config[key] != nil {
      return true
    } else {
      return false
    }
  }
  
  public func add(_ parameters: [AnyHashable: Any]) {
    for (key, value) in parameters {
      config[key] = value
    }
  }
  
  public func getAll() -> [AnyHashable: Any] {
    return config
  }
  
  public func stringValue(_ key: String) -> String? {
    guard let value = config[key] as? String else { return nil }
    return value
  }
  
  public func dictionaryValue(_ key: String) -> [AnyHashable: Any]? {
    guard let value = config[key] as? [AnyHashable: Any] else { return nil }
    return value
  }
  
  public func integerValue(_ key: String) -> Int? {
    guard let value = config[key] as? Int else { return nil }
    return value
  }
  
  public func floatValue(_ key: String) -> Double? {
    guard let value = config[key] as? Double else { return nil }
    return value
  }
  
  public func boolValue(_ key: String) -> Bool? {
    guard let value = config[key] as? Bool else { return nil }
    return value
  }
  
  public func arrayValue(_ key: String) -> [Any]? {
    guard let value = config[key] as? [Any] else { return nil }
    return value
  }
  
  public func set(_ key: String, value: Any) {
    config[key] = value
  }
  
  public func clear() {
    config.removeAll()
  }
}
