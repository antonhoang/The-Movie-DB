//
//  DetailsRepository.swift
//  The Movie DB
//
//  Created by Anton Hoang on 07.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

protocol DetailsRepositoryProtocol {
  func getDetails(movieId: Int)
}

final class DetailsRepository: DetailsRepositoryProtocol {
  
  let network: NetworkManagerProtocol

  init(network: NetworkManagerProtocol) {
    self.network = network
  }
  
  func getDetails(movieId: Int) {
    let endPoint = RequestItem.getDetailsMovie(movie_id: movieId)
    network.sendDataRequest(endPoint: endPoint, response: DetailsData.self) { (response) in
      print(response)
    }
  }
}
