//
//  PresentIntroducingGridView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class PresentIntroducingGridView: CommonInitView {
  
  //MARK: - Setup views
  override func сommonInit() {
    setupBackground()
    setupDescription()
  }
  
  fileprivate func setupBackground() {
    backgroundColor = .clear
  }
  
  fileprivate func setupDescription() {
    let textDescription = UILabel()
    addSubview(textDescription)
    textDescription.textAlignment = .center
    textDescription.numberOfLines = 0
    textDescription.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      textDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
      textDescription.centerYAnchor.constraint(equalTo: centerYAnchor),
      textDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margin.marginForShape10Percent),
      textDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Margin.marginForShape10Percent)
    ])
    textDescription.drawShadow(offset: CGSize(width: 1, height: 1), opacity: 1, color: .black, radius: 1)
    
    let text = "Do reviews, rate, discuss with other people"
    textDescription.setupLabelWith(text: text,
                                   textColor: .white, font: .preferredFont(forTextStyle: .largeTitle))
    
  }
}
