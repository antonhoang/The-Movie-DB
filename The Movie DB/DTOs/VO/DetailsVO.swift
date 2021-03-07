//
//  DetailsVO.swift
//  The Movie DB
//
//  Created by Anton Hoang on 07.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

struct DetailsVO {
  var homepage: String?
  var tagline: String?
  var status: String?
  var runtime: Int?
  var budget: Float?
  var imageUrlPath: String?
  
  init() { }
  
  init(details: DetailsData, imageUrlPath: String) {
    self.homepage = details.homepage
    self.tagline = details.tagline
    self.status = details.status
    self.runtime = details.runtime
    self.budget = details.budget
    self.imageUrlPath = imageUrlPath
  }
}
