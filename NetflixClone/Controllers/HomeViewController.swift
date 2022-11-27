//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by LAP13437 on 26/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
  
  private let homeFeedTable : UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    // forCellReuseIdentifier which is a string that lets you register different kinds of table view cells
    // not nil or empty string
    table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    // the view to be added
    // after being added, this view appears on top of any other subviews
    view.addSubview(homeFeedTable)
    
    // delegate: control of the user interface
    // datasource: delegated control of data
    homeFeedTable.delegate = self
    homeFeedTable.dataSource = self
    
    homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    homeFeedTable.frame = view.bounds
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
      return UITableViewCell()
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
}
