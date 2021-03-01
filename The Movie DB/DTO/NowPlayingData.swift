//
//  NowPlayingData.swift
//  The Movie DB
//
//  Created by Anton Hoang on 01.03.2021.
//

import Foundation

struct NowPlayingDataMovie: Codable {
  var results: [NowPlayingMovie]?
}

struct NowPlayingMovie: Codable {
  let id: Int?
  let original_title: String?
  let poster_path: String?
  let vote_average: Float?
  let vote_count: Int? 
}
