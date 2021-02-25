//
//  HomeRepository.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

protocol HomeRepositoryProtocol {
  func fetchMovies()
}

final class HomeRepository: HomeRepositoryProtocol {
  
  let network: NetworkManagerProtocol
  
  init(network: NetworkManagerProtocol) {
    self.network = network
  }
  
  func fetchMovies() {
    network.sendDataRequest()
  }
}
