//
//  NetworkManager.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

typealias DataHandler<T> = ((Result<T, Error>) -> Void)?

protocol NetworkManagerProtocol {
  func sendDataRequest<T: Codable>(endPoint: EndPointType, response: T.Type, handler: DataHandler<T>)
}

final class NetworkManager: NetworkManagerProtocol {
  
  fileprivate let requestTimeout: Double = 25.0
  
  func sendDataRequest<T: Codable>(endPoint: EndPointType, response: T.Type, handler: DataHandler<T>) {
    if let request = buildRequestWithURL(endPoint: endPoint) {
      let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        guard let data = data else { return }
        let decoder = JSONDecoder()
        do {
          let json = try decoder.decode(T.self, from: data)
          handler?(.success(json))
        } catch let error {
          handler?(.failure(error))
          print(error)
        }
      }
      
      task.resume()
    }
  }
  
  fileprivate func constructURLFromEndpoints(endPoint: EndPointType) -> URL? {
    var components = URLComponents()
    components.scheme = endPoint.scheme
    components.host = endPoint.host
    components.path = endPoint.path
    
    if let queryParameters = endPoint.queryParameters {
      components.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    if let url = components.url {
      return url
    }
    return nil
  }
  
  fileprivate func buildRequestWithURL(endPoint: EndPointType) -> URLRequest? {
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
  

}


