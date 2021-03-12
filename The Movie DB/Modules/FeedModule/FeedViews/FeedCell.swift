//
//  FeedCell.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class FeedCell: UICollectionViewCell {
  //MARK: - Properties
  
  fileprivate weak var userPostImage: UIImageView!
  fileprivate weak var userFeedNews: UIView!
  fileprivate weak var feedDescription: UILabel!
  
  fileprivate let verticalStackView: UIStackView = {
    $0.backgroundColor = .black
    $0.axis = .vertical
    $0.distribution = .fill
    return $0
  }(UIStackView())

  
  //MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    сommonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    сommonInit()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
  }
  
  //MARK: - Setup views
  fileprivate func сommonInit() {
    setupUI()
    setupVerticalStackView()
    setupUserPostImage()
  }
  
  fileprivate func setupVerticalStackView() {
    contentView.addSubview(verticalStackView)
    verticalStackView.fillSuperview()
  }
  
  fileprivate func setupUserPostImage() {
    let userPostImage = UIImageView()
    userPostImage.contentMode = .scaleAspectFit
    verticalStackView.addArrangedSubview(userPostImage)
    self.userPostImage = userPostImage
    userPostImage.fillSuperview()
  }
  
  
  func configureFeedPost(imageName: String, contentName: String) {
    userPostImage.image = UIImage(named: imageName)
  }
    
  fileprivate func setupUI() {
    backgroundColor = .clear
  }
}
