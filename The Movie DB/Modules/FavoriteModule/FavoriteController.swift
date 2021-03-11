//
//  FavoriteController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class FavoriteController: BaseController {
  
  var viewModel: FavoriteViewModelProtocol?
  var coordinator: FavoriteCoordinatorFlow?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemTeal
    
  }
}
