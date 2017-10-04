//
//  UIButton+Utility.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/27/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

extension UIButton{
  
   func highlightedState(){
    backgroundColor = .black
    setTitleColor(.white, for: .normal)
    
  }
  
   func disabledState(){
    backgroundColor = .clear
    setTitleColor(.black, for: .normal)
  }
  
}
