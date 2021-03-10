//
//  ProfileHeadViewCell.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit
import Combine

extension ProfileHeadViewCell {
  enum Action {
    case patrons
    case subscriptions
  }
}

final class ProfileHeadViewCell: UICollectionViewCell {
  
  //MARK: - PassthroughSubject
  let actionPublisher = PassthroughSubject<Action, Never>()
  
  //MARK: - Profile statistic header
  private weak var profileImage: UIImageView!
  private weak var liconsStatsStackView: UIStackView!
  private weak var patronsInfoButton: UIButton!
  private weak var subscriptionsInfoButton: UIButton!
  private weak var patronsInfo: ProfileStackView!
  private weak var subscriptionsInfo: ProfileStackView!
  
  //MARK: - Profile licoins description
  private weak var profileStackViewHeader: UIStackView!
  private weak var licoinSendButton: UIButton!
  private weak var licoinRecieveButton: UIButton!
  private weak var profileDescription: UIView!
  
  private let marginHalf = Constants.Margin.marginForShape5Percent / 2
  private let marginFull = Constants.Margin.marginForShape5Percent

  //MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  //MARK: - Setup views
  
  private func commonInit() {
    setupUI()
    setupProfileImage()
    setupProfileHeader()
    setupLiconsStatsStackView()
    setupProfileDescription()
    setupLicoinSendStatus()
    setupLicoinRecieveStatus()
    setupPatronsInfo()
    setupSubscriptionsInfo()
  }

  @objc func tapOnPatronsInfo() {
    actionPublisher.send(.patrons)
  }
  
  @objc func tapOnSubcriptionsInfo() {
    actionPublisher.send(.subscriptions)
  }
  
  private func setupPatronsInfo() {
    let patronsInfoButton = UIButton()
    profileStackViewHeader.addArrangedSubview(patronsInfoButton)
    self.patronsInfoButton = patronsInfoButton
    patronsInfoButton.addTarget(self, action: #selector(tapOnPatronsInfo), for: .touchUpInside)

    let patronsInfo = ProfileStackView()
    patronsInfoButton.addSubview(patronsInfo)
    patronsInfo.title.textColor = .white
    patronsInfo.subtitle.textColor = .white
    patronsInfo.frame = patronsInfoButton.bounds
    patronsInfo.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    patronsInfo.isUserInteractionEnabled = false
    self.patronsInfo = patronsInfo
    patronsInfo.backgroundColor = .clear
  }
  
  private func setupSubscriptionsInfo() {
    let subscriptionsInfoButton = UIButton()
    profileStackViewHeader.addArrangedSubview(subscriptionsInfoButton)
    self.subscriptionsInfoButton = subscriptionsInfoButton
    subscriptionsInfoButton.addTarget(self, action: #selector(tapOnSubcriptionsInfo), for: .touchUpInside)

    let subscriptionsInfo = ProfileStackView()
    subscriptionsInfoButton.addSubview(subscriptionsInfo)
    subscriptionsInfo.title.textColor = .white
    subscriptionsInfo.subtitle.textColor = .white
    subscriptionsInfo.frame = subscriptionsInfoButton.bounds
    subscriptionsInfo.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    subscriptionsInfo.isUserInteractionEnabled = false
    self.subscriptionsInfo = subscriptionsInfo
    subscriptionsInfo.backgroundColor = .clear
  }
  
  private func setupProfileDescription() {
    let profileDescription = UILabel()
    liconsStatsStackView.addArrangedSubview(profileDescription)
    self.profileDescription = profileDescription
    profileDescription.text = "test test"
    profileDescription.textAlignment = .center
    profileDescription.textColor = .white
  }
  
  private func setupLicoinSendStatus() {
    let licoinSendButton = UIButton()
    liconsStatsStackView.addArrangedSubview(licoinSendButton)
    self.licoinSendButton = licoinSendButton
    licoinSendButton.setImage(Constants.TabBar.likes.image, for: .normal)
    licoinSendButton.setTitle("Sended", for: .normal)
  }
  
  private func setupLicoinRecieveStatus() {
    let licoinRecieveButton = UIButton()
    liconsStatsStackView.addArrangedSubview(licoinRecieveButton)
    self.licoinRecieveButton = licoinRecieveButton
    licoinRecieveButton.setImage(Constants.TabBar.likes.image, for: .normal)
    licoinRecieveButton.setTitle("Recieved", for: .normal)
  }
  
  private func setupLiconsStatsStackView() {
    let liconsStatsStackView = UIStackView()
    contentView.addSubview(liconsStatsStackView)
    self.liconsStatsStackView = liconsStatsStackView
    liconsStatsStackView.axis = .horizontal
    liconsStatsStackView.distribution = .fillEqually
    liconsStatsStackView.alignment = .fill
    liconsStatsStackView.spacing = marginHalf
    liconsStatsStackView.backgroundColor = .clear
//    liconsStatsStackView.topOpposite(to: profileImage, with: marginHalf)
//    liconsStatsStackView.horizontal(to: contentView, leftSpace: marginHalf, rightSpace: -marginHalf)
//    liconsStatsStackView.bottom(to: contentView, with: marginFull)
  }
  
  private func setupProfileImage() {
    let image = UIImage(named: "human5")!
    let profileImage = RoundImage(frame: .zero)
    profileImage.setupImage(with: image)
    profileImage.contentMode = .scaleToFill
    addSubview(profileImage)
    self.profileImage = profileImage
    let margin = Constants.Margin.marginForShape5Percent / 2
//    profileImage.topToSafeArea(to: contentView, with: margin)
//    profileImage.left(to: contentView, with: margin)
//    profileImage.heightConstant(equal: Constants.Shape.Square.square50x(multiply: 1.5).height)
//    profileImage.widthConstant(equal: Constants.Shape.Square.square50x(multiply: 1.5).width)
  }
  
  private func setupProfileHeader() {
    let profileStackViewHeader = UIStackView()
    addSubview(profileStackViewHeader)
    self.profileStackViewHeader = profileStackViewHeader
    profileStackViewHeader.distribution = .fillEqually
    profileStackViewHeader.axis = .horizontal
    profileStackViewHeader.alignment = .fill
    profileStackViewHeader.spacing = marginHalf
    profileStackViewHeader.backgroundColor = .clear
//    profileStackViewHeader.leftOpposite(to: profileImage, with: marginHalf)
//    profileStackViewHeader.right(to: contentView, with: -marginHalf)
//    profileStackViewHeader.vertical(to: profileImage, topSpace: marginHalf, bottomSpace: marginHalf)
  }
  
  private func setupUI() { }
  
  func configureCell(imageName: String, title: String) {
    patronsInfo.titleText = title
    patronsInfo.subtitleText = "Patrons"
    subscriptionsInfo.titleText = title
    subscriptionsInfo.subtitleText = "Subscriptions"
  }
}
