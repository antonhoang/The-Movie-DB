//
//  PresentStartGridView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit
 
final class PresentStartGridView: CommonInitView {
  
  //MARK: - Properties
  
  //MARK: - Setup views
  override func сommonInit() {
    super.сommonInit()
    setupBackground()
    setupDescription()
  }
  
  fileprivate func setupBackground() {
    backgroundColor = .clear
    let titleLabel = UILabel()
    addSubview(titleLabel)
    titleLabel.setupLabelWith(text: "Buy my attention", textColor: .white, font: .boldSystemFont(ofSize: 35))
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
//    titleLabel.topLeft(to: self,
//                       topSpace: BMA.Margin.marginForShape20Percent,
//                       leftSpace: BMA.Margin.marginForShape5Percent)
//    titleLabel.drawShadow(offset: CGSize(width: 1, height: 1), opacity: 1, color: .black, radius: 1)
  }
  
  fileprivate func setupDescription() {
    let textDescription = UILabel()
    addSubview(textDescription)
    textDescription.textAlignment = .center
    textDescription.numberOfLines = 0
//    textDescription.center(to: self)
//    textDescription.horizontal(to: self,
//                               leftSpace: BMA.Margin.marginForShape10Percent,
//                               rightSpace: -BMA.Margin.marginForShape10Percent)
    
    let text = "New form of communication.\nYour attention deserve more than an ordinary thumb up"
    textDescription.setupLabelWith(text: text,
                                   textColor: .white, font: .preferredFont(forTextStyle: .largeTitle))
    
  }
}

