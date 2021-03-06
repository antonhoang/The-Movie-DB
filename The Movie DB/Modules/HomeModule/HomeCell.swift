//
//  HomeCell.swift
//  The Movie DB
//
//  Created by Anton Hoang on 06.03.2021.
//

import UIKit

final class HomeCell: UITableViewCell {
  
  fileprivate let movieImageView: UIImageView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFit
    return $0
  }(UIImageView())
  
  fileprivate let overviewLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = .preferredFont(forTextStyle: .body)
    return $0
  }(UILabel())
  
  
  fileprivate let titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = .preferredFont(forTextStyle: .headline)
    return $0
  }(UILabel())
  
  fileprivate let infoStackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.distribution = .fill
    $0.alignment = .top
    return $0
  }(UIStackView())
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    movieImageView.image = nil
    titleLabel.text = ""
    overviewLabel.text = ""
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  func configureCell(movieVO: MovieVO) {
    if let imagePath = movieVO.imageUrlPath {
      loadImage(imagePath: imagePath)
    }
    
    DispatchQueue.main.async {
      self.titleLabel.text = movieVO.original_title
      self.overviewLabel.text = movieVO.overview
    }

  }
  
  fileprivate func setupImageView() {
    contentView.addSubview(movieImageView)
    NSLayoutConstraint.activate([
      movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
      movieImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.8)
    ])
  }
  
  fileprivate func setupStackView() {
    contentView.addSubview(infoStackView)
    infoStackView.addArrangedSubview(titleLabel)
    infoStackView.addArrangedSubview(overviewLabel)
    NSLayoutConstraint.activate([
      infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
      infoStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 8),
      infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
    ])
  }
  
  fileprivate func commonInit() {
    backgroundColor = .black
    setupImageView()
    
    setupStackView()
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
        UIView.transition(with: self.movieImageView, duration: 0.5, options: .transitionCrossDissolve) { [weak self] in
          self?.movieImageView.image = UIImage(data: imageData)
        }
      }
    }
  }
}
