//
//  SettingsCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 13.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsFlow {
  func logout()
}

final class SettingsCoordinator: CoordinatorProtocol, SettingsFlow {
  
  let navController: UINavigationController
  let window: UIWindow
  
  init(navController: UINavigationController,
       window: UIWindow) {
    self.navController = navController
    self.window = window
  }
  
  func start() {
    let settingsViewController = SettingsAssembler().assembly()
    settingsViewController.coordinator = self
    navController.pushViewController(settingsViewController, animated: true)
  }
  
  func logout() {
    let authCoordinator = AuthCoordinator(window: window)
    authCoordinator.logout()
  }
}
