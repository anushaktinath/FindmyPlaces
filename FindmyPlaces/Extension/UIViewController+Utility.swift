//
//  UIViewController+Utility.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/19/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

extension UIViewController{
  
  func flipController(vc: UIViewController) {
    /*
    let transition = CATransition()
    transition.duration = 0.3
    transition.type = "flip"
    transition.subtype = kCATransitionFromLeft
    self.navigationController?.view.layer.add(transition, forKey: kCATransition)
    self.navigationController?.pushViewController(self, animated: true)
 */

    
    UIView.beginAnimations("View Flip", context: nil)
    UIView.setAnimationDuration(1.0)
    UIView.setAnimationCurve(.easeInOut)
    UIView.setAnimationTransition(UIViewAnimationTransition.flipFromLeft, for: vc.view, cache: false)
   // self.navigationController?.pushViewController(vc, animated: true)
  }
  
}
