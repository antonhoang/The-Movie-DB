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
    $0.textColor = .lightText
    $0.numberOfLines = 0
    $0.font = .systemFont(ofSize: 14, weight: .medium)
    return $0
  }(UILabel())
  
  fileprivate lazy var voteAverage: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.numberOfLines = 0
    $0.font = .monospacedDigitSystemFont(ofSize: 18, weight: .heavy)
    $0.setContentCompressionResistancePriority(.required, for: .horizontal)
    return $0
  }(UILabel())
  
  fileprivate let verticalInfoStackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .horizontal
    $0.spacing = 4
    $0.distribution = .fillEqually
    $0.alignment = .trailing
    return $0
  }(UIStackView())
  
  fileprivate let horizontalInfoStackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .horizontal
    $0.distribution = .equalSpacing
    $0.spacing = 2
    $0.alignment = .top
    $0.isLayoutMarginsRelativeArrangement = true
    $0.layoutMargins = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 10)
    return $0
  }(UIStackView())
  
  fileprivate lazy var titleLabel: UILabel = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.numberOfLines = 2
    $0.preferredMaxLayoutWidth = self.bounds.size.width
    $0.font = .boldSystemFont(ofSize: 20)
    return $0
  }(UILabel())
  
  fileprivate let infoStackView: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.distribution = .fill
    $0.alignment = .top
    $0.isLayoutMarginsRelativeArrangement = true
    $0.layoutMargins = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 10)
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
    
    voteAverage.text = String(describing: movieVO.vote_average)
    titleLabel.text = movieVO.original_title
    overviewLabel.text = movieVO.overview
    
    if movieVO.vote_average >= 7 {
      voteAverage.textColor = .systemGreen
    } else if movieVO.vote_average >= 5 {
      voteAverage.textColor = .yellow
    } else if movieVO.vote_average >= 3 {
      voteAverage.textColor = .systemOrange
    } else if movieVO.vote_average < 3 {
      voteAverage.textColor = .systemRed
    }
  }
  
  fileprivate func setupImageView() {
    contentView.addSubview(movieImageView)
    NSLayoutConstraint.activate([
      movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
      movieImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      movieImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      movieImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2.8)
    ])
  }
  
  fileprivate func setupStackView() {
    contentView.addSubview(horizontalInfoStackView)
    contentView.addSubview(infoStackView)
    
    horizontalInfoStackView.addArrangedSubview(titleLabel)
    horizontalInfoStackView.addArrangedSubview(verticalInfoStackView)
    
    verticalInfoStackView.addArrangedSubview(voteAverage)
    
    infoStackView.addArrangedSubview(overviewLabel)
    
    NSLayoutConstraint.activate([
      horizontalInfoStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      horizontalInfoStackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 5),
      horizontalInfoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      horizontalInfoStackView.heightAnchor.constraint(equalTo: movieImageView.heightAnchor, multiplier: 0.2),
 
      infoStackView.topAnchor.constraint(equalTo: horizontalInfoStackView.bottomAnchor),
      infoStackView.leadingAnchor.constraint(equalTo: horizontalInfoStackView.leadingAnchor),
      infoStackView.trailingAnchor.constraint(equalTo: horizontalInfoStackView.trailingAnchor),
      infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
