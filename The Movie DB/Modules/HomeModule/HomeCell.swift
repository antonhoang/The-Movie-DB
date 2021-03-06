//
//  HomeCell.swift
//  The Movie DB
//
//  Created by Anton Hoang on 06.03.2021.
//

import UIKit

final class HomeCell: UITableViewCell {
  
  fileprivate let imageMovie: UIImageView = {
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
  
  func configureCell(movieVO: MovieVO) {
    if let imagePath = movieVO.imageUrlPath {
      loadImage(imagePath: imagePath)
    }
  }
  
  fileprivate func commonInit() {
    contentView.addSubview(imageMovie)
    imageMovie.anchor(top: contentView.topAnchor,
                      leading: contentView.leadingAnchor,
                      bottom: contentView.bottomAnchor,
                      trailing: nil)
  }
  
  func loadImage(imagePath: String) {
    guard let imageURL = URL(string: imagePath) else { return }
    var data: Data?
    let queue = DispatchQueue.global(qos: .utility)
    
    let workItem = DispatchWorkItem {
      do {
        data = try Data(contentsOf: imageURL)
      } catch let error {
        print(error)
      }
    }
    
    queue.async(execute: workItem)
    workItem.notify(queue: .main) { [weak self] in
      if let imageData = data {
        self?.imageMovie.image = UIImage(data: imageData)
      }
    }
  }
}
