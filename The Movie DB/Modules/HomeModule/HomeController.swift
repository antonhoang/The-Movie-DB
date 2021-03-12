//
//  ViewController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 21.02.2021.
//

import UIKit

final class HomeController: BaseController {
  
  var coordinator: HomeCoordinatorFlow?
  var viewModel: HomeViewModelProtocol?
  
  fileprivate let cellID = Constants.CellIdentifiers.homeCellId.rawValue
  fileprivate let screenTitle = Constants.ScreenTitles.home.rawValue
  fileprivate var model: [MovieVO] = []
  fileprivate let statusBarColor = UIColor.white
  
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

  override var preferredStatusBarStyle: UIStatusBarStyle {
    .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupTableView()
    dataBindings()
    navigationController?.navigationBar.barStyle = .black
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = false
  }
  
  fileprivate func dataBindings() {
    viewModel?.items.bind(observer: { [weak self] (moviesVO) in
      guard let self = self, !moviesVO.isEmpty else { return }
      self.model = moviesVO
      DispatchQueue.main.async {
        self.tableView.reloadData()        
      }
    })
  }
  
  fileprivate func setupTableView() {
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  fileprivate func setupUI() {
    navigationItem.title = screenTitle
  }
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? HomeCell else {
      assert(false)
    }
    cell.configureCell(movieVO: model[indexPath.row])
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let movieVO = model[indexPath.row]
    coordinator?.coordinateToDetails(with: movieVO, navController: navigationController!)
  }
}

