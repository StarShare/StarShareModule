//
//  ViewController.swift
//  StarShareModulePodSpec
//
//  Created by BUBUKO on 2018/3/21.
//  Copyright © 2018年 gakki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    ModuleManager.shared.doEvent(.didCustomEvent(name: EventName("loginSuccess"), object: "hello word!"))
    
    do {
      if let service = try ServiceManager.shared.create(service: ServiceName.SignService) as? SignService {
        print("User ID: \(service.login())")
      }
    } catch {
      print("create SignService failed.")
    }
  }
}

