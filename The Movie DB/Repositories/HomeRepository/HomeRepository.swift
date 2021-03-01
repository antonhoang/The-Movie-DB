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
  
  enum SecureType {
    case base
    case secure
  }
  
  func setImage(with secureType: SecureType, size: LogoSizes) -> String {
  
    return ""
  }
  
  func fetchImageConfiguration() {
    let endPoint = RequestItem.getImageConfiguration
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self, handler: .some({ (ic) in
      
      do {
        if let imageConfig = try ic.get().images {
          print(imageConfig)
        }
      } catch let error {
        print(error)
      }
    }))
  }
  
  func fetchLatestMovies() {
    let endPoint = RequestItem.getLatestMovies
    network.sendDataRequest(endPoint: endPoint, response: MovieData.self, handler: .none)
  }
  
  func fetchNowPlayingMovies() {
    let endPoint = RequestItem.getNowPlayingMovies    
    network.sendDataRequest(endPoint: endPoint, response: MovieData.self) { (movie) in
      
      movie.map({ $0.results.map { mov in
        if let posterPath = mov.poster_path {
          let path = self.setImage(with: .secure, size: .w154) + posterPath
          print(path)
        }
      }})
    }
  }
  
  func fetchPopularMovies() {
    let endPoint = RequestItem.getPopularMovies
    network.sendDataRequest(endPoint: endPoint, response: MovieData.self, handler: nil)
  }
  
  func fetchTopRatedMovies() {
    let endPoint = RequestItem.getTopRatedMovies
    network.sendDataRequest(endPoint: endPoint, response: MovieData.self, handler: .none)
  }
  
  func fetchUpcomingMovies() {
    let endPoint = RequestItem.getUpcomingMovies
    network.sendDataRequest(endPoint: endPoint, response: MovieData.self, handler: .none)
  }
  
  func fetchMovieFromDB() {
    storage.fetchData()
  }
}
