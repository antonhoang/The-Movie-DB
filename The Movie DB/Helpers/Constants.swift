//
//  Constants.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

struct Constants {
  
  enum CellIdentifiers: String, RawRepresentable {
    case homeCellId = "homeCellId"
  }
  
  enum ScreenTitles: String, RawRepresentable {
    case home = "Home"
    case details = "Details"
    case favorite = "Favorite"
  }
  
}