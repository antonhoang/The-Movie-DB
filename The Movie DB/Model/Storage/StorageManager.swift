//
//  StorageManager.swift
//  The Movie DB
//
//  Created by Anton Hoang on 25.02.2021.
//

import Foundation
import CoreData
 

protocol StorageManagerProtocol {
  func fetchData()
}

final class StorageManager: StorageManagerProtocol {
  func fetchData() {
    print(#function)
  }
}
