//
//  BaseSliderController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class BaseSliderController: UIViewController {
    
  var viewModel: BaseSliderViewModelProtocol!
  var coordinator: BaseSliderCoordinator!
  let menuVC = MenuController()
  
  let menuContainerView: MenuContainerView = {
    $0.backgroundColor = .white
    return $0
  }(MenuContainerView())
  
  let rightContainerView: RightContainerView = {
    return $0
  }(RightContainerView())
  
  let darkCoverView: DarkCoverView = {
    $0.backgroundColor = UIColor(white: 0, alpha: 0.7)
    $0.alpha = 0
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(DarkCoverView())
  
  var redLeadingConstraint: NSLayoutConstraint?
  var redTrailingConstraint: NSLayoutConstraint?
  
  let menuWidth: CGFloat = UIScreen.main.bounds.width * 0.75
  var isMenuOpen: Bool = false
  let velocityThreshold: CGFloat = 500.0
  
  fileprivate let homeNavController = UINavigationController()
  fileprivate let feedNavController = UINavigationController()
  fileprivate let favoriteNavController = UINavigationController()
  fileprivate let profileNavController = UINavigationController()
  fileprivate lazy var rightViewController: UIViewController = UINavigationController(rootViewController: coordinator.openHome(navController: homeNavController))

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .clear
    setupViews()
    setupViewControllers()
  }
  
  fileprivate func setupViews() {
    view.addSubview(menuContainerView)
    view.addSubview(rightContainerView)
    rightContainerView.translatesAutoresizingMaskIntoConstraints = false
    menuContainerView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      rightContainerView.topAnchor.constraint(equalTo: view.topAnchor),
      rightContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      menuContainerView.topAnchor.constraint(equalTo: view.topAnchor),
      menuContainerView.trailingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
      menuContainerView.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor),
      menuContainerView.widthAnchor.constraint(equalToConstant: menuWidth)
    ])
    
    redLeadingConstraint = rightContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
    redLeadingConstraint?.isActive = true
    
    redTrailingConstraint = rightContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
    redTrailingConstraint?.isActive = true
    
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(gesture:)))
    view.addGestureRecognizer(panGesture)
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss))
    darkCoverView.addGestureRecognizer(tapGesture)
  }
  
  fileprivate func setupViewControllers() {
    
    guard let feedView = rightViewController.view,
          let menuView = menuVC.view else { return }
    feedView.translatesAutoresizingMaskIntoConstraints = false
    menuView.translatesAutoresizingMaskIntoConstraints = false

    rightContainerView.addSubview(feedView)
    rightContainerView.addSubview(darkCoverView)
    menuContainerView.addSubview(menuView)

    NSLayoutConstraint.activate([
      feedView.topAnchor.constraint(equalTo: rightContainerView.topAnchor),
      feedView.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor),
      feedView.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor),
      feedView.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
      
      menuView.topAnchor.constraint(equalTo: menuContainerView.topAnchor),
      menuView.trailingAnchor.constraint(equalTo: menuContainerView.trailingAnchor),
      menuView.bottomAnchor.constraint(equalTo: menuContainerView.bottomAnchor),
      menuView.leadingAnchor.constraint(equalTo: menuContainerView.leadingAnchor),
      
      darkCoverView.topAnchor.constraint(equalTo: rightContainerView.topAnchor),
      darkCoverView.leadingAnchor.constraint(equalTo: rightContainerView.leadingAnchor),
      darkCoverView.bottomAnchor.constraint(equalTo: rightContainerView.bottomAnchor),
      darkCoverView.trailingAnchor.constraint(equalTo: rightContainerView.trailingAnchor)
    ])
    addChild(rightViewController)
    addChild(menuVC)
  }
    
  fileprivate func performRightViewCleanUp() {
    rightViewController.view.removeFromSuperview()
    rightViewController.removeFromParent()
  }
  
  fileprivate func coordinateToRightView(with child: UIViewController) {
    rightContainerView.addSubview(child.view)
    addChild(child)
    rightViewController = child
  }
  
  func didSelectHeaderView() {
    do {
      closeMenu()
    }
    performRightViewCleanUp()
    
    let controllersInStack = profileNavController.viewControllers
    if let profileController = controllersInStack.first(where: { $0 is ProfileController }) {
      let profileCoordinator = ProfileCoordinator(navController: profileController.navigationController!, window: self.coordinator.window)
      coordinateToRightView(with: profileCoordinator.navController)
    } else {
      let profileCoordinator = ProfileCoordinator(navController: profileNavController, window: self.coordinator.window)
      profileCoordinator.start()
      coordinateToRightView(with: profileCoordinator.navController)
    }
  }
    
  func didSelectItem(indexPath: IndexPath) {
    do {
      closeMenu()
    }
    performRightViewCleanUp()
    
    switch indexPath.row {
    case 0:
      let controllersInStack = feedNavController.viewControllers
      if let feedController = controllersInStack.first(where: { $0 is FeedController }) {
        let feedCoordinator = FeedCoordinator(navController: feedController.navigationController!)
        coordinateToRightView(with: feedCoordinator.navController)
      } else {
        let feedCoordinator = FeedCoordinator(navController: feedNavController)
        feedCoordinator.start()
        coordinateToRightView(with: feedCoordinator.navController)
      }
      
    case 1:
      let controllersInStack = homeNavController.viewControllers
      if let homeController = controllersInStack.first(where: { $0 is HomeController }) {
        let homeCoordinator = HomeCoordinator(navController: homeController.navigationController!)
        coordinateToRightView(with: homeCoordinator.navController)
      } else {
        let homeCoordinator = HomeCoordinator(navController: homeNavController)
        homeCoordinator.start()
        coordinateToRightView(with: homeCoordinator.navController)
      }
      
    case 2:
      let controllersInStack = favoriteNavController.viewControllers
      if let favoriteController = controllersInStack.first(where: { $0 is FavoriteController }) {
        let favoriteCoordinator = FavoriteCoordinator(navController: favoriteController.navigationController!)
        coordinateToRightView(with: favoriteCoordinator.navController)
      } else {
        let favoriteCoordinator = FavoriteCoordinator(navController: favoriteNavController)
        favoriteCoordinator.start()
        coordinateToRightView(with: favoriteCoordinator.navController)
      }
      
    default:
      break
    }
    rightContainerView.bringSubviewToFront(darkCoverView)
  }
}
