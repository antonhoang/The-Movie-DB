//
//  HomeAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class HomeAssembler: AssemblerProtocol {
  
  func assembly() -> HomeController {
    let homeController = HomeController()
    let homeViewModel = HomeViewModel()
    homeController.viewModel = homeViewModel
    return homeController
  }
}