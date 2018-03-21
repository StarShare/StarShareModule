//
//  Context.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import Foundation
import UIKit

public enum EnvironmentType {
  case dev
  case test
  case prod
}

public class Context {
  
  public static let shared = Context()
  public var env = EnvironmentType.prod
  public var config = Config()
  
  public var application: UIApplication!
  public var launchOptions: [AnyHashable: Any] = [:]
  
  public var touchShortcutItem = ShortcutItem()
  public var openURLItem = OpenURLItem()
  public var notificationsItem = NotificationsItem()
  public var userActivityItem = UserActivityItem()
  
  init() {}
}
