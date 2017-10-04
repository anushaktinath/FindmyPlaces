//
//  Dictonary+Utility.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/20/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation

extension Dictionary where Key : CustomStringConvertible, Value : CustomStringConvertible {
  
  /// Build string representation of HTTP parameter dictionary of keys and objects
  ///
  /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
  func stringFromHttpParameters() -> String {
    var parametersString = ""
    for (key, value) in self {
      parametersString += key.description + "=" + value.description + "&"
    }
    parametersString = parametersString.substring(to: parametersString.index(before: parametersString.endIndex))
    return parametersString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
}

