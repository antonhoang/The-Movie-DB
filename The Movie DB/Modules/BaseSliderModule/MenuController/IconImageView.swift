//
//  IconImageView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class IconImageView: UIImageView {
  override var intrinsicContentSize: CGSize {
    return .init(width: 44, height: 44)
  }
}
