//
//  BaseSliderAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation

final class BaseSliderAssembler: AssemblerProtocol {
  
  func assembly() -> BaseSliderController {
    let baseSliderController = BaseSliderController()
    let baseSliderViewModel = BaseSliderViewModel()
    baseSliderController.viewModel = baseSliderViewModel
    return baseSliderController
  }
}
