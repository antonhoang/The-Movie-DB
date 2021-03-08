//
//  SpacerView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class SpacerView: UIView {
  
  let space: CGFloat
  
  override var intrinsicContentSize: CGSize {
    return .init(width: space, height: space)
  }
  
  init(space: CGFloat) {
    self.space = space
    super.init(frame: .zero)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
