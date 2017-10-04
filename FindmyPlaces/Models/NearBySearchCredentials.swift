//
//  NearBySearchCredentials.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

struct NearBySearchCredentials {
  
  struct Keys {
    static let location = "location"
    static let radius = "radius"
    static let types = "types"
    static let name = "name"
    
  }
  
  let location: String?
  let radius: Int?
  let types: String?
  let name: String?
  
  init(location: String?,radius: Int?,types: String?,name: String?) {
    self.location = location
    self.radius   = radius
    self.types    = types
    self.name     = name
  }

		
  
}
