//
//  LocationManager.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/15/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
  
  static let shared = LocationManager()
  var locationManager: CLLocationManager?
  var radius: CLLocationDistance!
  var firstLaunch: Bool!
  var results: [SearchResult]?
  var currentLocation: CLLocation!
  var selectedCategory: [String] = []
  var currentCentre: CLLocationCoordinate2D!


  func initLocationManager() {
    //Instantiate a location object.
    locationManager = CLLocationManager()
    locationManager?.distanceFilter = kCLDistanceFilterNone
    locationManager?.desiredAccuracy = kCLLocationAccuracyBest
    locationManager?.requestAlwaysAuthorization()
    locationManager?.requestWhenInUseAuthorization()
    firstLaunch=true
    checkForAuthorization()
  }
  
  func checkForAuthorization() {
    if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) || (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse){
      
      guard let locationManager = locationManager else {
        return
      }
      currentLocation = locationManager.location
    }

  }
  
  func getLatLong() -> String {
    guard let currentLocation = currentLocation else{
      return ""
    }
    return "\(currentLocation.coordinate.latitude),\(currentLocation.coordinate.longitude)"
  }
  
  func storeSearchResults(googleResults: GoogleSearchResults) {
    self.results = googleResults.searchResults
  }
  
  func getResults() -> [SearchResult]? {
    return self.results
  }
  
  var defaultKeyValue: [String: Any] = [QueryParamKeys.key: GOOGLE_API_KEY,
                                        QueryParamKeys.types: defaultTypes,
                                        QueryParamKeys.radius: defaultRadius
                                        ]
  
}
