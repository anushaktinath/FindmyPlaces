//
//  PlacesListViewController.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

protocol PlacesListViewControllerDelegate: class {
  func didFinish(_ controller:PlacesListViewController, place:SearchResult)
  
}

class PlacesListViewController: UIViewController {
  
  @IBOutlet  weak var tableView: UITableView!
  var result:  [SearchResult] = []
  var filterResults: [SearchResult] = []
  weak var delegate: PlacesListViewControllerDelegate?
  @IBOutlet weak var noResultLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  
  func finishedReceivingData(results: [SearchResult]?) {
    guard let results = results else {
      return
    }
    result = results
    if result.count == 0 {
      /*
       DispatchQueue.main.async {
        self.noResultLabel?.isHidden = false
      }
 */
    }else{
    //since this method is been called form content controller update must be done on main thread
    DispatchQueue.main.async {
      //self.noResultLabel?.isHidden = true
      self.tableView?.reloadData()
    }
    }
  }

}

extension PlacesListViewController: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return result.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Identfiers.cellIdentifier, for: indexPath) as! PlacesCell
    if result.count > 0 && indexPath.row < result.count {
      cell.setUpCell(result: result[indexPath.row])
    }
    cell.selectionStyle = .none
    tableView.separatorStyle = .singleLine
    return cell
    
  }
  
}

extension PlacesListViewController:UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    self.tableView?.estimatedRowHeight = 160
    return UITableViewAutomaticDimension
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if result.count > 0 && indexPath.row < result.count {
      delegate?.didFinish(self, place: result[indexPath.row])
    }
  }
  
}



