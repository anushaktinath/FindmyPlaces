//
//  MapViewController.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit
import MapKit
import AddressBook


class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  var filterResults: [SearchResult] = []
  var result:  [SearchResult] = []
  fileprivate var mapChangedFromUserInteraction = false

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    mapView.showsUserLocation = true
  }
  
  func finishedReceivingData(results: [SearchResult]?) {
    if mapView.annotations.count > 0 {
      let allAnnotations = mapView.annotations
      DispatchQueue.main.async {
        self.mapView.removeAnnotations(allAnnotations)
      }
    }
    
    guard let result = results else {
      return
    }

    for places in result {
      DispatchQueue.main.async {
        let location = CLLocationCoordinate2D(latitude: places.lat!,longitude: places.long!)
        
        let place = MapPoint(name: places.name!, address: places.vicinity!, coordinate: location)
        //since this method is been called form content controller update must be done on main thread
        self.mapView.addAnnotation(place)
        
      }
    }
    
  }
  
  fileprivate func mapViewRegionDidChangeFromUserInteraction() -> Bool {
    let view = self.mapView.subviews[0]
    if let gestureRecognizers = view.gestureRecognizers {
      for recognizer in gestureRecognizers {
        if( recognizer.state == UIGestureRecognizerState.began || recognizer.state == UIGestureRecognizerState.ended ) {
          return true
        }
      }
    }
    return false
  }

  
}


extension MapViewController: MKMapViewDelegate{
  
  
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    if let annotation = annotation as? MapPoint {
      let identifier = Identfiers.pinIdentifier
      var view: MKPinAnnotationView
      if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        as? MKPinAnnotationView {
        dequeuedView.annotation = annotation
        view = dequeuedView
      } else {
        
        view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)as UIView
      }
      return view
    }
    return nil
  }
  
  
  func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
    // this is where visible maprect should be set
    mapView.showAnnotations(mapView.annotations, animated: true)
  }
  
 /*
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    let mRect = mapView.visibleMapRect
    let eastMapPoint: MKMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect))
    let westMapPoint: MKMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect))
    //Set our current distance instance variable.
    LocationManager.shared.radius = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint)
    //Set our current centre point on the map instance variable.
    LocationManager.shared.currentCentre = mapView.centerCoordinate
  }
 */
  
  /*
   func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
   //Get the center point of the visible map.
   let centre = mapView.centerCoordinate
   var region: MKCoordinateRegion!
   //guard let radius =  LocationManager.shared.radius else {
   //return
   //}
   
   guard let isfirstLaunch =  LocationManager.shared.firstLaunch else {
   return
   }
   
    guard let currentLocation =  LocationManager.shared.currentLocation else {
      return
    }
   
   if isfirstLaunch {
   region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 10000, 10000)
    LocationManager.shared.firstLaunch = false

   }else{
   region = MKCoordinateRegionMakeWithDistance(centre,10000,10000)
   
   }
   mapView.setRegion(region, animated: true)
   
   }
 */
 
  
}





