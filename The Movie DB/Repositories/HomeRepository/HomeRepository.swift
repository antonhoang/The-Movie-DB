//
//  HomeRepository.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

enum LogoSizes: String {
  case w154
  case w300
  case original
}

enum SecureType {
  case base
  case secure
}

enum PosterType {
  case small
  case regular
}

typealias ImageHandler = ((String) -> Void)?
typealias MovieVOHandler = ((MovieVO) -> Void)?

protocol HomeRepositoryProtocol {
  func fetchLatestMovies()
  func fetchPopularMovies()
  func fetchTopRatedMovies()
  func fetchUpcomingMovies()
  func fetchNowPlayingMovies(handler: MovieVOHandler)
  func fetchImageConfiguration(with secureType: SecureType, size: LogoSizes, handler: ImageHandler)
}

final class HomeRepository: HomeRepositoryProtocol {
  
  let network: NetworkManagerProtocol
  let storage: StorageManagerProtocol
  
  init(network: NetworkManagerProtocol,
       storage: StorageManagerProtocol) {
    self.network = network
    self.storage = storage
  }
  
  func fetchImageConfiguration(with secureType: SecureType, size: LogoSizes, handler: ImageHandler) {
       
    let endPoint = RequestItem.getImageConfiguration
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self, handler: .some({ (ic) in
      
      do {
        guard let imageConfig = try ic.get().images else { return }
        
        switch secureType {
        case .base:
          if let url = imageConfig.base_url {
            let imagePath = url + size.rawValue
            handler?(imagePath)
          }
          
        case .secure:
          if let url = imageConfig.secure_base_url {
            let imagePath = url + size.rawValue
            handler?(imagePath)
          }
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
  
  func fetchNowPlayingMovies(handler: MovieVOHandler) {
    let endPoint = RequestItem.getNowPlayingMovies    
    network.sendDataRequest(endPoint: endPoint, response: MovieData.self) {
      (movieData) in
      
      do {
        _ = try movieData.get().results.map { movie in
          if let posterPath = movie.poster_path {
            self.fetchImageConfiguration(with: .secure, size: .w154, handler: .some {
              imagePath in
              let imageUrlPath = imagePath + posterPath
              let movieVO = MovieVO(movie: movie, imageUrlPath: imageUrlPath)
              handler?(movieVO)
            })
          }
        }
  
      } catch let error {
        print(error)
      }
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

struct MovieVO {
  let id: Int
  let original_title: String
  let overview: String
  let vote_average: Float?
  let vote_count: Int?
  let imageUrlPath: String?
  
  init(movie: Movie, imageUrlPath: String?) {
    self.id = movie.id
    self.original_title = movie.original_title
    self.overview = movie.overview
    self.vote_average = movie.vote_average
    self.vote_count = movie.vote_count
    self.imageUrlPath = imageUrlPath
  }
}
