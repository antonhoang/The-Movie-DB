//
//  DetailsCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class DetailsCoordinator: CoordinatorProtocol {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let homeVC = DetailsAssembler().assembly()
    navController.pushViewController(homeVC, animated: false)
  }
}
