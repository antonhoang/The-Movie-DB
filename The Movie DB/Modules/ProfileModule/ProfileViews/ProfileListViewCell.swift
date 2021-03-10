//
//  ProfileListViewCell.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class ProfileListViewCell: UICollectionViewCell {
  //MARK: - Properties
  
  private weak var feedStoryImageView: UIImageView!
  
  //MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func setupFeedStoryImageView() {
    let feedStoryImageView = UIImageView(image: UIImage(named: "human6"))
    addSubview(feedStoryImageView)
    self.feedStoryImageView = feedStoryImageView
    feedStoryImageView.contentMode = .scaleAspectFit
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    feedStoryImageView.frame = bounds
  }
  
  //MARK: - Setup views
  
  private func commonInit() {
    setupUI()
    setupFeedStoryImageView()
  }
  
  private func setupUI() {
    backgroundColor = .black
  }
  
  func configureCell(imageName: String) {
    feedStoryImageView.image = UIImage(named: imageName)
  }
}
