//
//  AppCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation
import UIKit

final class AppCoordinator: CoordinatorProtocol {
  
  let window: UIWindow
//  let navController: UINavigationController
//  
//  init(window: UIWindow, navController: UINavigationController) {
//    self.window = window
//    self.navController = navController
//  }
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let baseCoordinator = BaseSliderCoordinator(window: window)
    coordinate(to: baseCoordinator)
    
//    let homeCoordinator = HomeCoordinator(navController: navController)
//    coordinate(to: homeCoordinator)
//    window.rootViewController = navController
//    window.makeKeyAndVisible()
  }
}
