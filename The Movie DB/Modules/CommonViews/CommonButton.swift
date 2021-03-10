//
//  CommonButton.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit
 
class CommonButton: UIButton {
  
  typealias DidTapButton = (CommonButton) -> ()
  
  var touchUpInside: DidTapButton? {
    didSet {
      if touchUpInside != nil {
        addTarget(self, action: #selector(didTouchUpInside(sender:)), for: .touchUpInside)
      } else {
        removeTarget(self, action: #selector(didTouchUpInside(sender:)), for: .touchUpInside)
      }
    }
  }
  
  @objc func didTouchUpInside(sender: UIButton) {
    if let handler = touchUpInside {
      handler(self)
    }
  }
  
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
