//
//  RequestItem.swift
//  The Movie DB
//
//  Created by Anton Hoang on 22.02.2021.
//

import Foundation

enum RequestItem {
  //MARK: - Images
  case getImageConfiguration
  
  //MARK: - Movies
  case getLatestMovies
  case getNowPlayingMovies
  case getPopularMovies
  case getTopRatedMovies
  case getUpcomingMovies
  case getDetailsMovie(movie_id: Int)
  
  
  //MARK: - Auth
  case createAccessToken
  case deleteAccessToken
  
}

extension RequestItem: EndPointType {
  
  var scheme: String {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies,
         .getUpcomingMovies, .getDetailsMovie, .getImageConfiguration, .createAccessToken, .deleteAccessToken:
      return "https"
    }
  }
  
  var host: String {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies,
         .getUpcomingMovies, .getDetailsMovie, .getImageConfiguration, .createAccessToken, .deleteAccessToken:
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
    case .getDetailsMovie(let movie_id):
      return "/3/movie/\(movie_id)"
      
    case .getImageConfiguration:
      return "/3/configuration"
      
    case .createAccessToken:
      return "/4/auth/access_token"
    case .deleteAccessToken:
      return "/4/auth/request_token"
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies,
         .getDetailsMovie, .getImageConfiguration:
      return .get
    case .createAccessToken:
      return .post
    case .deleteAccessToken:
      return .delete
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies,
         .getDetailsMovie, .getImageConfiguration, .createAccessToken, .deleteAccessToken:
      return ["Authorization" : "Bearer \(Constants.APICreditials.bearer.rawValue)"]
    }
  }
  
  var queryParameters: [String : String]? {
    switch self {
    case .getLatestMovies, .getNowPlayingMovies, .getPopularMovies, .getTopRatedMovies, .getUpcomingMovies,
         .getDetailsMovie, .getImageConfiguration, .createAccessToken, .deleteAccessToken:
      return ["api_key" : "\(Constants.APICreditials.api_key.rawValue)",
              "language" : "en-US"]
    }
  }
}

