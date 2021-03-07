//
//  ImageRepository.swift
//  The Movie DB
//
//  Created by Anton Hoang on 07.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

typealias ImageHandler = ((String) -> Void)?

protocol ImageManagerProtocol {
  func fetchImageConfiguration(with secureType: SecureType, size: LogoSizes, handler: ImageHandler)
}

final class ImageManager: ImageManagerProtocol {
  
  let network: NetworkManagerProtocol
  
  init(network: NetworkManagerProtocol) {
    self.network = network
  }
  
  internal func fetchImageConfiguration(with secureType: SecureType, size: LogoSizes, handler: ImageHandler) {
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
}
