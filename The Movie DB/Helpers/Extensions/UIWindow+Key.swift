//
//  UIWindow+Key.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
  static var key: UIWindow? {
    if #available(iOS 13, *) {
      return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    } else {
      return UIApplication.shared.keyWindow
    }
  }
}
