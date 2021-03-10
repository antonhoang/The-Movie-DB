//
//  File.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit
import Combine

final class AuthController: UIViewController {
  
  //MARK: - Properties
  weak var viewModel: AuthViewModelProtocol?
  var coordinator: AuthFlow?
  fileprivate weak var scrollView: UIScrollView!
  fileprivate weak var stackView: UIStackView!
  fileprivate weak var pageControl: UIPageControl!
  fileprivate weak var hand_0: UIImageView!
  
  fileprivate var views = [UIView]()
  
  //MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupScrollView()
    setupStackView()
    setupViewsForStackView()
    setupPagingControl()
    
    setupScrollableImage()
  }
  
  //MARK: - Setup views
  fileprivate func setupScrollableImage() {
    let imageV = UIImageView(image: UIImage(named: "11"))
    scrollView.addSubview(imageV)
    imageV.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageV.topAnchor.constraint(equalTo: scrollView.topAnchor),
      imageV.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      imageV.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      imageV.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
    ])
    scrollView.sendSubviewToBack(imageV)
  }
  
  fileprivate func setupUI() {
    view.backgroundColor = .systemGreen
  }
  
  fileprivate func setupScrollView() {
    let scrollView = UIScrollView()
    view.addSubview(scrollView)
    self.scrollView = scrollView
    scrollView.delegate = self
    scrollView.makeHorizontalPagingWithinIndicatorsAndBounce()
    scrollView.fillSuperview()
//    scrollView.fill(to: view, left: 0, right: 0)
  }
  
  fileprivate func setupStackView() {
    let stackView = UIStackView()
    scrollView.addSubview(stackView)
    self.stackView = stackView
    stackView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
//    stackView.fill(to: scrollView, left: 0, right: 0)
  }
  
  fileprivate func setupViewsForStackView() {
    let presentView = PresentStartGridView()
    let secondView = PresentIntroducingGridView()
    let thirdView = PresentFinishGridView()
    thirdView.finishButton.touchUpInside = {
      [weak self] item in
      self?.coordinator?.coordinateToBaseSlider()
      self?.coordinator = nil
    }
    [presentView, secondView, thirdView].forEach {
      stackView.addArrangedSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
      $0.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
      views.append($0)
    }
  }
  
  fileprivate func setupPagingControl() {
    let pageControl = UIPageControl()
    view.addSubview(pageControl)
    self.pageControl = pageControl
    pageControl.numberOfPages = views.count
    pageControl.addTarget(self, action: #selector(pageTapped), for: .valueChanged)
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
    ])
  }
  
  //MARK: - Actions
  
  @objc fileprivate func pageTapped(sender: UIPageControl) {
    let pageWidth = scrollView.bounds.width
    let offset = sender.currentPage * Int(pageWidth)

    UIView.animate(withDuration: 0.33) {
      [weak self] in
      self?.scrollView.contentOffset.x = CGFloat(offset)
    }
  }
}

extension AuthController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageWidth = scrollView.bounds.width
    let contentOffsetX = scrollView.contentOffset.x
    let pageFraction = scrollView.contentOffset.x / pageWidth
    
    pageControl.currentPage = Int(round(pageFraction))
    
    let percent = contentOffsetX * 0.0012
    view.backgroundColor = scrollColor(percent: Double(percent))
  }
}
