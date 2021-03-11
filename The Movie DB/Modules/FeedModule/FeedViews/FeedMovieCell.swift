//
//  FeedNewsViewCell.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class FeedMovieCell: UICollectionViewCell {
  //MARK: - Properties

  fileprivate weak var feedMovieImageView: UIImageView!
  
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
    feedMovieImageView.image = nil
  }
  
  fileprivate func setupFeedMovieImageView() {
    let feedMovieImageView = UIImageView()
    addSubview(feedMovieImageView)
    self.feedMovieImageView = feedMovieImageView
    feedMovieImageView.contentMode = .scaleAspectFill
    feedMovieImageView.clipsToBounds = true
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    feedMovieImageView.frame = self.bounds
  }
  
  //MARK: - Setup views

  fileprivate func commonInit() {
    setupUI()
    setupFeedMovieImageView()
  }
  
  fileprivate func setupUI() {
    backgroundColor = .clear
  }
  
  func configureCell(movieVO: MovieVO) {
    if let imagePath = movieVO.imageUrlPath {
      feedMovieImageView.loadImage(imagePath: imagePath)
    }
  }
}
