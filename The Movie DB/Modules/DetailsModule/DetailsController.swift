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
    $0.backgroundColor = .systemGreen
    $0.contentMode = .scaleToFill
    return $0
  }(UIImageView())
  
  fileprivate let scrollView: UIScrollView = {
    $0.backgroundColor = .systemTeal
    return $0
  }(UIScrollView())
  
  fileprivate let imageContainerView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .systemBlue
    return $0
  }(UIView())
  
  fileprivate let contentView: UIView = {
    $0.backgroundColor = .systemOrange
    return $0
  }(UIView())

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  fileprivate func setupUI() {
    navigationItem.title = "Details"
    view.backgroundColor = .systemGreen
    setupScrollView()
    setupImageContainerView()
    setupContentBlockView()
  }
  
  fileprivate func setupScrollView() {
    view.addSubview(scrollView)
    
    scrollView.addSubview(imageContainerView)
    scrollView.addSubview(contentView)
    scrollView.addSubview(movieImageView)
    
    scrollView.fillSuperview()
    
  }
  
  fileprivate func setupImageContainerView() {
    NSLayoutConstraint.activate([
      imageContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      imageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageContainerView.heightAnchor.constraint(equalTo: imageContainerView.widthAnchor, multiplier: 0.7)
    ])
  }
  
  fileprivate func setupContentBlockView() { }
}
