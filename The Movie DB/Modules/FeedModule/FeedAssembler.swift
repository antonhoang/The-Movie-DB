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
    let feedViewModel = FeedViewModel()
    let feedViewController = FeedController()
    feedViewController.viewModel = feedViewModel
    
    return feedViewController
  }
}
