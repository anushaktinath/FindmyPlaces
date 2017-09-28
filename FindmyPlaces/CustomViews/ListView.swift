//
//  ListView.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/18/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

final class PickerViewController: UIViewController {
  
  // MARK: - Properties
  
  var rowValues: [String]!
  var item: String!
  var selectedArray: [String] = []
  
  /*
  var max: Int {
    return categories.count
  }
 */
  
  @IBOutlet weak var tableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
      tableView.allowsMultipleSelection = true
      selectedArray = LocationManager.shared.selectedCategory

  }
  
}

extension PickerViewController: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return rowValues.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Identfiers.cellIdentifier, for: indexPath) as! CategoriesCell
    cell.delegate = self
    if selectedArray.contains(rowValues[indexPath.row]) {
      cell.categorySelected = true
    }
    else {
      cell.categorySelected = false
    }
    cell.setUpCell(item: rowValues[indexPath.row])
    return cell
  }
}

extension PickerViewController: CategoriesCellDelegate{
  func categoriesCell(_ cell: CategoriesCell, didSelect category: String) {
      if !(selectedArray.contains(category)) {
        selectedArray.append(category)
      }else{
        if let index = selectedArray.index(of:category) {
          selectedArray.remove(at: index)
        }
      }
    LocationManager.shared.selectedCategory = selectedArray
    var dictonary = LocationManager.shared.defaultKeyValue as! [String: String]
    let selectedValues = (selectedArray.map{String($0)}).joined(separator: ",")
    dictonary[item] = selectedValues.lowercased()
    LocationManager.shared.defaultKeyValue = dictonary
    tableView.reloadData()
  }
}

