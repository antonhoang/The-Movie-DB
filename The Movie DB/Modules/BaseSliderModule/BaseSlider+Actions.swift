//
//  BaseSlider+Actions.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

extension BaseSliderController {
  
  @objc func handlePan(gesture: UIPanGestureRecognizer) {
    let translation = gesture.translation(in: view)
    var x = translation.x
    
    x = isMenuOpen ? x + menuWidth : x
    x = min(menuWidth, x)
    x = max(x, 0)
    redLeadingConstraint?.constant = x
    redTrailingConstraint?.constant = x
    darkCoverView.alpha = x / menuWidth

    if gesture.state == .ended {
      handleEnded(gesture: gesture)
    }
  }
  
  @objc func handleTapDismiss() {
    closeMenu()
  }
  
  @objc private func handleEnded(gesture: UIPanGestureRecognizer) {
    let translation = gesture.translation(in: view)
    let velocity = gesture.velocity(in: view)
    
    if isMenuOpen {
      if abs(velocity.x) > velocityThreshold {
        closeMenu()
        return
      }
      
      if abs(translation.x) < menuWidth / 2 {
        openMenu()
      } else {
        closeMenu()
      }
    } else {
      if velocity.x > velocityThreshold {
        openMenu()
        return
      }
      
      if translation.x < menuWidth / 2 {
        closeMenu()
      } else {
        openMenu()
      }
    }
  }
  
  func closeMenu() {
    redLeadingConstraint?.constant = 0
    redTrailingConstraint?.constant = 0
    isMenuOpen = false
    performAnimations()
  }
  
  func openMenu() {
    isMenuOpen = true
    redLeadingConstraint?.constant = menuWidth
    redTrailingConstraint?.constant = menuWidth
    performAnimations()
  }
  
  fileprivate func performAnimations() {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      self.view.layoutIfNeeded()
      self.darkCoverView.alpha = self.isMenuOpen ? 1 : 0
    })
  }
}
