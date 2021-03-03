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

typealias ImageHandler = ((String) -> Void)?
typealias MovieVOHandler = ((MovieVO) -> Void)?

protocol HomeRepositoryProtocol {
  func fetchMovies(with endPoint: RequestItem, handler: MovieVOHandler)
}

final class HomeRepository: HomeRepositoryProtocol {
  
  let network: NetworkManagerProtocol
  let storage: StorageManagerProtocol
  
  init(network: NetworkManagerProtocol,
       storage: StorageManagerProtocol) {
    self.network = network
    self.storage = storage
  }
  
  func fetchMovies(with endPoint: RequestItem, handler: MovieVOHandler) {
    network.sendDataRequest(endPoint: endPoint, response: MovieData.self, handler: .some {
      [weak self] movieData in
      guard let sSelf = self else { return }
      sSelf.responseData(with: movieData, handler: handler)
    })
  }
  
  fileprivate func responseData(with response: Result<MovieData, Error>, handler: MovieVOHandler) {
    do {
      _ = try response.get().results.map { movie in
        if let posterPath = movie.poster_path {
          fetchImageConfiguration(with: .secure, size: .w154, handler: .some {
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
  
  fileprivate func fetchImageConfiguration(with secureType: SecureType, size: LogoSizes, handler: ImageHandler) {
    let endPoint = RequestItem.getImageConfiguration
    network.sendDataRequest(endPoint: endPoint, response: ImagesData.self, handler: .some { (imageData) in
      
      do {
        guard let imageConfig = try imageData.get().images else { return }
        
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
    })
  }
  
  func fetchMovieFromDB() {
    storage.fetchData()
  }
}
