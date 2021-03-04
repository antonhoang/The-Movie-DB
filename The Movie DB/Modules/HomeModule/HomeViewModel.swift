//
//  HomeViewModel.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

protocol HomeViewModelProtocol {
  func fetchLatestMovies()
  func fetchPopularMovies()
  func fetchTopRatedMovies()
  func fetchUpcomingMovies()
  func fetchNowPlayingMovies()
}

final class HomeViewModel: HomeViewModelProtocol {
  
  let repository: HomeRepositoryProtocol
  
  init(repository: HomeRepositoryProtocol) {
    self.repository = repository
    fetchAllMovies()
  }
  

  func fetchAllMovies() {
    fetchPopularMovies()
    fetchTopRatedMovies()
    fetchUpcomingMovies()
    fetchNowPlayingMovies()
  }
  
  func fetchLatestMovies() {
    repository.fetchMovies(with: .getLatestMovies, handler: .some {
      item in
      print(1)
    })
  }
  
  func fetchPopularMovies() {
    repository.fetchMovies(with: .getPopularMovies, handler: .some {
      item in
      print(2)
    })
  }
  
  func fetchTopRatedMovies() {
    repository.fetchMovies(with: .getTopRatedMovies, handler: .some {
      item in
      print(3)
    })
  }
  
  func fetchUpcomingMovies() {
    repository.fetchMovies(with: .getUpcomingMovies, handler: .some {
      item in
      print(4)
    })
  }
  
  func fetchNowPlayingMovies() {
    repository.fetchMovies(with: .getNowPlayingMovies, handler: .some {
      item in
      print(5)
    })
  }
}
