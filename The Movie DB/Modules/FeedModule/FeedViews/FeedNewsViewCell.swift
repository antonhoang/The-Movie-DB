//
//  FeedNewsViewCell.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class FeedNewsViewCell: UICollectionViewCell {
  //MARK: - Properties

  weak var feedStoryImageView: UIImageView!
  
  //MARK: - Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    feedStoryImageView.image = nil
  }
  
  fileprivate func setupFeedStoryImageView() {
    let feedStoryImageView = UIImageView(image: UIImage(named: "human6"))
    addSubview(feedStoryImageView)
    self.feedStoryImageView = feedStoryImageView
    feedStoryImageView.contentMode = .scaleAspectFill
//    feedStoryImageView.layer.cornerRadius = CGFloat(BMA.CornerRadius.icon72px)
    feedStoryImageView.clipsToBounds = true
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    feedStoryImageView.frame = self.bounds
  }
  
  //MARK: - Setup views

  fileprivate func commonInit() {
    setupUI()
    setupFeedStoryImageView()
  }
  
  fileprivate func setupUI() {
    backgroundColor = .clear
  }
  
  func configureCell(imageName: String) {
    UIView.transition(with: self.feedStoryImageView,
                      duration: 0.3,
                      options: [.curveEaseOut, .transitionCrossDissolve]) {
      self.feedStoryImageView.image = UIImage(named: imageName)
    }
  }
}
