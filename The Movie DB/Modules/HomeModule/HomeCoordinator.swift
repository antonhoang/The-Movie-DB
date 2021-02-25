//
//  HomeCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class HomeCoordinator: CoordinatorProtocol {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let homeVC = HomeAssembler().assembly()
    navController.pushViewController(homeVC, animated: false)
  }
}
