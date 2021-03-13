//
//  SettingsAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 13.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

final class SettingsAssembler: AssemblerProtocol {
    
  func assembly() -> SettingsController {
    let settingsViewModel = SettingsViewModel()
    let settingsViewController = SettingsController()
    settingsViewController.viewModel = settingsViewModel
    
    return settingsViewController
  }
}
