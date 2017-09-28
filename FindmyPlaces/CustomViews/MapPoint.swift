//
//  MapPoint.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/18/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit
import MapKit


class MapPoint:NSObject, MKAnnotation  {
  var coordinate: CLLocationCoordinate2D
  var title: String?
  var subtitle: String?
  var icon: String?

  init(name: String, address: String, coordinate: CLLocationCoordinate2D,icon: String) {
    self.title = name
    self.subtitle = address
    self.coordinate = coordinate
    self.icon = icon

  }

}
