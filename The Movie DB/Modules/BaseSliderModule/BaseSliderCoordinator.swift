//
//  BaseSliderCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class BaseSliderCoordinator: CoordinatorProtocol {
  
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let baseSliderController = BaseSliderAssembler().assembly()
    baseSliderController.coordinator = self
    
    let appCoordinator = AppCoordinator(window: window)
//    appCoordinator.switchRootViewController(vc: baseSliderController, animated: true, options: .transitionFlipFromRight)
    window.rootViewController = baseSliderController
    window.makeKeyAndVisible()
  }
}
