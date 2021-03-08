//
//  HomeCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

protocol HomeCoordinatorFlow {
  func coordinateToDetails(with movieVO: MovieVO, navController: UINavigationController)
  func openHome() -> HomeController
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
  
  func openHome() -> HomeController {
    let homeVC = HomeAssembler().assembly()
    homeVC.coordinator = self
    return homeVC
  }
  
  func coordinateToDetails(with movieVO: MovieVO, navController: UINavigationController) {
    let detailsCoordinator = DetailsCoordinator(navController: navController, movieVO: movieVO)
    coordinate(to: detailsCoordinator)
  }
}
