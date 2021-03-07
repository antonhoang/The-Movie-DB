//
//  DetailsViewModel.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

protocol DetailsViewModelProtocol {
  var movieVO: MovieVO? { get }
  var detailsVO: Observable<DetailsVO> { get }
}

final class DetailsViewModel: DetailsViewModelProtocol {
  
  let repository: DetailsRepositoryProtocol
  var movieVO: MovieVO?
  var detailsVO: Observable<DetailsVO> = .init(DetailsVO())
  
  init(repository: DetailsRepositoryProtocol) {
    self.repository = repository
    
    let queue = DispatchQueue(label: "details-queue", qos: .default)
    queue.async { [weak self] in
      self?.getMovieDetails()
    }
  }
  
  func getMovieDetails() {
    if let movieId = movieVO?.id {
      repository.getDetails(movieId: movieId, handler: .some{
        [weak self] (detVO) in
        guard let self = self else { return }
        self.detailsVO.value = detVO
        self.detailsVO.accept(value: detVO)
        print(self.detailsVO.value)
      })
    }
  }
}
