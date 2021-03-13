//
//  BaseController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
  
  fileprivate let activityIndicator: UIActivityIndicatorView = {
    return $0
  }(UIActivityIndicatorView())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupMenuButton()
    setupViews()
    setupActivityIndicator()
  }
  
  fileprivate func setupActivityIndicator() {
    view.addSubview(activityIndicator)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  func showLoader() {
    activityIndicator.startAnimating()
  }
  
  func hideLoader() {
    activityIndicator.stopAnimating()
  }
  
  func setupViews() {
    let gradient = Constants.BackgroundImage.gradient4()
    gradient.contentMode = .scaleAspectFill
    view.addSubview(gradient)
    gradient.frame = view.bounds
    gradient.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
  
  func setupMenuButton() {
    let image = UIImage(named: Constants.Images.popcorn)?.withRenderingMode(.alwaysOriginal)
    let button = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(handleMenu(_:)))
    navigationItem.leftBarButtonItem = button
  }
  
  @objc fileprivate func handleMenu(_ sender: UIBarButtonItem) {
    let slider = UIWindow.key?.rootViewController as? BaseSliderController
    slider?.openMenu()
  }
  
  func setupNavigationBar(_ isTranslucent: Bool,
                          backgroundColor: UIColor,
                          barTintColor: UIColor,
                          shadowImage: UIImage?) {
    navigationController?.navigationBar.isTranslucent = isTranslucent
    navigationController?.navigationBar.backgroundColor = backgroundColor
    navigationController?.navigationBar.barTintColor = barTintColor
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.setBackgroundImage(shadowImage, for: .default)
    navigationController?.navigationBar.shadowImage = shadowImage
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
}
