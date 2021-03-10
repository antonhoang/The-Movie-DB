//
//  RoundImage.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class RoundImage: UIImageView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func setupImage(with image: UIImage) {
    self.image = image
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    roundImage()
  }
}
