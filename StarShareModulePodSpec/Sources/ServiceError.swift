//
//  ServiceError.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/28.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public enum ServiceError: Swift.Error {
  
  case serviceHasBeenRegisted
  case serviceInstantiationFailure
  case createServiceClassFailed
  case createServiceFailed
}

extension ServiceError {
  
  public var localizedDescription: String {
    switch self {
    case .serviceHasBeenRegisted:
      return "Service has been registed."
    case .serviceInstantiationFailure:
      return "Service instantiation failure."
    case .createServiceClassFailed:
      return "Create service class failed."
    case .createServiceFailed:
      return "Create service failed."
    }
  }
}
