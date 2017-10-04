//
//  GoogleSearchResults.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/15/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

struct GoogleSearchResults: ParsedEntity {
  
  struct Keys {
    static let results = "results"
    
  }
  let searchResults: [SearchResult]
  
  init?(dictionary: [String: Any]?) {
    guard let dic = dictionary else { return nil }
    let resultsArray = dic[Keys.results] as? [[String: Any]]
    self.searchResults = SearchResult.entitiesFromArray(resultsArray)
  }
  
}
