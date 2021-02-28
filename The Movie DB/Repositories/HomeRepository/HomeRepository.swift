//
//  HomeRepository.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

protocol HomeRepositoryProtocol {
  func fetchLatestMovies()
  func fetchNowPlayingMovies()
  func fetchPopularMovies()
  func fetchTopRatedMovies()
  func fetchUpcomingMovies() 
}

final class HomeRepository: HomeRepositoryProtocol {
  
  let network: NetworkManagerProtocol
  let storage: StorageManagerProtocol
  
  init(network: NetworkManagerProtocol,
       storage: StorageManagerProtocol) {
    self.network = network
    self.storage = storage
  }
  
  func fetchLatestMovies() {
    let endPoint = RequestItem.getLatestMovies
    network.testRequest(endPoint: endPoint)
  }
  
  func fetchNowPlayingMovies() {
    let endPoint = RequestItem.getNowPlayingMovies
    network.testRequest(endPoint: endPoint)
  }
  
  func fetchPopularMovies() {
    let endPoint = RequestItem.getPopularMovies
    network.testRequest(endPoint: endPoint)
  }
  
  func fetchTopRatedMovies() {
    let endPoint = RequestItem.getTopRatedMovies
    network.testRequest(endPoint: endPoint)
  }
  
  func fetchUpcomingMovies() {
    let endPoint = RequestItem.getUpcomingMovies
    network.testRequest(endPoint: endPoint)
  }
  
  func fetchMovieFromDB() {
    storage.fetchData()
  }
}
