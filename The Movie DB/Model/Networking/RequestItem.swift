//
//  RequestItem.swift
//  The Movie DB
//
//  Created by Anton Hoang on 22.02.2021.
//

import Foundation

//struct RequestItem {
//  // "6bc047b88f669d1fb86574f06381005d93d3517a" REQUEST TOKEN
//  let API_KEY = "a1e6469b9c841dbf821f4ef57f4d74f0" // v3 auth value // key - api_key
//
//  let TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMWU2NDY5YjljODQxZGJmODIxZjRlZjU3ZjRkNzRmMCIsInN1YiI6IjYwMzM1OGY5OWFmMTcxMDAzZjQ1YjNiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.H-f-0iZNchiOoPmJc42k5p7vszMqsvOqd9K-6p1JiL0" //  Bearer token v4 auth
//}

enum RequestItem {
  case getLatestMovies
}

//https://api.themoviedb.org/3/movie/550?api_key=a1e6469b9c841dbf821f4ef57f4d74f0

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
      return ["ContentType": "application/json"]
    }
  }
  
  var queryParameters: [String : String]? {
    switch self {
    case .getLatestMovies:
      return ["api_key" : "\(Constants.Keys.api_key.rawValue)",
              "language" : "en-US"]
    }
  }
  
  var authorizationType: AuthorizationType {
    switch self {
    case .getLatestMovies:
      return .apikey
    }
  }
}

