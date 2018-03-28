//
//  SignService.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/28.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

extension ServiceName {
  static let SignService = ServiceName("SignService")
}

public protocol SignServiceProtocol: Service {
  func login() -> String
}

public class SignService: SignServiceProtocol {
  
  public func login() -> String {
    return "bubuko"
  }
  
  public required init() {
    
  }
}
