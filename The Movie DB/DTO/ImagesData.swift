//
//  Images.swift
//  The Movie DB
//
//  Created by Anton Hoang on 28.02.2021.
//

import Foundation

struct ImagesData: Codable {
  var images: Images?
}

struct Images: Codable {
  var base_url: String?
  var secure_base_url: String?
  var backdrop_sizes: [String]?
  var logo_sizes: [String]?
  var poster_sizes: [String]?
  var profile_sizes: [String]?
  
  var w154: String?
  
  enum LogoSizes: String {
    case w154
    case w300
    case original
  }
  
  init(from decoder: Decoder) throws {
    let value = try decoder.container(keyedBy: Images.CodingKeys.self)
    let logoSizes = try value.decode([String].self, forKey: .logo_sizes)
    base_url = try value.decode(String?.self, forKey: .base_url)
    secure_base_url = try value.decode(String?.self, forKey: .secure_base_url)

    let ls = logoSizes.map { (size) -> LogoSizesImages in
      let l: LogoSizesImages = LogoSizesImages(size: size)
      return l
    }
        
    let dict = ls.reduce([String : LogoSizesImages]()) {
      (result, logoSize) -> [String : LogoSizesImages] in

      var result = result
      result[logoSize.size] = logoSize
      return result
    }
    w154 = dict[LogoSizes.w154.rawValue]?.size
  }
}

struct LogoSizesImages: Codable {
  var size: String
}

