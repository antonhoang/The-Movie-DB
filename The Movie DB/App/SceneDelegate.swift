//
//  SceneDelegate.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    self.window = window
    
    let appCoordinator = AppCoordinator(window: window)
    appCoordinator.start()
  }
}

