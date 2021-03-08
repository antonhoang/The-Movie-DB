//
//  DetailsController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class DetailsController: BaseController {
  
  var viewModel: DetailsViewModelProtocol?
  var coordinator: DetailsCoordinatorFlow?
  
  fileprivate let scrollView: UIScrollView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentInsetAdjustmentBehavior = .never
    $0.showsVerticalScrollIndicator = false
    $0.backgroundColor = .black
    return $0
  }(UIScrollView())
  
  fileprivate let imageContainer: UIView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIView())
  
  fileprivate let detailsContentView: DetailsContentView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(DetailsContentView())
  
  fileprivate let backButton: UIButton = {
    let image = UIImage(named: Constants.Images.leftArrow2)?.withRenderingMode(.alwaysTemplate)
    $0.setImage(image, for: .normal)
    $0.tintColor = .systemYellow
    $0.contentMode = .scaleAspectFit
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    return $0
  }(UIButton())
  
  @objc fileprivate func handleBackButton() {
    navigationController?.popViewController(animated: true)
  }
  
  fileprivate lazy var imageView: UIImageView = {
    $0.contentMode = .scaleAspectFill
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIImageView())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    dataBindings()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    scrollView.scrollIndicatorInsets = view.safeAreaInsets
    scrollView.contentInset = UIEdgeInsets(top: 0,
                                           left: 0,
                                           bottom: view.safeAreaInsets.bottom,
                                           right: 0)
  }
  
  fileprivate func dataBindings() {
    viewModel?.detailsVO.bind(observer: {
      [weak self] (detailsVO) in
      self?.imageView.loadImage(imagePath: detailsVO.imageUrlPath)
      DispatchQueue.main.async { [weak self] in
        self?.detailsContentView.setContent(title: detailsVO.original_title,
                                            tagline: detailsVO.tagline,
                                            overview: detailsVO.overview)
      }
    })
  }
  
  fileprivate func setupUI() {
    setupNavigationBar()
    setupScrollView()
    setupImageContainerView()
    setupDetailsContentView()
    setupBackButton()
  }
  
  fileprivate func setupNavigationBar() {
    navigationController?.navigationBar.isHidden = true
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  fileprivate func setupBackButton() {
    view.addSubview(backButton)
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 25),
      backButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 12),
      backButton.heightAnchor.constraint(equalToConstant: 22),
      backButton.widthAnchor.constraint(equalToConstant: 22)
    ])
  }
  
  fileprivate func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.addSubview(imageContainer)
    scrollView.addSubview(detailsContentView)
    scrollView.addSubview(imageView)
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  fileprivate func setupDetailsContentView() {
    NSLayoutConstraint.activate([
      detailsContentView.topAnchor.constraint(equalTo: imageContainer.bottomAnchor),
      detailsContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      detailsContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      detailsContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
  }
  
  fileprivate func setupImageContainerView() {
    let gradientView = GradientView(frame: imageView.frame)
    imageView.insertSubview(gradientView, at: 0)
    
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
    
    let topImageConstraint = imageView.topAnchor.constraint(equalTo: view.topAnchor)
    topImageConstraint.isActive = true
    topImageConstraint.priority = .defaultHigh
    
    let heightImageConstraint = imageView.heightAnchor.constraint(greaterThanOrEqualTo: imageContainer.heightAnchor)
    heightImageConstraint.isActive = true
    heightImageConstraint.priority = .required
  }
}
