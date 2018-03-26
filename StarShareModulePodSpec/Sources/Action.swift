//
//  Action.swift
//  Titan
//
//  Created by BUBUKO on 2018/3/22.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation

public struct Inner<R> {
  var request: R
  
  init(request: R) {
    self.request = request
  }
}

public struct Outer<T> {
  var response: T?
  var error: Swift.Error?
  
  init(response: T) {
    self.response = response
  }
  
  init(error: Swift.Error) {
    self.error = error
  }
}

public protocol Action {
  associatedtype T
  associatedtype R
  
  func excute(_ actionRequest: Inner<R>,
              context: Context) -> Outer<T>
  
  func excute(_ actionRequest: Inner<R>,
              context: Context,
              completion: @escaping (Outer<T>) -> Void)
  
  func getActionName() -> String
}
