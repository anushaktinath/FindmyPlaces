//
//  ContentViewController+ChildControllers.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/22/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

extension ContentViewController{
  
   func add(asChildViewController viewController: UIViewController) {
    // Add Child View Controller
    addChildViewController(viewController)
    
    // Add Child View as Subview
    view.addSubview(viewController.view)
    
    // Configure Child View
    viewController.view.frame = CGRect(x:0,y:CGFloat(yPosition),width:screenWidth,height: screenHeight-CGFloat(yPosition))
    viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    // Notify Child View Controller
    viewController.didMove(toParentViewController: self)
  }
  
   func remove(asChildViewController viewController: UIViewController) {
    // Notify Child View Controller
    viewController.willMove(toParentViewController: nil)
    
    // Remove Child View From Superview
    viewController.view.removeFromSuperview()
    
    // Notify Child View Controller
    viewController.removeFromParentViewController()
  }

  
}
