//
//  FeedController.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class FeedController: BaseController {
  var viewModel: FeedViewModelProtocol!
  var coordinator: FeedFlow!
  fileprivate let screenTitle = Constants.ScreenTitles.favorite.rawValue

  fileprivate lazy var feedCollectionView: UICollectionView = {
    $0.backgroundColor = .clear
    $0.showsVerticalScrollIndicator = false
    $0.showsHorizontalScrollIndicator = false
    $0.dataSource = self
    $0.delegate = self
    $0.register(FeedMovieCell.self, forCellWithReuseIdentifier: Constants.CellIdentifier.feedMovieCellID)
    $0.register(FeedCell.self, forCellWithReuseIdentifier: Constants.CellIdentifier.feedCellID)
    $0.register(FeedHeader.self, forSupplementaryViewOfKind: Constants.HeaderIdentifier.cardHeaderId, withReuseIdentifier: Constants.HeaderIdentifier.cardHeaderId)
    return $0
  }(UICollectionView(frame: .zero, collectionViewLayout: setupFeedCollectionView()))
  
  fileprivate let feedTypes: [FeedViewType] = [.card, .list]
  
  let images = ["human10", "human2", "human3",
                "human9", "human6", "human7",
                "human1", "human5", "human8"]
  
  let imagesContent = ["cyb1", "cyb2", "cyb3",
                       "cyb4", "cyb5", "cyb6",
                       "cyb7", "cyb8", "cyb9"]
  
  fileprivate var model: [MovieVO] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(feedCollectionView)
    feedCollectionView.fillSuperview()
    
    dataBindings()
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationItem.title = screenTitle
  }
  
  fileprivate func dataBindings() {
    viewModel.moviesVO.bind {
      [weak self] movieVO in
      guard !movieVO.isEmpty else { return }
      self?.model = movieVO
      DispatchQueue.main.async {
        self?.feedCollectionView.reloadData()
      }
    }
  }
    
  fileprivate func setupFeedCollectionView() -> UICollectionViewCompositionalLayout {
    return UICollectionViewCompositionalLayout {
      (sectionNumber, enviroment) -> NSCollectionLayoutSection? in

      switch FeedViewType(rawValue: sectionNumber) {
      case .card:
        let sideInset: CGFloat = 5
        let height = Constants.UIScreenBounds.heightDivided5
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(height))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 0, leading: sideInset, bottom: 0, trailing: sideInset)
        
        let groupWidth = enviroment.container.contentSize.width * 0.88
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(groupWidth), heightDimension: .absolute(height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let sectionSideInset = (enviroment.container.contentSize.width - groupWidth) / 2
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: sectionSideInset, bottom: 0, trailing: sectionSideInset)
        
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets.bottom = 16
        
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: Constants.HeaderIdentifier.cardHeaderId, alignment: .top)]
        return section

      case .list:
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 16, leading: 0, bottom: 0, trailing: 0)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return section
      default: assert(false)
      }
    }
  }
}

extension FeedController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch FeedViewType(indexPath: indexPath) {
    case .card:
      let movieVO = model[indexPath.row]
      coordinator.coordinateToDetails(movieVO: movieVO)
    case .list:
      print("list")
    default:
      return
    }
  }
}

extension FeedController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.HeaderIdentifier.cardHeaderId, for: indexPath)
    return header
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    feedTypes.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    switch FeedViewType(rawValue: section) {
    case .card:
      return model.count
    case .list:
      return 9
    default: assert(false)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch FeedViewType(rawValue: indexPath.section) {
    case .card:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.feedMovieCellID, for: indexPath) as? FeedMovieCell else { assert(false) }
      let movie = model[indexPath.row]
      cell.configureCell(movieVO: movie)
      
      return cell
    case .list:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.feedCellID, for: indexPath) as? FeedCell else { assert(false) }
      cell.configureFeedPost(imageName: images[indexPath.row], contentName: imagesContent[indexPath.row])
      return cell
    default:
      assert(false)
    }
  }
}
