//
//  AuthAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class AuthAssembler: AssemblerProtocol {
  
  func assembly() -> AuthController {
    let authViewModel = AuthViewModel()
    let authViewController = AuthController()
    authViewController.viewModel = authViewModel
    
    return authViewController
  }
}
