//
//  Images.swift
//  The Movie DB
//
//  Created by Anton Hoang on 28.02.2021.
//

import Foundation

struct ImagesData: Codable {
  let images: Images?
}

struct Images: Codable {
  let base_url: String?
  let secure_base_url: String?
  let backdrop_sizes: [String]?
  let logo_sizes: [String]?
  let poster_sizes: [String]?
  let profile_sizes: [String]?
}
