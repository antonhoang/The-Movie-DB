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
    
    g.notify(queue: .main, work: DispatchWorkItem(block: {
      print("FINISH")
    }))
  }
  
  let g = DispatchGroup()
  
  func fetchLatestMovies() {
    
    repository.fetchMovies(with: .getLatestMovies, handler: .some {
      item in
      print("-------------> 5", item)
    })
  }
  
  func fetchPopularMovies() {
    g.enter()
    repository.fetchMovies(with: .getPopularMovies, handler: .some {
      item in
      print("-------------> 2", item)
      self.g.leave()
    })
  }
  
  func fetchTopRatedMovies() {
    g.enter()
    repository.fetchMovies(with: .getTopRatedMovies, handler: .some {
      item in
      print("-------------> 3", item)
      self.g.leave()
    })
  }
  
  func fetchUpcomingMovies() {
    g.enter()
    repository.fetchMovies(with: .getUpcomingMovies, handler: .some {
      item in
      print("-------------> 4", item)
      self.g.leave()
    })
  }
  
  func fetchNowPlayingMovies() {
    g.enter()
    repository.fetchMovies(with: .getNowPlayingMovies, handler: .some {
      item in
      print(5)
      self.g.leave()
    })
  }
}
