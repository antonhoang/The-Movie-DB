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
  
  fileprivate let spacing: CGFloat = 8
  fileprivate lazy var horizontalStackViewHeight: CGFloat = 48 + spacing + spacing
  
  fileprivate let userPostImage: UIImageView = {
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())
  
  fileprivate let userAvatar: RoundImage = {
    $0.contentMode = .scaleAspectFill
    return $0
  }(RoundImage(frame: .zero))
  
  fileprivate let userName: UILabel = {
    $0.textColor = .black
    return $0
  }(UILabel())
  
  fileprivate let feedDescription: UILabel = {
    $0.numberOfLines = 3
    $0.font = .systemFont(ofSize: 14)
    return $0
  }(UILabel())
  
  fileprivate lazy var verticalStackView: UIStackView = {
    $0.backgroundColor = .black
    $0.axis = .vertical
    $0.distribution = .fillProportionally
    return $0
  }(UIStackView(arrangedSubviews: [topHorizontalStackView,
                                   userPostImage,
                                   bottomHorizontalStackView]))
  
  fileprivate lazy var topHorizontalStackView: UIStackView = {
    $0.axis = .horizontal
    $0.backgroundColor = .white
    $0.isLayoutMarginsRelativeArrangement = true
    $0.layoutMargins = UIEdgeInsets(top: spacing, left: 0, bottom: spacing, right: 0)
    return $0
  }(UIStackView(arrangedSubviews: [SpacerView(space: spacing),
                                   userAvatar,
                                   SpacerView(space: spacing),
                                   userName, UIView()]))

  fileprivate lazy var bottomHorizontalStackView: UIStackView = {
    $0.axis = .horizontal
    $0.backgroundColor = .white
    $0.distribution = .fillProportionally
    return $0
  }(UIStackView(arrangedSubviews: [SpacerView(space: spacing),
                                   feedDescription,
                                   SpacerView(space: spacing)]))
  
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
    userAvatar.image = nil
    userPostImage.image = nil
    userName.text = nil
    feedDescription.text = nil
  }
  
  //MARK: - Setup views
  fileprivate func сommonInit() {
    setupUI()
    setupVerticalStackView()

    topHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    bottomHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      topHorizontalStackView.heightAnchor.constraint(equalToConstant: horizontalStackViewHeight),
      bottomHorizontalStackView.heightAnchor.constraint(equalToConstant: horizontalStackViewHeight * 1.2)
    ])
  }
  
  fileprivate func setupVerticalStackView() {
    contentView.addSubview(verticalStackView)
    verticalStackView.fillSuperview()
  }
  
  func configureFeedPost(imageName: String, contentName: String) {
    userPostImage.image = UIImage(named: contentName)
    userAvatar.image = UIImage(named: imageName)
    userName.text = imageName
    let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    feedDescription.text = text
  }
    
  fileprivate func setupUI() {
    backgroundColor = .clear
  }
}
