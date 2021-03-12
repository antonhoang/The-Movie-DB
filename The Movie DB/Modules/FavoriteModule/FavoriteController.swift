//
//  FavoriteController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import Foundation
import UIKit

final class FavoriteController: BaseController {
  
  var viewModel: FavoriteViewModelProtocol?
  var coordinator: FavoriteCoordinatorFlow?
  
  fileprivate let cellID = Constants.CellIdentifiers.favoriteCellId.rawValue
  fileprivate let screenTitle = Constants.ScreenTitles.favorite.rawValue
  fileprivate var model: [MovieVO] = []
  fileprivate let statusBarColor = UIColor.black
  
  fileprivate let emptyListLabel: UILabel = {
    $0.text = "Тo movie lists have been created yet"
    $0.textColor = .white
    $0.numberOfLines = 1
    $0.font = .preferredFont(forTextStyle: .subheadline)
    return $0
  }(UILabel())
  
  fileprivate lazy var tableView: UITableView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.register(HomeCell.self, forCellReuseIdentifier: cellID)
    $0.delegate = self
    $0.dataSource = self
    $0.separatorStyle = .none
    $0.backgroundColor = .clear
    $0.rowHeight = UIScreen.main.bounds.height / 3.2
    return $0
  }(UITableView())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupEmptyListLabel()
  }
  
  fileprivate func setupEmptyListLabel() {
    view.addSubview(emptyListLabel)
    NSLayoutConstraint.activate([
      emptyListLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emptyListLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      emptyListLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      emptyListLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
  
  fileprivate func setupTableView() {
    view.addSubview(tableView)
    tableView.fillSuperview()
  }
}

extension FavoriteController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
}
