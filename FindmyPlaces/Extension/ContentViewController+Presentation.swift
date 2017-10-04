//
//  UIViewController+Presentation.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/26/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

protocol PopoverControllerFactory {
  func buildPopOver() -> UIViewController
}

struct PopoverController: PopoverControllerFactory {
  let delegate: UIPopoverPresentationControllerDelegate
  let sender: UIView
  let vc: UIViewController
  
  
  func buildPopOver() -> UIViewController  {
    vc.modalPresentationStyle = .popover
    vc.preferredContentSize = CGSize(width: pickerWidth, height: pickerHeight)
    vc.popoverPresentationController?.delegate = self.delegate
    vc.popoverPresentationController?.sourceView = sender
    vc.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
    return vc
    
  }

}
 
/*
extension ContentViewController{
  
  func buildPopOver(vc: UIViewController,sender: UIView)  {
    
    vc.modalPresentationStyle = UIModalPresentationStyle .popover
    vc.preferredContentSize = CGSize(width: pickerWidth, height: pickerHeight)
    vc.popoverPresentationController?.delegate = self
    vc.popoverPresentationController?.sourceView = sender
    vc.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
    self.present(vc, animated: true, completion: nil)
    
  }
 */

  
  

