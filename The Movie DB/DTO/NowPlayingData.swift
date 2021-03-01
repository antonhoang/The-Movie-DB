//
//  NowPlayingData.swift
//  The Movie DB
//
//  Created by Anton Hoang on 01.03.2021.
//

import Foundation

struct NowPlayingDataMovie: Codable {
  var results: [NowPlayingMovie]
}

struct NowPlayingMovie: Codable {
  let id: Int
  let original_title: String
  let poster_path: String?
  let vote_average: Float?
  let vote_count: Int?
  
  
  init(from decoder: Decoder) throws {
    let value = try decoder.container(keyedBy: NowPlayingMovie.CodingKeys.self)
    id = try value.decode(Int.self, forKey: .id)
    original_title = try value.decode(String.self, forKey: .original_title)
    poster_path = try value.decodeIfPresent(String?.self, forKey: .poster_path) ?? ""
    vote_average = try value.decodeIfPresent(Float?.self, forKey: .vote_average) ?? 0
    vote_count = try value.decodeIfPresent(Int?.self, forKey: .vote_count) ?? 0
  }
}
