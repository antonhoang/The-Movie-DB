//
//  HomeViewModel.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

protocol HomeViewModelProtocol {
  func getMoviesList()
}

final class HomeViewModel: HomeViewModelProtocol {
  
  let repository: HomeRepositoryProtocol
  
  init(repository: HomeRepositoryProtocol) {
    self.repository = repository
  }
  
  func getMoviesList() {
    repository.fetchMovies()
  }
}