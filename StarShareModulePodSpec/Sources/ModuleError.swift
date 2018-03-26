//
//  ModuleError.swift
//  Titan
//
//  Created by BUBUKO on 2018/3/23.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public enum ModuleError: Swift.Error {
  
  case notComplyModuleProtocol
  case missModuleName
  case missModuleVersion
  case moduleDisable
}

extension ModuleError {
  
  public var localizedDescription: String {
    switch self {
    case .notComplyModuleProtocol:
      return ""
    case .missModuleName:
      return ""
    case .missModuleVersion:
      return ""
    case .moduleDisable:
      return ""
    }
  }
}
