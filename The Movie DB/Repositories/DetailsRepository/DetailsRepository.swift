//
//  DetailsRepository.swift
//  The Movie DB
//
//  Created by Anton Hoang on 07.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

typealias DetailsVOHandler = ((DetailsVO) -> Void)?

protocol DetailsRepositoryProtocol {
  func getDetails(movieId: Int, handler: DetailsVOHandler)
}

final class DetailsRepository: DetailsRepositoryProtocol {
  
  let network: NetworkManagerProtocol
  let imageManager: ImageManagerProtocol

  init(network: NetworkManagerProtocol,
       imageManager: ImageManagerProtocol) {
    self.network = network
    self.imageManager = imageManager
  }
  
  func getDetails(movieId: Int, handler: DetailsVOHandler) {
    let endPoint = RequestItem.getDetailsMovie(movie_id: movieId)
    network.sendDataRequest(endPoint: endPoint, response: DetailsData.self) { [weak self] (detailsData) in
      guard let self = self else { return }
      self.responseData(with: detailsData, handler: handler)
    }
  }
  
  fileprivate func responseData(with response: Result<DetailsData, Error>, handler: DetailsVOHandler) {
    do {
      let details = try response.get()
      imageManager.fetchImageConfiguration(with: .secure, size: .w300, handler: .some {
        imagePath in
        let imageUrlPath = imagePath + details.backdrop_path
        let detailVO = DetailsVO(details: details, imageUrlPath: imageUrlPath)
        handler?(detailVO)
      })
    } catch let error {
      print(error)
    }
  }
}
