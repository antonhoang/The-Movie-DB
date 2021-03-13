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
  fileprivate weak var profileImage: UIImageView!
  fileprivate weak var liconsStatsStackView: UIStackView!
  fileprivate weak var patronsInfoButton: UIButton!
  fileprivate weak var subscriptionsInfoButton: UIButton!
  fileprivate weak var patronsInfo: ProfileStackView!
  fileprivate weak var subscriptionsInfo: ProfileStackView!
  
  //MARK: - Profile licoins description
  fileprivate weak var profileStackViewHeader: UIStackView!
  fileprivate weak var licoinSendButton: UIButton!
  fileprivate weak var licoinRecieveButton: UIButton!
  fileprivate weak var profileDescription: UIView!
  
  fileprivate let marginHalf = Constants.Margin.marginForShape5Percent / 2
  fileprivate let marginFull = Constants.Margin.marginForShape5Percent

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
  
  fileprivate func commonInit() {
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
  
  fileprivate func setupPatronsInfo() {
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
  
  fileprivate func setupSubscriptionsInfo() {
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
  
  fileprivate func setupProfileDescription() {
    let profileDescription = UILabel()
    liconsStatsStackView.addArrangedSubview(profileDescription)
    self.profileDescription = profileDescription
    profileDescription.text = "Description"
    profileDescription.textAlignment = .center
    profileDescription.textColor = .white
  }
  
  fileprivate func setupLicoinSendStatus() {
    let licoinSendButton = UIButton()
    liconsStatsStackView.addArrangedSubview(licoinSendButton)
    self.licoinSendButton = licoinSendButton
    licoinSendButton.setImage(Constants.TabBar.likes.image, for: .normal)
    licoinSendButton.setTitle("Sended", for: .normal)
  }
  
  fileprivate func setupLicoinRecieveStatus() {
    let licoinRecieveButton = UIButton()
    liconsStatsStackView.addArrangedSubview(licoinRecieveButton)
    self.licoinRecieveButton = licoinRecieveButton
    licoinRecieveButton.setImage(Constants.TabBar.likes.image, for: .normal)
    licoinRecieveButton.setTitle("Recieved", for: .normal)
  }
  
  fileprivate func setupLiconsStatsStackView() {
    let liconsStatsStackView = UIStackView()
    contentView.addSubview(liconsStatsStackView)
    self.liconsStatsStackView = liconsStatsStackView
    liconsStatsStackView.axis = .horizontal
    liconsStatsStackView.distribution = .fillEqually
    liconsStatsStackView.alignment = .fill
    liconsStatsStackView.spacing = marginHalf
    liconsStatsStackView.backgroundColor = .clear
    
    liconsStatsStackView.anchor(top: profileImage.bottomAnchor,
                                leading: contentView.leadingAnchor,
                                bottom: contentView.bottomAnchor,
                                trailing: contentView.trailingAnchor,
                                padding: UIEdgeInsets(top: marginHalf, left: marginHalf, bottom: marginFull, right: marginHalf))
  }
  
  fileprivate func setupProfileImage() {
    let image = UIImage(named: "profileImage")!
    let profileImage = IconImageView()
    profileImage.image = image
    profileImage.contentMode = .scaleAspectFill
    addSubview(profileImage)
    self.profileImage = profileImage
    let margin = Constants.Margin.marginForShape5Percent / 2
    profileImage.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
      profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
      profileImage.heightAnchor.constraint(equalToConstant: Constants.Shape.Square.square50x(multiply: 1.5).height),
      profileImage.widthAnchor.constraint(equalToConstant: Constants.Shape.Square.square50x(multiply: 1.5).width)
    ])
  }
  
  fileprivate func setupProfileHeader() {
    let profileStackViewHeader = UIStackView()
    addSubview(profileStackViewHeader)
    self.profileStackViewHeader = profileStackViewHeader
    profileStackViewHeader.distribution = .fillEqually
    profileStackViewHeader.axis = .horizontal
    profileStackViewHeader.alignment = .fill
    profileStackViewHeader.spacing = marginHalf
    profileStackViewHeader.backgroundColor = .clear

    profileStackViewHeader.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      profileStackViewHeader.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: marginHalf),
      profileStackViewHeader.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -marginHalf),
      profileStackViewHeader.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: marginHalf),
      profileStackViewHeader.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -marginHalf)
    ])
  }
  
  fileprivate func setupUI() { }
  
  func configureCell(imageName: String, title: String) {
    patronsInfo.titleText = title
    patronsInfo.subtitleText = "Followers"
    subscriptionsInfo.titleText = title
    subscriptionsInfo.subtitleText = "Subscriptions"
  }
}
