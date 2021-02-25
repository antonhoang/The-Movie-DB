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
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    window.rootViewController = UIViewController()
    window.makeKeyAndVisible()
  }
}
