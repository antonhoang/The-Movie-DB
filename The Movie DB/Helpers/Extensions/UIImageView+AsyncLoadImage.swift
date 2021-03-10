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
    self.kf.setImage(with: imageURL)
    
//    var data: Data?
//    let queue = DispatchQueue.global(qos: .utility)
//
//    let workItem = DispatchWorkItem {
//      do {
//        data = try Data(contentsOf: imageURL)
//      } catch let error {
//        print(error)
//      }
//    }
//
//    queue.async(execute: workItem)
//    workItem.notify(queue: .main) {
//      if let imageData = data {
//        DispatchQueue.main.async {
//          UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve) { [weak self] in
//            self?.image = UIImage(data: imageData)
//          }
//        }
//      }
//    }
  }
}
