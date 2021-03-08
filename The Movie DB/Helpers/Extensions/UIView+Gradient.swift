//
//  UIView+Gradient.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class GradientView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private func setupView() {
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    guard let theLayer = self.layer as? CAGradientLayer else {
      return;
    }
    
    theLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    theLayer.locations = [0.0, 1.0]
    theLayer.frame = self.bounds
  }
  
  override class var layerClass: AnyClass {
    return CAGradientLayer.self
  }
}
