//
//  Constants.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation
import UIKit

struct Constants {
  
  enum APICreditials: String {
    case api_key = "a1e6469b9c841dbf821f4ef57f4d74f0"
    case bearer = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMWU2NDY5YjljODQxZGJmODIxZjRlZjU3ZjRkNzRmMCIsInN1YiI6IjYwMzM1OGY5OWFmMTcxMDAzZjQ1YjNiNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.H-f-0iZNchiOoPmJc42k5p7vszMqsvOqd9K-6p1JiL0"
  }
  
  enum CellIdentifiers: String, RawRepresentable {
    case homeCellId = "homeCellId"
  }
  
  enum ScreenTitles: String, RawRepresentable {
    case home = "Home"
    case details = "Details"
    case favorite = "Favorite"
  }
  
  enum Images {
    static let popcorn = "popcorn"
    static let leftArrow = "left-arrow"
    static let leftArrow2 = "left-arrow2"
  }
  
  enum Colors {
    static let dark = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
  }
  
}
