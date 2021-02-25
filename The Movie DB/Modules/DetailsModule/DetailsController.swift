//
//  DetailsController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class DetailsController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  fileprivate func setupUI() {
    navigationItem.title = "Home"
    view.backgroundColor = .systemTeal
  }
}
