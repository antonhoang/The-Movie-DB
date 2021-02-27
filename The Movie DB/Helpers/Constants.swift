//
//  Constants.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

struct Constants {
  
  enum Keys: String {
    case api_key = "a1e6469b9c841dbf821f4ef57f4d74f0"
  }
  
  enum CellIdentifiers: String, RawRepresentable {
    case homeCellId = "homeCellId"
  }
  
  enum ScreenTitles: String, RawRepresentable {
    case home = "Home"
    case details = "Details"
    case favorite = "Favorite"
  }
  
}
