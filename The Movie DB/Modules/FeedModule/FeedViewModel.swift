//
//  FeedViewModel.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

protocol FeedViewModelProtocol {
  var moviesVO: Observable<[MovieVO]> { get } 
}

final class FeedViewModel: FeedViewModelProtocol {
  
  let homeRepository: HomeRepositoryProtocol
  private(set) var moviesVO: Observable<[MovieVO]> = Observable([])
  
  init(homeRepository: HomeRepositoryProtocol) {
    self.homeRepository = homeRepository
  }
  
  func getTopRatedMovies() {
    homeRepository.fetchMovies(with: .getTopRatedMovies, handler: .some {
      [weak self] moviesVO in
      guard let self = self else { return }
      self.moviesVO.accept(value: moviesVO)
    })
  }
}
