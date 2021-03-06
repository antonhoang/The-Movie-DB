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
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  func configureCell(movieVO: MovieVO) {
    if let imagePath = movieVO.imageUrlPath {
      loadImage(imagePath: imagePath)
    }
  }
  
  fileprivate func commonInit() {
    backgroundColor = .black
    contentView.addSubview(imageMovie)
    NSLayoutConstraint.activate([
      imageMovie.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
      imageMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageMovie.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
    ])
  }
  
  fileprivate func loadImage(imagePath: String) {
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
    workItem.notify(queue: .main) {
      if let imageData = data {
        UIView.transition(with: self.imageMovie, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
          self?.imageMovie.image = UIImage(data: imageData)
        }
      }
    }
  }
}
