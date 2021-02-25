//
//  NetworkManager.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

protocol NetworkManagerProtocol {
  func sendDataRequest()
}

final class NetworkManager: NetworkManagerProtocol {
  func sendDataRequest() {
    print(#function)
  }
}


