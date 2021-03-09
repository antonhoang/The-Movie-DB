//
//  UIScrollView+DefaultSettings.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
  enum ScrollViewDirectionType {
    case vertical
    case horizontal
  }
  
  fileprivate func setScrollView(with type: ScrollViewDirectionType) {
    switch type {
    case .vertical:
      setState(indicator: false, bounce: false)
    case .horizontal:
      setState(indicator: false, bounce: false)
    }
  }
  
  fileprivate func setState(indicator: Bool, bounce: Bool) {
    showsVerticalScrollIndicator = indicator
    showsHorizontalScrollIndicator = indicator
    bounces = false
    isPagingEnabled = true
  }
  
  func makeHorizontalPagingWithinIndicatorsAndBounce() {
    setScrollView(with: .horizontal)
  }
  
  func makeVerticalPagingWithinIndicatorsAndBounce() {
    setScrollView(with: .vertical)
  }
}

//MARK: - Color change
func blend(from: UIColor, to: UIColor, percent: Double) -> UIColor {
  var fR : CGFloat = 0.0
  var fG : CGFloat = 0.0
  var fB : CGFloat = 0.0
  var tR : CGFloat = 0.0
  var tG : CGFloat = 0.0
  var tB : CGFloat = 0.0
  
  from.getRed(&fR, green: &fG, blue: &fB, alpha: nil)
  to.getRed(&tR, green: &tG, blue: &tB, alpha: nil)
  
  let dR = tR - fR
  let dG = tG - fG
  let dB = tB - fB
  
  let rR = fR + dR * CGFloat(percent)
  let rG = fG + dG * CGFloat(percent)
  let rB = fB + dB * CGFloat(percent)
  
  return UIColor(red: rR, green: rG, blue: rB, alpha: 1.0)
}

// Pass in the scroll percentage to get the appropriate color
func scrollColor(percent: Double) -> UIColor {
  var start : UIColor
  var end : UIColor
  var perc = percent
  if percent < 0.5 {
    // If the scroll percentage is 0.0..<0.5 blend between yellow and green
    start = UIColor.systemGreen
    end = UIColor.purple
  } else {
    // If the scroll percentage is 0.5..1.0 blend between green and blue
    start = UIColor.purple
    end = UIColor.systemIndigo
    perc -= 0.5
  }
  
  return blend(from: start, to: end, percent: perc * 2.0)
}
