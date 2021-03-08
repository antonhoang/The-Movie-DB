//
//  MenuCell.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class MenuCell: UITableViewCell {
  
  let iconImageView: IconImageView = {
    $0.contentMode = .scaleAspectFit
    $0.image = #imageLiteral(resourceName: "profile")
    return $0
  }(IconImageView())
  
  let titleLabel: UILabel = {
    $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    return $0
  }(UILabel())
  
  let bgView: UIView = {
    $0.backgroundColor = #colorLiteral(red: 0.2941176471, green: 0.6, blue: 0.5411764706, alpha: 1)
    $0.layer.cornerRadius = 5
    return $0
  }(UIView())
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupStackView()
    setupUI()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    bgView.isHidden = !selected
  }
  
  fileprivate func setupUI() {
    backgroundColor = .clear
    selectionStyle = .none
    addSubview(bgView)
    bgView.fillSuperview(padding: .init(top: 0, left: 8, bottom: 0, right: 8))
    sendSubviewToBack(bgView)
  }
  
  fileprivate func setupStackView() {
    let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel, UIView()])
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 12
    titleLabel.text = "Profile"
    
    stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
