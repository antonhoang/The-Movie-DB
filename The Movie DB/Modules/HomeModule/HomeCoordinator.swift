//
//  HomeCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

protocol HomeCoordinatorFlow {
  func coordinateToDetails()
}

final class HomeCoordinator: CoordinatorProtocol, HomeCoordinatorFlow {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let homeVC = HomeAssembler().assembly()
    homeVC.coordinator = self 
    navController.pushViewController(homeVC, animated: false)
  }
  
  func coordinateToDetails() {
    let detailsCoordinator = DetailsCoordinator(navController: navController)
    coordinate(to: detailsCoordinator)
  }
}