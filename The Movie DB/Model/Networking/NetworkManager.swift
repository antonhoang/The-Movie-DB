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
  
  fileprivate let requestTimeout: Double = 25.0
  
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
  
  func buildRequestWithURL(endPoint: EndPointType) -> URLRequest? {
    if let url = constructURLFromEndpoints(endPoint: endPoint) {
      var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: requestTimeout)
      request.httpMethod = endPoint.httpMethod.rawValue
      
      if let headers = endPoint.headers {
        if request.allHTTPHeaderFields == nil {
          request.allHTTPHeaderFields = [:]
        }
        request.allHTTPHeaderFields?.merge(headers, uniquingKeysWith: { (_, new) in new })
      }
      return request
    }
    
    return nil
  }
  
  func testRequest() {
    let reqItem = RequestItem.getLatestMovies
    
    if let request = buildRequestWithURL(endPoint: reqItem) {
      let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        guard let data = data else { return }
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print(json)
      }
      
      task.resume()
    }
  }
}


