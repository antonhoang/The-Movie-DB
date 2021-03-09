//
//  CommonInitView.swift
//  The Movie DB
//
//  Created by Anton Hoang on 09.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

class CommonInitView: UIView {
  
  //MARK: - Properties
  override init(frame: CGRect) {
    super.init(frame: frame)
    сommonInit()
  }
  
  //MARK: - Lifecycle
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    сommonInit()
  }
  
  //MARK: - Setup views
  func сommonInit() {

  }
}
