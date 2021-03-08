//
//  DetailsData.swift
//  The Movie DB
//
//  Created by Anton Hoang on 07.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

struct DetailsData: Codable {
  let homepage: String
  let tagline: String
  let status: String
  let runtime: Int
  let budget: Float
  let backdrop_path: String
  let original_title: String
  let overview: String
}
