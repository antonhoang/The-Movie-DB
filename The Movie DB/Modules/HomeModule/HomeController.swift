//
//  ViewController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import UIKit

final class HomeController: UIViewController {
  
  var coordinator: HomeCoordinatorFlow?
  var viewModel: HomeViewModelProtocol?
  
  fileprivate let cellID = Constants.CellIdentifiers.homeCellId.rawValue
  fileprivate let screenTitle = Constants.ScreenTitles.home.rawValue
  
  fileprivate lazy var tableView: UITableView = {
    $0.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    $0.delegate = self
    $0.dataSource = self
    return $0
  }(UITableView())

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupTableView()
  }
  
  fileprivate func setupTableView() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  fileprivate func setupUI() {
    navigationItem.title = screenTitle
    view.backgroundColor = .systemTeal
  }
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    coordinator?.coordinateToDetails()
  }
}

