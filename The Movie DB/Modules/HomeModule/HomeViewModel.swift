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
    fetchPopularMovies()
  }
  
  func fetchLatestMovies() {
    repository.fetchMovies(with: .getLatestMovies, handler: .some {
      item in
      print(item)
    })
  }
  
  func fetchPopularMovies() {
    repository.fetchMovies(with: .getPopularMovies, handler: .some {
      item in
      print(item)
    })
  }
  
  func fetchTopRatedMovies() {
    repository.fetchMovies(with: .getTopRatedMovies, handler: .some {
      item in
      print(item)
    })
  }
  
  func fetchUpcomingMovies() {
    repository.fetchMovies(with: .getUpcomingMovies, handler: .some {
      item in
      print(item)
    })
  }
  
  func fetchNowPlayingMovies() {
    repository.fetchMovies(with: .getNowPlayingMovies, handler: .some {
      item in
      print(item)
    })
  }
}
