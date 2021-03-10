//
//  ProfileCoordinator.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileCoordinatorFlow {
//  func coordinateToProfileContent(with index: Int, content: [String])
//  func coordinateToSettings()
//  func coordinateToSubs(with type: SubscriberListCoordinator.SubscriberType)
}

final class ProfileCoordinator: CoordinatorProtocol {
  
  let navController: UINavigationController
  let window: UIWindow
  
  init(navController: UINavigationController, window: UIWindow) {
    self.navController = navController
    self.window = window
  }
  
  func start() {
    let profileViewController = ProfileAssembler().assembly()
    profileViewController.coordinator = self
    navController.pushViewController(profileViewController, animated: false)
  }
  
//  func coordinateToProfileContent(with index: Int, content: [String]) {
//    let profileContentCoordinator = ProfileContentCoordinator(navController: navController, index: index, content: content)
//    coordinate(to: profileContentCoordinator)
//  }
//
//  func coordinateToSettings() {
//    let settingCoordinator = SettingsCoordinator(navController: navController, window: window)
//    coordinate(to: settingCoordinator)
//  }
//
//  func coordinateToSubs(with type: SubscriberListCoordinator.SubscriberType) {
//    let subscriberListCoordinator = SubscriberListCoordinator(navController: navController, with: type)
//    coordinate(to: subscriberListCoordinator)
//  }
}
