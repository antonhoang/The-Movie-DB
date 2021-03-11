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
    switchRootViewController(vc: baseSliderController, options: .transitionFlipFromLeft)
  }
  
  func switchRootViewController(vc: UIViewController, animated: Bool = true, options: UIView.AnimationOptions) {
    window.rootViewController = vc
    window.makeKeyAndVisible()

    UIView.transition(
      with: window,
      duration: 0.6,
      options: [options],
      animations: nil,
      completion: nil)
  }
  
  func openHome(navController: UINavigationController) -> HomeController {
    let homeCoordinator = HomeCoordinator(navController: navController)
    return homeCoordinator.openHome()
  }
}
