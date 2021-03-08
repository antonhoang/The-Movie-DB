//
//  BaseController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  func setupNavigationBar(_ isTranslucent: Bool,
                          backgroundColor: UIColor,
                          barTintColor: UIColor,
                          shadowImage: UIImage?) {
    navigationController?.navigationBar.isTranslucent = isTranslucent
    navigationController?.navigationBar.backgroundColor = .clear
    navigationController?.navigationBar.barTintColor = .clear
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.setBackgroundImage(shadowImage, for: .default)
    navigationController?.navigationBar.shadowImage = shadowImage
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
}
