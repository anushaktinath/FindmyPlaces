//
//  ParsedEntity.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

protocol ParsedEntity {
  
  /**
   Initializes the parsed entity using a dictionary
   
   - parameter dictionary: Dictionary that used to parse the entity. Usually comes from the server.
   */
  init?(dictionary: [String: Any]?)
}

extension ParsedEntity {
    
  static func entitiesFromArray(_ array: [[String: Any]]?) -> [Self] {
    return array?.flatMap { Self(dictionary: $0) } ?? []
  }
  
  
  
}
