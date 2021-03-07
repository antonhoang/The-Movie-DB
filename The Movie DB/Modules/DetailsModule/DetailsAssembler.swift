//
//  DetailsAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

final class DetailsAssembler: AssemblerProtocol {
  
  let movieVO: MovieVO
  
  init(movieVO: MovieVO) {
    self.movieVO = movieVO
  }
  
  func assembly() -> DetailsController {
    let detailsController = DetailsController()
    let networkManager = NetworkManager()
    let imageManager = ImageManager(network: networkManager)
    let detailsRepository = DetailsRepository(network: networkManager, imageManager: imageManager)
    let detailsViewModel = DetailsViewModel(repository: detailsRepository)
    detailsViewModel.movieVO = movieVO 
    detailsController.viewModel = detailsViewModel
    return detailsController
  }
}
