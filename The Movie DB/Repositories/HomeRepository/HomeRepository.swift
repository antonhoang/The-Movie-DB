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
  func fetchImageConfiguration() 
}

final class HomeRepository: HomeRepositoryProtocol {
  
  let network: NetworkManagerProtocol
  let storage: StorageManagerProtocol
  
  init(network: NetworkManagerProtocol,
       storage: StorageManagerProtocol) {
    self.network = network
    self.storage = storage
  }
  
  func fetchImageConfiguration() {
    let endPoint = RequestItem.getImageConfiguration
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self)
  }
  
  func fetchLatestMovies() {
    let endPoint = RequestItem.getLatestMovies
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self)
  }
  
  func fetchNowPlayingMovies() {
    let endPoint = RequestItem.getNowPlayingMovies
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self)
  }
  
  func fetchPopularMovies() {
    let endPoint = RequestItem.getPopularMovies
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self)
  }
  
  func fetchTopRatedMovies() {
    let endPoint = RequestItem.getTopRatedMovies
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self)
  }
  
  func fetchUpcomingMovies() {
    let endPoint = RequestItem.getUpcomingMovies
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self)
  }
  
  func fetchMovieFromDB() {
    storage.fetchData()
  }
}
