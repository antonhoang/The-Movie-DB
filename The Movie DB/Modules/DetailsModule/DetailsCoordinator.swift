//
//  DetailsCoordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

protocol DetailsCoordinatorFlow { }

final class DetailsCoordinator: CoordinatorProtocol, DetailsCoordinatorFlow {
  
  let navController: UINavigationController
  let movieVO: MovieVO
  
  init(navController: UINavigationController, movieVO: MovieVO) {
    self.navController = navController
    self.movieVO = movieVO
  }
  
  func start() {
    let detailsVC = DetailsAssembler(movieVO: movieVO).assembly()
    detailsVC.coordinator = self
    navController.pushViewController(detailsVC, animated: true)
  }
}
