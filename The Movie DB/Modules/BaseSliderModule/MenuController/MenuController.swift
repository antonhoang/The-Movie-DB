//
//  MenuController.swift
//  The Movie DB
//
//  Created by Anton Hoang on 08.03.2021.
//  Copyright © 2021 Anton Hoang. All rights reserved.
//

import Foundation
import UIKit

struct MenuItem {
    let icon: UIImage
    let title: String
}

final class MenuController: UIViewController {
        
  fileprivate let menuItems = [
    MenuItem(icon: #imageLiteral(resourceName: "bookmarks"), title: "Posts"),
    MenuItem(icon: #imageLiteral(resourceName: "profile"), title: "List"),
    MenuItem(icon: #imageLiteral(resourceName: "lists"), title: "Favourites"),
  ]
  
  fileprivate let menuCellId = Constants.CellIdentifiers.menuCellId.rawValue
  
  fileprivate lazy var tableView: UITableView = {
    $0.backgroundColor = .clear
    $0.separatorStyle = .none
    $0.bounces = false
    $0.showsVerticalScrollIndicator = false
    $0.register(MenuCell.self, forCellReuseIdentifier: menuCellId)
    $0.delegate = self
    $0.dataSource = self
    return $0
  }(UITableView())
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(tableView)
    tableView.fillSuperview()
  }
  
  @objc func handleTapOnHeaderView() {
    let slider = UIWindow.key?.rootViewController as? BaseSliderController
    slider?.didSelectHeaderView()
    if let ips = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: ips, animated: true)
    }
  }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let customHeaderView = CustomMenuHeaderView()
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOnHeaderView))
    customHeaderView.addGestureRecognizer(tapGesture)
    return customHeaderView
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItems.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = MenuCell(style: .default, reuseIdentifier: menuCellId)
    let menuItem = menuItems[indexPath.row]
    cell.iconImageView.image = menuItem.icon
    cell.titleLabel.text = menuItem.title
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let slider = UIWindow.key?.rootViewController as? BaseSliderController
    slider?.didSelectItem(indexPath: indexPath)
  }
}
