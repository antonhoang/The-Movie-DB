//
//  UIImageView+Round.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
  func roundImage() {
    layer.cornerRadius = frame.height / 2
    layer.masksToBounds = false
    clipsToBounds = true
  }
}
