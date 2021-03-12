//
//  ProfileController.swift
//  The Movie DB
//
//  Created by Antuan Hoang on 10.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit
import Combine

final class ProfileController: BaseController {
  
  var coordinator: ProfileCoordinator!
  var viewModel: ProfileViewModelProtocol!
  private weak var collectionView: UICollectionView!
  private let profileViewType: [ProfileViewType] = [.head, .list]
  private var disposeBag = Set<AnyCancellable>()
  
  let images = ["pic1", "pic2", "pic3",
                "pic4", "pic5", "pic6",
                "pic7", "pic8", "pic9",
                "pic10"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSettingButton()
    setupCollectionView()
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationController?.navigationBar.isHidden = false
  }
  
  private func setupSettingButton() {
    let settingButton = UIBarButtonItem(image: Constants.TabBar.settings.image, style: .plain, target: self, action: #selector(coordinateToSettings))
    navigationItem.title = "behaviourrelay"
    navigationItem.rightBarButtonItems = [settingButton]
  }
  
  @objc private func coordinateToSettings() {
//    coordinator.coordinateToSettings()
  }
  
  private func setupCollectionView() {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupCollectionViewLayout())
    view.addSubview(collectionView)
    self.collectionView = collectionView
    collectionView.fillSuperview()
//    collectionView.fillEqually(to: view)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .clear
    collectionView.showsVerticalScrollIndicator = false
    collectionView.register(ProfileHeadViewCell.self, forCellWithReuseIdentifier: Constants.CellIdentifier.profileHeadCellID)
    collectionView.register(ProfileListViewCell.self, forCellWithReuseIdentifier: Constants.CellIdentifier.profileListCellID)
  }
  
  private func setupCollectionViewLayout() -> UICollectionViewLayout {
    
    return UICollectionViewCompositionalLayout.init(sectionProvider: {
      (sectionNumber, env) -> NSCollectionLayoutSection? in
      
      switch ProfileViewType(rawValue: sectionNumber) {
      case .head:
        let headerItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/2)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/2)), subitem: headerItem, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        return section
        
      case .list:
        let fullPhotoItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(2/3)))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let mainItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1.0)))
        mainItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let pairItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
        pairItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)), subitem: pairItem, count: 2)
        
        let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(4/9)), subitems: [mainItem, trailingGroup])
        
        let tripletItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)))
        
        tripletItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let tripletGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(2/9)), subitems: [tripletItem, tripletItem, tripletItem])
        
        let mainWithPairReversedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(4/9)), subitems: [trailingGroup, mainItem])
        
        let nestedGroup = NSCollectionLayoutGroup.vertical(
          layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                            heightDimension: .fractionalWidth(16/9)),
          subitems: [fullPhotoItem, mainWithPairGroup, tripletGroup, mainWithPairReversedGroup])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        return section
        
      default: assert(false)
      }
    })
  }
}

extension ProfileController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    profileViewType.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch ProfileViewType(rawValue: section) {
    case .head:
      return 1
      
    case .list:
      return images.count
      
    default: assert(false)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch ProfileViewType(indexPath: indexPath) {
    case .head:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.profileHeadCellID, for: indexPath) as? ProfileHeadViewCell else { assert(false) }
      
      cell.configureCell(imageName: images[indexPath.row], title: "1.2M")
      cell.actionPublisher.sink { [weak self] (action) in
        switch action {
        case .patrons:
//          self?.coordinator.coordinateToSubs(with: .patrons)
          print("")
        case .subscriptions:
          print("")
//          self?.coordinator.coordinateToSubs(with: .subscriptions)
        }
      }.store(in: &disposeBag)
      
      return cell
      
    case .list:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.profileListCellID, for: indexPath) as? ProfileListViewCell else { assert(false) }
      
      cell.configureCell(imageName: images[indexPath.row])
      
      return cell
      
    default: assert(false)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch ProfileViewType(indexPath: indexPath) {
    case .list:
      print("")
//      coordinator.coordinateToProfileContent(with: indexPath.row, content: images)
    default:
      print("some")
    }
  }
}

extension ProfileController: UICollectionViewDelegate {
  
}
