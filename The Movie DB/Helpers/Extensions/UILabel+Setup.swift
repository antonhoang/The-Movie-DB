//
//  UILabel+Setup.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
  func setupLabelWith(text: String, textColor: UIColor, font: UIFont) {
    self.text = text
    self.textColor = textColor
    self.font = font
  }
}
