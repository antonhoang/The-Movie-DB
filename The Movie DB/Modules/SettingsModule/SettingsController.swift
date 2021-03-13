//
//  SettingsController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 13.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

final class SettingsController: UIViewController {
  
  enum SectionType {
    case account, main
  }
  
  struct Setting: Hashable {
    let name: String
  }
  
  enum SettingRaw: String {
    case account = "Account"
    case push = "Push notifications"
    case logout = "Logout"
  }
  
  private let settingRaw: [SettingRaw] = [.account, .push, .logout]
  private weak var settingTableView: UITableView!
  var viewModel: SettingsViewModelProtocol!
  var coordinator: SettingsFlow?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableViewDiffibleDataSource()
  }
  
  lazy var source: UITableViewDiffableDataSource<SectionType, Setting> = .init(tableView: settingTableView) { (_, indexPath, item) -> UITableViewCell? in
    
    let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
    cell.textLabel?.text = item.name
    return cell
  }
  
  private func setupTableViewDiffibleDataSource() {
    let settingTableView = UITableView(frame: view.bounds, style: .insetGrouped)
    settingTableView.delegate = self
    view.addSubview(settingTableView)
    self.settingTableView = settingTableView
    settingTableView.bounces = false
    
    var snapshot = source.snapshot()
    snapshot.appendSections([.account, .main])

    snapshot.appendItems([.init(name: "Account")], toSection: .account)
    
    snapshot.appendItems([.init(name: "Push notifications"),
                          .init(name: "Logout")], toSection: .main)
    
    source.apply(snapshot)
  }
}

extension SettingsController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let item = source.itemIdentifier(for: indexPath) else { return }
    tableView.deselectRow(at: indexPath, animated: true)
    
    switch settingRaw.first(where: { $0.rawValue == item.name }) {
    case .account:
//      coordinator?.coordinateToAccount()
      print(#function)
    case .push:
      print(#function)
//      coordinator?.coordinateToPushNotifications()
    case .logout:
      coordinator?.logout()
      coordinator = nil
      
    default: break
    }
  }
}
