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
  
  fileprivate let imageView: UIImageView = {
    $0.image = UIImage(named: Constants.Images.pic10)
    $0.backgroundColor = .systemGreen
    $0.contentMode = .scaleAspectFill
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIImageView())
  
  fileprivate let scrollView: UIScrollView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentInsetAdjustmentBehavior = .never
    $0.backgroundColor = .systemTeal
    $0.showsVerticalScrollIndicator = false
    return $0
  }(UIScrollView())
  
  
  fileprivate let info: UILabel = {
    $0.numberOfLines = 0
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .systemYellow
    return $0
  }(UILabel())
  
  fileprivate let imageContainer: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .systemBlue
    return $0
  }(UIView())
  
  fileprivate let contentView: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .systemOrange
    return $0
  }(UIView())

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      
      scrollView.scrollIndicatorInsets = view.safeAreaInsets
      scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
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
    
    scrollView.addSubview(imageContainer)
    scrollView.addSubview(contentView)
    scrollView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  fileprivate func setupImageContainerView() {
    NSLayoutConstraint.activate([
      imageContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
      imageContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageContainer.heightAnchor.constraint(equalTo: imageContainer.widthAnchor, multiplier: 0.7),
    ])
    
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor)
    ])
    
    let topImageConstraint = imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    topImageConstraint.isActive = true
    topImageConstraint.priority = .defaultHigh

    let heightImageConstraint = imageView.heightAnchor.constraint(greaterThanOrEqualTo: imageContainer.heightAnchor)
    heightImageConstraint.isActive = true
    heightImageConstraint.priority = .required

    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 0),
      contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
    
    let text =  """
                Lorem ipsum dolor sit amet, in alia adhuc aperiri nam. Movet scripta tractatos cu eum, sale commodo meliore ea eam, per commodo atomorum ea. Unum graeci iriure nec an, ea sit habeo movet electram. Id eius assum persius pro, id cum falli accusam. Has eu fierent partiendo, doming expetenda interesset cu mel, tempor possit vocent in nam. Iusto tollit ad duo, est at vidit vivendo liberavisse, vide munere nonumy sed ex.
                        
                Quod possit expetendis id qui, consequat vituperata ad eam. Per cu elit latine vivendum. Ei sit nullam aliquam, an ferri epicuri quo. Ex vim tibique accumsan erroribus. In per libris verear adipiscing. Purto aliquid lobortis ea quo, ea utinam oportere qui.
                """
    
    
    info.text = text + text + text
    contentView.addSubview(info)
    info.fillSuperview(padding: UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14))
  }
  
  fileprivate func setupContentBlockView() { }
}
