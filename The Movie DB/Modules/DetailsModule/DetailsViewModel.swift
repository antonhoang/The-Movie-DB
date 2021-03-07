//
//  DetailsViewModel.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

protocol DetailsViewModelProtocol {
 
}

final class DetailsViewModel: DetailsViewModelProtocol {
  
  let repository: DetailsRepositoryProtocol
  var movieVO: MovieVO?
  
  init(repository: DetailsRepositoryProtocol) {
    self.repository = repository
    
    let queue = DispatchQueue(label: "details-queue")
    queue.async { [weak self] in
      self?.getMovieDetails()
    }
  }
  
  func getMovieDetails() {
    if let movieId = movieVO?.id {
      repository.getDetails(movieId: movieId)
    }
  }
  
}
