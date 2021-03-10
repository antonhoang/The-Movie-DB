//
//  ProfileStackView.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class ProfileStackView: CommonInitView {
  
  private weak var stackView: UIStackView!
  private weak var visualView: UIVisualEffectView!
  weak var title: UILabel!
  weak var subtitle: UILabel!
  
  var titleText: String? {
    didSet {
      title.text = titleText
    }
  }
  
  var subtitleText: String? {
    didSet {
      subtitle.text = subtitleText
    }
  }
  
  override func сommonInit() {
    super.сommonInit()
    setupUI()
    setupBlurEffect()
    setupStackView()
    setupTitle()
    setupSubtitle()
  }
  
  private func setupUI() {
    layer.cornerRadius = CGFloat(Constants.CornerRadius.icon29px)
    clipsToBounds = true
  }
  
  private func setupBlurEffect() {
    let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
    let visualView = UIVisualEffectView(effect: blurEffect)
    visualView.frame = bounds
    visualView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(visualView)
    self.visualView = visualView
  }
  
  private func setupTitle() {
    let title = UILabel()
    stackView.addArrangedSubview(title)
    self.title = title
  }
  
  private func setupSubtitle() {
    let subtitle = UILabel()
    stackView.addArrangedSubview(subtitle)
    self.subtitle = subtitle
  }
  
  private func setupStackView() {
    let stackView = UIStackView()
    addSubview(stackView)
    self.stackView = stackView
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    stackView.alignment = .center
    stackView.fillSuperview()
//    stackView.fillEqually(to: self)
  }
}
