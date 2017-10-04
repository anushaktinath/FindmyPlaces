//
//  UIView+Utility.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/26/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

extension UIView{
  
  func styleView() {
    self.backgroundColor = .clear
    self.layer.cornerRadius = 5
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.black.cgColor
  }
}
