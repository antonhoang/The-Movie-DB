//
//  ProfileAssembler.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class ProfileAssembler: AssemblerProtocol {
  
  func assembly() -> ProfileController {
    let profileViewController = ProfileController()
    let profileViewModel = ProfileViewModel()
    profileViewController.viewModel = profileViewModel
    return profileViewController
  }
}
