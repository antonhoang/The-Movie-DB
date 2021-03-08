//
//  DetailsContentView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class DetailsContentView: UIView {
  
  fileprivate let titleLabel: UILabel = {
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = .boldSystemFont(ofSize: 22)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  
  fileprivate let taglineLabel: UILabel = {
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = .italicSystemFont(ofSize: 18)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  
  fileprivate let overviewLabel: UILabel = {
    $0.numberOfLines = 0
    $0.textColor = .white
    $0.font = .preferredFont(forTextStyle: .body)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UILabel())
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func setContent(title: String, tagline: String, overview: String) {
    titleLabel.text = title
    taglineLabel.text = tagline
    overviewLabel.text = overview
  }
  
  fileprivate func commonInit() {
    addSubview(titleLabel)
    addSubview(taglineLabel)
    addSubview(overviewLabel)
        
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
      
      taglineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
      taglineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      taglineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),

      overviewLabel.topAnchor.constraint(equalTo: taglineLabel.bottomAnchor, constant: 12),
      overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
      overviewLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
    ])
  }
  
}
