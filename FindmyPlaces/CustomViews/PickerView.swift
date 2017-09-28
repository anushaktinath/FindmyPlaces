//
//  PickerView.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/18/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

protocol ViewControllerFactory {
  func buildPickerViewController() -> UIViewController
  func buildPlacesViewController() -> UIViewController

}

 struct PickerController: ViewControllerFactory {
  
  
  var preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 270)
  private var item: String?
  private var rowValues: [String]?

  
  init(item: String?,rowValues: [String]?) {
  
    self.item = item
    self.rowValues = rowValues
  }
  
   func buildPickerViewController() -> UIViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let picker = storyboard.instantiateViewController(withIdentifier: Controllers.pickerVC) as! PickerViewController
    picker.item = item
    picker.rowValues = rowValues
    picker.preferredContentSize = self.preferredContentSize
    return picker
  }
  
  func buildPlacesViewController() -> UIViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let placeVC = storyboard.instantiateViewController(withIdentifier: Controllers.placesListVC) as! PlacesListViewController
    placeVC.preferredContentSize = self.preferredContentSize
    return placeVC
  }

  
}

