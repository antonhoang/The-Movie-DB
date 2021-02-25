//
//  Coordinator.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation

protocol CoordinatorProtocol {
  func start()
}

extension CoordinatorProtocol {
  func coordinate(to: CoordinatorProtocol) {
    start()
  }
}
