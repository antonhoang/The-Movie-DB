//
//  RequestItem.swift
//  The Movie DB
//
//  Created by Anton Hoang on 22.02.2021.
//

import Foundation

//struct RequestItem {
//  // "6bc047b88f669d1fb86574f06381005d93d3517a" REQUEST TOKEN


enum RequestItem {
  case getLatestMovies
}

extension RequestItem: EndPointType {
  
  var scheme: String {
    switch self {
    case .getLatestMovies:
      return "https"
    }
  }
  
  var host: String {
    switch self {
    case .getLatestMovies:
      return "api.themoviedb.org"
    }
  }
  
  var path: String {
    switch self {
    case .getLatestMovies:
      return "/3/movie/latest"
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    case .getLatestMovies:
      return .get
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .getLatestMovies:
      return ["Authorization" : "Bearer \(Constants.APICreditials.bearer.rawValue)"]
    }
  }
  
  var queryParameters: [String : String]? {
    switch self {
    case .getLatestMovies:
      return ["api_key" : "\(Constants.APICreditials.api_key.rawValue)",
              "language" : "en-US"]
    }
  }
}

