//
//  DetailsAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

final class DetailsAssembler: AssemblerProtocol {
  
  func assembly() -> DetailsController {
    return DetailsController()
  }
}
