//
//  ProfileViewType.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

enum ProfileViewType: Int {
  case head
  case list
  
  init?(indexPath: IndexPath) {
    self.init(rawValue: indexPath.section)
  }
}
