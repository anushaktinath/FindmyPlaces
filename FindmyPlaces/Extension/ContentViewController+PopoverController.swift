//
//  ContentViewController+PopoverController.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/22/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

extension ContentViewController: UIPopoverPresentationControllerDelegate{
  
  func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
    if (popoverPresentationController.presentedViewController != self.placeVC){
    var dictonary = LocationManager.shared.defaultKeyValue as! [String: String]
    guard let value = dictonary[QueryParamKeys.types] else {
      return
    }
    if  value == "" {
      typesButton.setTitle(selectCategoryString, for: .normal)
      removeAnnotations()
    }else{
      typesButton.setTitle(" \(value.uppercased()) ", for: .normal)
      fetchPlaces(types: value, radius: "", name: "")
    }
    }else{
      self.clearSearch()
    }
}
  
    
}

