//
//  FavoriteCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

protocol FavoriteCoordinatorFlow {
  
}

final class FavoriteCoordinator: CoordinatorProtocol, FavoriteCoordinatorFlow {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let favController = FavoriteAssembler().assembly()
    favController.coordinator = self
    navController.pushViewController(favController, animated: true)
  }
}
