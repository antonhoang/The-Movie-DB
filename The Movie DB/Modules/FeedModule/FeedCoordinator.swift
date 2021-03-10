//
//  FeedCoordinator.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

protocol FeedFlow {
  func coordinateToCard(imageStr: String)
}

final class FeedCoordinator: CoordinatorProtocol, FeedFlow {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    let feedViewController = FeedAssembler().assembly()
    feedViewController.coordinator = self
    navController.pushViewController(feedViewController, animated: false)
  }
  
  func coordinateToCard(imageStr: String) {
//    let cardCoordinator = CardCoordinator(navController: navController, details: imageStr)
//    coordinate(to: cardCoordinator)
  }
}
