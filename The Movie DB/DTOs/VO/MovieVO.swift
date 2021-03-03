//
//  MovieVO.swift
//  The Movie DB
//
//  Created by Anton Hoang on 03.03.2021.
//

import Foundation

struct MovieVO {
  let id: Int
  let original_title: String
  let overview: String
  let vote_average: Float?
  let vote_count: Int?
  let imageUrlPath: String?
  
  init(movie: Movie, imageUrlPath: String?) {
    self.id = movie.id
    self.original_title = movie.original_title
    self.overview = movie.overview
    self.vote_average = movie.vote_average
    self.vote_count = movie.vote_count
    self.imageUrlPath = imageUrlPath
  }
}
