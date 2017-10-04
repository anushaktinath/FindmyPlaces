//
//  SearchResult.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

struct SearchResult: ParsedEntity {
  
  struct Keys {
    static let icon = "icon"
    static let name = "name"
    static let vicinity = "vicinity"
    static let types = "types"
    static let geometry = "geometry"
    static let location = "location"
    static let lat = "lat"
    static let lng = "lng"


  }
  
  let icon: String?
  let name: String?
  let vicinity: String?
  let types: [String]?
  let lat: Double?
  let long: Double?

  
  
  init?(dictionary: [String: Any]?) {
    guard let dic = dictionary else { return nil }
    icon = dic[Keys.icon] as? String
    name = dic[Keys.name] as? String
    vicinity = dic[Keys.vicinity] as? String
    types = dic[Keys.types] as? [String]
    guard let geometry = dic[Keys.geometry] as? [String:Any] else {
      return nil
    }
    guard let location = geometry[Keys.location] as? [String:Any] else {
      return nil
    }
    lat =  location[Keys.lat] as? Double
    long =  location[Keys.lng] as? Double

  }
  
}
