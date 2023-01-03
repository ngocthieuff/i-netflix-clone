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
    
    configureNavbar()
    
    // delegate: control of the user interface
    // datasource: delegated control of data
    homeFeedTable.delegate = self
    homeFeedTable.dataSource = self
    
    let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    homeFeedTable.tableHeaderView = headerView
  }
  
  private func configureNavbar() {
      let image = UIImage(named: "netflixLogo")
      
      let resizedImage = image?.resized(to: CGSize(width: 50, height: 50))

      navigationItem.leftBarButtonItem = UIBarButtonItem(image: resizedImage)
        
      navigationItem.rightBarButtonItems = [
        UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
        UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
      ]
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    homeFeedTable.frame = view.bounds
  }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
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
