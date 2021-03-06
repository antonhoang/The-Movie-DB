//
//  HomeCell.swift
//  The Movie DB
//
//  Created by Anton Hoang on 06.03.2021.
//

import UIKit

final class HomeCell: UITableViewCell {
  
  fileprivate let imageMovie: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    imageMovie.image = nil // or placeholder
  }
  
  fileprivate func commonInit() {
    contentView.addSubview(imageMovie)
    
  }
}
