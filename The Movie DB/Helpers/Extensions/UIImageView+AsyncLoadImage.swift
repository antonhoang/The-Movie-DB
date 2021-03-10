//
//  UIImageView+AsyncLoadImage.swift
//  The Movie DB
//
//  Created by Anton Hoang on 07.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
  func loadImage(imagePath: String) {
    guard let imageURL = URL(string: imagePath) else { return }
    
    DispatchQueue.main.async {
      UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve) { [weak self] in
        self?.kf.setImage(with: imageURL)
      }
    }
  }
}
