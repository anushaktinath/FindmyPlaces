//
//  Constant.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit

let GOOGLE_API_KEY = "AIzaSyABMm-3zEDF-CBYuewZa2PLrEK2THs-oJ4"

struct Path {
  static let googleNearbySearchPath = "/maps/api/place/nearbysearch/json?"
}

let BaseUrl = "https://maps.googleapis.com"
let pickerHeight = 300
let pickerWidth = 360
let defaultTypes = ""
let defaultRadius = "1000"
let selectCategoryString = " Select Categories "


enum Method: String {
  case get
  case post
  
  fileprivate var rawString: String {
    switch self {
    case .get:
      return "GET"
      
    case .post():
      return "POST"
      
    }
  }
}

struct Controllers {
  static let mapVC = "MapViewController"
  static let placesListVC = "PlacesListViewController"
  static let pickerVC = "PickerViewController"
  static let contentVC = "ContentViewController"

}

struct Identfiers {
  static let pinIdentifier = "pin"
  static let cellIdentifier = "cell"

}

let typesValues = ["Food","Hotel","Hospital","Restaurant"]
//let radiusValues = ["200","300","400","500"]
let yPosition = 194
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

enum Categories: String {
  case types = "types"
  case radius = "radius"
}

struct QueryParamKeys {
  static let location = "location"
  static let radius = "radius"
  static let types = "types"
  static let key = "key"
  static let name = "name"
}

enum radius: String {
  case radius1 = "1000"
  case radius2 = "2000"
  case radius3 = "3000"

}











