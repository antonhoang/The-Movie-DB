//
//  DetailsCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

protocol DetailsCoordinatorFlow {
  
}

final class DetailsCoordinator: CoordinatorProtocol, DetailsCoordinatorFlow {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let detailsVC = DetailsAssembler().assembly()
    detailsVC.coordinator = self
    navController.pushViewController(detailsVC, animated: true)
  }
}
