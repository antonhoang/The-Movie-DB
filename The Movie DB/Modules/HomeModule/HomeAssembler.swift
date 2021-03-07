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
    let networkManager = NetworkManager()
    let storageManager = StorageManager()
    let imageManager = ImageManager(network: networkManager)
    let homeRepository = HomeRepository(network: networkManager, storage: storageManager, imageManager: imageManager)
    let homeViewModel = HomeViewModel(repository: homeRepository)
    homeController.viewModel = homeViewModel
    return homeController
  }
}
