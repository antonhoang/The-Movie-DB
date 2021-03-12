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
  
  fileprivate weak var userAvatar: UIImageView!
  fileprivate weak var userFeedNews: UIView!
  fileprivate weak var feedDescription: UILabel!
  
  fileprivate let verticalStackView: UIStackView = {
    $0.axis = .vertical
    $0.distribution = .fill
    return $0
  }(UIStackView())
  
  func setupVerticalStackView() {
    contentView.addSubview(verticalStackView)
  }
  
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
  
  func configureUser(imageName: String, contentName: String) {
  }
  
  fileprivate func сommonInit() {
    setupUI()
  }
  
  fileprivate func setupUI() {
    backgroundColor = .clear
  }
}
