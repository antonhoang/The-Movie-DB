//
//  AuthCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

protocol AuthFlow {
  func coordinateToBaseSlider()
  func coordinateToSignWithApple()
  func logout()
}

final class AuthCoordinator: CoordinatorProtocol, AuthFlow {
  
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let authViewController = AuthAssembler().assembly()
    authViewController.coordinator = self
    window.rootViewController = authViewController
    window.makeKeyAndVisible()
  }
  
  func logout() {
    let authViewController = AuthAssembler().assembly()
    authViewController.coordinator = self
//
//    let appCoordinator = AppCoordinator(window: window)
//    appCoordinator.switchRootViewController(vc: authViewController, animated: true, options: .transitionFlipFromLeft)
  }
  
  func coordinateToBaseSlider() {
    let baseSliderCoordinate = BaseSliderCoordinator(window: window)
    coordinate(to: baseSliderCoordinate)
  }
  
  func coordinateToSignWithApple() { }

}
