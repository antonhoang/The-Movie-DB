//
//  FeedHeader.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class FeedHeader: UICollectionReusableView {
  
  fileprivate weak var headerTitle: UILabel!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHeaderTitle()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupHeaderTitle()
  }
  
  fileprivate func setupHeaderTitle() {
    let headerTitle = UILabel()
    addSubview(headerTitle)
    self.headerTitle = headerTitle
    headerTitle.frame = bounds
    headerTitle.font = UIFont.boldSystemFont(ofSize: 25)
    headerTitle.text = "Upcoming"
    headerTitle.textColor = .white
  }
}
