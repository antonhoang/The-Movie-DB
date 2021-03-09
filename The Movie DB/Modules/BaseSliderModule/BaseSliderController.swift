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
  fileprivate let postNavController = UINavigationController()
  fileprivate let feedNavController = UINavigationController()
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
    
  func didSelectItem(indexPath: IndexPath) {
    do {
      closeMenu()
    }
    performRightViewCleanUp()
    
    switch indexPath.row {
    case 0:
      print("")
//      let vc = UINavigationController(rootViewController: SettingsController())
//      rightContainerView.addSubview(vc.view)
//      addChild(vc)
//      rightViewController = vc
      
    case 1:
      print("")
//      let controllersInStack = licoinNavController.viewControllers
//      if let licoinViewController = controllersInStack.first(where: { $0 is LicoinController }) {
//        let licoinCoordinator = LicoinCoordinator(navController: licoinViewController.navigationController!)
//        coordinateToRightView(with: licoinCoordinator.navController)
//      } else {
//        let licoinCoordinator = LicoinCoordinator(navController: licoinNavController)
//        licoinCoordinator.start()
//        coordinateToRightView(with: licoinCoordinator.navController)
//      }
      
    case 2:
      print("")
//      rightViewController = FeedAssembler().assembly()
//      rightContainerView.addSubview(rightViewController.view)
//      addChild(rightViewController)
      
//      let vc = UINavigationController(rootViewController: SettingsController())
//      rightContainerView.addSubview(vc.view)
//      addChild(vc)
//      rightViewController = vc
      
    case 3:
      print("")
//      DispatchQueue.main.async {
//        guard let tabBarVC = self.tabBarCurrent
//        else {
//          let tabBarCoordinator = TabBarCoordinator(window: self.coordinator.window)
//          self.tabBarCurrent = tabBarCoordinator.tabBarController
//          tabBarCoordinator.start()
//          self.coordinateToRightView(with: self.tabBarCurrent)
//          return
//        }
//        self.coordinateToRightView(with: tabBarVC)
//      }
            
    case 4:
      print("")
//      let controllersInStack = postNavController.viewControllers
//      if let postViewController = controllersInStack.first(where: { $0 is PostController }) {
//        let postCoordinator = PostCoordinator(navController: postViewController.navigationController!)
//        coordinateToRightView(with: postCoordinator.navController)
//      } else {
//        let postCoordinator = PostCoordinator(navController: postNavController)
//        postCoordinator.start()
//        coordinateToRightView(with: postCoordinator.navController)
//      }
      
    default:
      break
    }
    rightContainerView.addSubview(rightViewController.view)
    addChild(rightViewController)
    rightContainerView.bringSubviewToFront(darkCoverView)
  }
}
