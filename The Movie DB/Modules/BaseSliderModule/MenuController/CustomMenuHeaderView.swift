//
//  CustomMenuHeaderView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class CustomMenuHeaderView: UIView {
  
  let nameLabel = UILabel()
  let usernameLabel = UILabel()
  let statsLabel = UILabel()
  let profileImageView = ProfileImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setupComponentProps()
    setupStackView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  fileprivate func setupComponentProps() {
    nameLabel.text = "Anton Hoang"
    nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
    usernameLabel.text = "@behaviourRelay"
    statsLabel.text = "777 Following 9999 Followers"
    profileImageView.image = UIImage(named: "profileImage")
    profileImageView.contentMode = .scaleAspectFill
    profileImageView.layer.cornerRadius = 48 / 2
    profileImageView.clipsToBounds = true
    profileImageView.backgroundColor = .red
    setupStatsAttributedText()
  }
  
  fileprivate func setupStatsAttributedText() {
    statsLabel.font = UIFont.systemFont(ofSize: 14)
    let attributedText = NSMutableAttributedString(string: "777 ", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .medium)])
    attributedText.append(NSAttributedString(string: "Following  ", attributes: [.foregroundColor: UIColor.black]))
    attributedText.append(NSAttributedString(string: "9999 ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .medium)]))
    attributedText.append(NSAttributedString(string: "Followers", attributes: [.foregroundColor: UIColor.black]))
    
    statsLabel.attributedText = attributedText
  }
  
  fileprivate func setupStackView() {
    let rightSpacerView = UIView()
    let arrangedSubviews = [
      UIStackView(arrangedSubviews: [profileImageView, rightSpacerView]),
      nameLabel,
      usernameLabel,
      SpacerView(space: 16),
      statsLabel
    ]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    stackView.axis = .vertical
    stackView.spacing = 4
    
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
  }
}
