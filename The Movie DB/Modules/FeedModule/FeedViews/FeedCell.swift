//
//  FeedCell.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class FeedViewCell: UICollectionViewCell {
  //MARK: - Properties
  
  private weak var feedViewContainer: UIView!
  weak var userAvatar: UIImageView!
  private weak var userFeedNews: UIView!
  private weak var userFeedImageContent: UIImageView!
  private weak var feedDescription: UILabel!
  private weak var totalLikes: UILabel!
  
  
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
    DispatchQueue.main.async {
      [weak self] in
      self?.userAvatar.image = UIImage(named: imageName)
      self?.userFeedImageContent.image = UIImage(named: contentName)
    }
  }
  
  private func сommonInit() {
    setupFeedViewContainer()
    setupUserAvatar()
    setupUserFeedNews()
    setupUserFeedImageContent()
    setupTotalLikes()
    setupUI()
    setupFeedDescription()
  }
  
  private func setupUI() {
    backgroundColor = .clear
  }
  
  private func setupFeedViewContainer() {
    let feedViewContainer = UIView()
    addSubview(feedViewContainer)
    self.feedViewContainer = feedViewContainer
    feedViewContainer.backgroundColor = .clear
    feedViewContainer.fillSuperview()
//    feedViewContainer.fillEqually(to: self)
  }
  
  private func setupUserAvatar() {
    let userImage = UIImage(named: "human8")!
    let userAvatar = RoundImage(frame: .zero)
    userAvatar.setupImage(with: userImage)
    feedViewContainer.addSubview(userAvatar)
    self.userAvatar = userAvatar

//    userAvatar.heightConstant(equal: BMA.Shape.Square.square50x(multiply: 0.8).height)
//    userAvatar.widthConstant(equal: BMA.Shape.Square.square50x(multiply: 0.8).width)
//    userAvatar.topLeft(to: feedViewContainer, leftSpace: BMA.Margin.marginForShape5Percent / 2)
  }
  
  private func setupUserFeedNews() {
    let userFeedNews = UIView()
    feedViewContainer.addSubview(userFeedNews)
    self.userFeedNews = userFeedNews
    userFeedNews.backgroundColor = .black
//    userFeedNews.topOpposite(to: userAvatar, with: BMA.Margin.marginForShape5Percent / 2)
//    userFeedNews.center(to: feedViewContainer)
//    userFeedNews.horizontal(to: feedViewContainer)
  }
  
  private func setupUserFeedImageContent() {
    let userFeedImageContent = UIImageView(image: UIImage(named: "test1"))
    userFeedNews.addSubview(userFeedImageContent)
    self.userFeedImageContent = userFeedImageContent
    userFeedImageContent.contentMode = .scaleAspectFit
//    userFeedImageContent.fillEqually(to: userFeedNews)
  }
  
  private func setupFeedDescription() {
    let feedDescription = UILabel()
    userFeedNews.addSubview(feedDescription)
    feedDescription.setupLabelWith(text: "Ghost in the shell - 汚職などの犯罪を事前に察知してその被害を最小限に抑える内務省直属の攻性公安警察組織「公安9課」（通称「攻殻機動隊」）の活動を描いた物語。作中の年表は別項、攻殻機動隊シリーズの年表を参",
                                   textColor: .black,
                                   font: .preferredFont(forTextStyle: .footnote))
    self.feedDescription = feedDescription
    feedDescription.numberOfLines = 0
    feedDescription.lineBreakMode = .byWordWrapping

//    feedDescription.topOpposite(to: userFeedImageContent, with: BMA.Margin.marginForShape5Percent / 2)
//    feedDescription.left(to: feedViewContainer, with: BMA.Margin.marginForShape5Percent / 2)
//    feedDescription.right(to: feedViewContainer)
//    feedDescription.bottom(to: feedViewContainer)
  }
  
  private func setupTotalLikes() {
    let totalLikes = UILabel()
    feedViewContainer.addSubview(totalLikes)
    self.totalLikes = totalLikes
    totalLikes.setupLabelWith(text: "999 earned", textColor: .black, font: .preferredFont(forTextStyle: .body))
  }
}
