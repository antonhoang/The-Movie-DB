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
  
  private func setupBackground() {
    backgroundColor = .clear
    let titleLabel = UILabel()
    addSubview(titleLabel)
    titleLabel.setupLabelWith(text: "Buy my attention", textColor: .white, font: .boldSystemFont(ofSize: 35))
//    titleLabel.topLeft(to: self, topSpace: BMA.Margin.marginForShape20Percent, leftSpace: BMA.Margin.marginForShape5Percent)
    titleLabel.drawShadow(offset: CGSize(width: 1, height: 1), opacity: 1, color: .black, radius: 1)
  }
  
  private func setupDescription() {
    let textDescription = UILabel()
    addSubview(textDescription)
    textDescription.textAlignment = .center
    textDescription.numberOfLines = 0
//    textDescription.center(to: self)
//    textDescription.horizontal(to: self,
//                               leftSpace: BMA.Margin.marginForShape10Percent,
//                               rightSpace: -BMA.Margin.marginForShape10Percent)
    
    let text = "Share likes among yourself. Receive cash rewards back to your pocket"
    textDescription.setupLabelWith(text: text,
                                   textColor: .white, font: .preferredFont(forTextStyle: .largeTitle))
    
  }
}
