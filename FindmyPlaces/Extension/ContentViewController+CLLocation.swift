 //
//  ContentViewController+CLLocation.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/21/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import Foundation
import CoreLocation
import MapKit


extension ContentViewController: CLLocationManagerDelegate{
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let userLocation:CLLocation = locations[0]
    
    // Call stopUpdatingLocation() to stop listening for location updates,
    // other wise this function will be called every time when user location changes.
    
    if  (LocationManager.shared.currentLocation != nil) {
       manager.stopUpdatingLocation()
    }
    LocationManager.shared.currentLocation = userLocation
   
  }
  
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Error \(error) location fail with error")
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .notDetermined:
      manager.requestAlwaysAuthorization()
      break
    case .authorizedWhenInUse:
      manager.startUpdatingLocation()
      break
    case .authorizedAlways:
        LocationManager.shared.checkForAuthorization()
        DispatchQueue.main.async {
            manager.startUpdatingLocation()
        }
      break
    case .restricted:
      // restricted by e.g. parental controls. User can't enable Location Services
      break
    case .denied:
      // user denied your app access to Location Services, but can grant access from Settings.app
      break
    }
  }
  

}
