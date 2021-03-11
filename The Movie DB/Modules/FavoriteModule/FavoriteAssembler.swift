//
//  FavoriteAssembler.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation

final class FavoriteAssembler: AssemblerProtocol {
  
  func assembly() -> FavoriteController {
    let favoriteController = FavoriteController()
    let favoriteViewModel = FavoriteViewModel()
    favoriteController.viewModel = favoriteViewModel
    return favoriteController
  }
}
