//
//  RequestItem.swift
//  The Movie DB
//
//  Created by Anton Hoang on 22.02.2021.
//

import Foundation

enum RequestItem {
  //MARK: - Movies
  case getLatestMovies
  case getNowPlayingMovies
  case getPopularMovies
  case getTopRatedMovies
  case getUpcomingMovies
}

extension RequestItem: EndPointType {
  
  var scheme: String {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies:
      return "https"
    }
  }
  
  var host: String {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies:
      return "api.themoviedb.org"
    }
  }
  
  var path: String {
    switch self {
    case .getLatestMovies:
      return "/3/movie/latest"
    case .getNowPlayingMovies:
      return "/3/movie/now_playing"
    case .getPopularMovies:
      return "/3/movie/popular"
    case .getTopRatedMovies:
      return "/3/movie/top_rated"
    case .getUpcomingMovies:
      return "/3/movie/upcoming"
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies:
      return .get
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies:
      return ["Authorization" : "Bearer \(Constants.APICreditials.bearer.rawValue)"]
    }
  }
  
  var queryParameters: [String : String]? {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies:
      return ["api_key" : "\(Constants.APICreditials.api_key.rawValue)",
              "language" : "en-US"]
    }
  }
}

