//
//  ItemsViewController.swift
//  GenericViewController
//
//  Created by Kelvin Lau on 2017-02-07.
//  Copyright © 2017 Kelvin Lau. All rights reserved.
//

import UIKit

final class ItemsViewController<Item, Cell: UITableViewCell>: UITableViewController {
  fileprivate let items: [Item]
  fileprivate let reuseIdentifier = "Cell"
  fileprivate let configure: (Cell, Item) -> ()
  var didSelect: (Item) -> () = { _ in }
  
  init(items: [Item], configure: @escaping (Cell, Item) -> ()) {
    self.items = items
    self.configure = configure
    
    super.init(style: .plain)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(Cell.self, forCellReuseIdentifier: reuseIdentifier)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! Cell
    let item = items[indexPath.row]
    configure(cell, item)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = items[indexPath.row]
    didSelect(item)
  }
}

