//
//  DetailsController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class DetailsController: UIViewController {
  
  var viewModel: DetailsViewModelProtocol?
  var coordinator: DetailsCoordinatorFlow?
  
  fileprivate let movieImageView: UIImageView = {
    $0.contentMode = .scaleToFill
    return $0
  }(UIImageView())
  
  fileprivate let scrollView: UIScrollView = {
    return $0
  }(UIScrollView())
  
  fileprivate let imageContainerView: UIView = {
    return $0
  }(UIView())
  
  fileprivate let contentView: UIView = {
    return $0
  }(UIView())

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  fileprivate func setupUI() {
    navigationItem.title = "Details"
    view.backgroundColor = .systemGreen
  }
  
  fileprivate func setupScrollView() { }
  fileprivate func setupImageContainerView() { }
  fileprivate func setupContentBlockView() { }
}
