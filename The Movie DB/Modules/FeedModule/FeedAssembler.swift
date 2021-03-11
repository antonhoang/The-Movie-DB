//
//  FeedAssembler.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class FeedAssembler: AssemblerProtocol {
  func assembly() -> FeedController {
    let networkManager = NetworkManager()
    let storageManager = StorageManager()
    let imageManager = ImageManager(network: networkManager)
    let homeRepository = HomeRepository(network: networkManager, storage: storageManager, imageManager: imageManager)
    let feedViewModel = FeedViewModel(homeRepository: homeRepository)
    let feedViewController = FeedController()
    feedViewController.viewModel = feedViewModel
    
    return feedViewController
  }
}
