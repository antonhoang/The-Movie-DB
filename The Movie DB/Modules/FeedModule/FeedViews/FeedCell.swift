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
  
  fileprivate weak var userFeedNews: UIView!
  fileprivate weak var feedDescription: UILabel!
  fileprivate let spacing: CGFloat = 8
  fileprivate lazy var horizontalStackViewHeight: CGFloat = 48 + spacing
  
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
  
  fileprivate lazy var verticalStackView: UIStackView = {
    $0.backgroundColor = .white
    $0.axis = .vertical
    $0.distribution = .fillProportionally
    $0.spacing = spacing
    return $0
  }(UIStackView(arrangedSubviews: [horizontalStackView, userPostImage]))
  
  fileprivate lazy var horizontalStackView: UIStackView = {
    $0.axis = .horizontal
    $0.backgroundColor = .white
    $0.isLayoutMarginsRelativeArrangement = true
    $0.layoutMargins = UIEdgeInsets(top: spacing, left: 0, bottom: 0, right: 0)
    return $0
  }(UIStackView(arrangedSubviews: [SpacerView(space: 16),
                                   userAvatar,
                                   SpacerView(space: 16),
                                   userName, UIView()]))

  
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

    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      horizontalStackView.heightAnchor.constraint(equalToConstant: horizontalStackViewHeight)
    ])
  }
  
  fileprivate func setupVerticalStackView() {
    contentView.addSubview(verticalStackView)
    verticalStackView.fillSuperview()
  }
  
  func configureFeedPost(imageName: String, contentName: String) {
    userPostImage.image = UIImage(named: imageName)
    userAvatar.image = UIImage(named: imageName)
    userName.text = "contentName"
  }
    
  fileprivate func setupUI() {
    backgroundColor = .clear
  }
}
