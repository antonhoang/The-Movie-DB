//
//  DetailsAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

final class DetailsAssembler: AssemblerProtocol {
  
  func assembly() -> DetailsController {
    let detailsController = DetailsController()
    let networkManager = NetworkManager()
    let storageManager = StorageManager()
    let homeRepository = HomeRepository(network: networkManager, storage: storageManager)
    let detailsViewModel = DetailsViewModel(repository: homeRepository)
    detailsController.viewModel = detailsViewModel
    return detailsController
  }
}
