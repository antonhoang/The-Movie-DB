//
//  NetworkManager.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

protocol NetworkManagerProtocol {
  func sendDataRequest()
  func testRequest()
}

final class NetworkManager: NetworkManagerProtocol {
  func sendDataRequest() {
    print(#function)
  }
  
  func constructURLFromEndpoints(endPoint: EndPointType) -> URL? {
    var components = URLComponents()
    components.scheme = endPoint.scheme
    components.host = endPoint.host
    components.path = endPoint.path
    
    if endPoint.queryParameters != nil {
      components.queryItems = endPoint.queryParameters?.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    if let url = components.url {
      return url
    }
    return nil
  }
  
  func testRequest() {
    let reqItem = RequestItem.getLatestMovies
    
    let s = constructURLFromEndpoints(endPoint: reqItem)
    print("sss" , s)
//    let timeout = 25.0
//    if let url = URL(string: "https://api.themoviedb.org/3/movie/latest?api_key=a1e6469b9c841dbf821f4ef57f4d74f0&language=en-US") {
//      let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeout)
//      let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//        guard let data = data else { return }
//        let json = try? JSONSerialization.jsonObject(with: data, options: [])
//      }
//
//      task.resume()
//    }
  }
}


