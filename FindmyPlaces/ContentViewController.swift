//
//  ViewController.swift
//  FindmyPlaces
//
//  Created by Mishra, Anu (US - Mumbai) on 9/14/17.
//  Copyright © 2017 Mishra, Anu (US - Mumbai). All rights reserved.
//

import UIKit
import MapKit

class ContentViewController: UIViewController {
  
  private var loadingView: LoadingView!
  @IBOutlet weak var typesButton: UIButton!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var heightConstant: NSLayoutConstraint!
  @IBOutlet weak var searchBar: UISearchBar!
  var filterResult:  [SearchResult] = []
  var customSearchController: CustomSearchController!
  var placeVC: PlacesListViewController?
  var isSearching : Bool = false
  @IBOutlet weak var radiusButton1: UIButton!
  @IBOutlet weak var radiusButton2: UIButton!
  @IBOutlet weak var radiusButton3: UIButton!
  var radiusButton1Selected : Bool = false
  var radiusButton2Selected : Bool = false
  var radiusButton3Selected : Bool = false
  var popupVC: UIViewController!
  @IBOutlet weak var typeIcon: UIImageView!
  @IBOutlet weak var detailView: UIView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    LocationManager.shared.initLocationManager()
    guard let locationManager = LocationManager.shared.locationManager else {
        return
    }
    locationManager.delegate = self
    DispatchQueue.main.async {
        locationManager.startUpdatingLocation()
    }
    loadingView = LoadingView()
    mapView.delegate = self
    mapView.showsUserLocation = true
    searchBar.delegate = self
    searchBar.searchBarStyle = .minimal
    searchBar.barTintColor = .black
    searchBar.tintColor = .black
    typesButton.styleView()
    radiusButton1.styleView()
    radiusButton2.styleView()
    radiusButton3.styleView()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)
  }

  
  func fetchPlaces(types: String,radius: String,name: String) {
    var dictonary = LocationManager.shared.defaultKeyValue as! [String : String]
    dictonary[QueryParamKeys.location] = LocationManager.shared.getLatLong()
    if radius != "" {
          dictonary[QueryParamKeys.radius] = radius
    }else if types != ""{
          dictonary[QueryParamKeys.types] = types
    }else if name != ""{
          dictonary[QueryParamKeys.name] = name
          dictonary[QueryParamKeys.types] = ""
      LocationManager.shared.selectedCategory.removeAll()
      typesButton.setTitle(selectCategoryString, for: .normal)
    }
    let paramString = dictonary.stringFromHttpParameters()
    fetchResult(postString: paramString)
    dictonary.removeValue(forKey: QueryParamKeys.name)
    LocationManager.shared.defaultKeyValue = dictonary

    
  }
  
   func fetchResult(postString: String)  {
    DispatchQueue.main.async {
      self.loadingView.showActivityIndicator(uiView: self.view)
    }
    _ =  FetchPlaces(postString:postString, parseHandler: { (result) in
      LocationManager.shared.storeSearchResults(googleResults: result)
      self.finishedReceivingData(results: result.searchResults)
      if self.isSearching{
        guard let vc = self.placeVC else{
          return
        }
        vc.finishedReceivingData(results: result.searchResults)
      }
      DispatchQueue.main.async {
        self.loadingView.hideActivityIndicator(uiView: self.view)
      }
      
    },
                     failure: {error in
                      print(error.localizedDescription)
                      DispatchQueue.main.async {
                        self.loadingView.hideActivityIndicator(uiView: self.view)
                      }
                      
    })
    
  }
  
  
  @IBAction func radius1000ButtonClicked(sender: UIButton){
    let selectedTypes = LocationManager.shared.selectedCategory
    if selectedTypes.count > 0{
      radiusButton1Selected = !radiusButton1Selected
      if radiusButton1Selected{
      fetchPlaces(types: "", radius: radius.radius1.rawValue, name: "")
      radiusButton1.highlightedState()
      radiusButton2.disabledState()
      radiusButton3.disabledState()
      radiusButton2Selected = false
      radiusButton3Selected = false
      }else{
        radiusButton1.disabledState()
      }

    }
    }
  
  
  @IBAction func radius1000to2000ButtonClicked(sender: UIButton){
    let selectedTypes = LocationManager.shared.selectedCategory
    if selectedTypes.count > 0{
      radiusButton2Selected = !radiusButton2Selected
      if radiusButton2Selected{
      fetchPlaces(types: "", radius: radius.radius2.rawValue, name: "")
      radiusButton2.highlightedState()
      radiusButton3.disabledState()
      radiusButton1.disabledState()
      radiusButton1Selected = false
      radiusButton3Selected = false
      }else{
        radiusButton2.disabledState()
      }

    }
  }
  
  @IBAction func radius3000ButtonClicked(sender: UIButton){
    let selectedTypes = LocationManager.shared.selectedCategory
    if selectedTypes.count > 0{
      radiusButton3Selected = !radiusButton3Selected
      if radiusButton3Selected{
      fetchPlaces(types: "", radius: radius.radius3.rawValue, name: "")
      radiusButton3.highlightedState()
      radiusButton2.disabledState()
      radiusButton1.disabledState()
      radiusButton1Selected = false
      radiusButton2Selected = false
      }else{
        radiusButton3.disabledState()
      }
    }
  }
  
  func initialisePopOverController() {
    let pickerController = PickerController(item: nil, rowValues: nil)
    let controller = pickerController.buildPlacesViewController()
    let pop = PopoverController(delegate: self,sender:searchBar,vc:controller)
    popupVC = pop.buildPopOver()
    placeVC = controller as? PlacesListViewController
    placeVC?.delegate = self
    self.present(popupVC, animated: true, completion: nil)
  }
  
  @IBAction func typesButtonClicked(sender: UIButton){
    
    let pickerController = PickerController(item: Categories.types.rawValue, rowValues: typesValues)
    let controller = pickerController.buildPickerViewController()
    let pop = PopoverController(delegate: self,sender:sender,vc:controller)
    let popVC = pop.buildPopOver()
    self.present(popVC, animated: true, completion: nil)

  }
  
  func removeAnnotations() {
    if mapView.annotations.count > 0 {
      let region = MKCoordinateRegionMakeWithDistance(mapView.centerCoordinate, 10000, 10000)
      let allAnnotations = mapView.annotations
      DispatchQueue.main.async {
        self.mapView.setRegion(self.mapView.regionThatFits(region), animated: true)
        self.mapView.removeAnnotations(allAnnotations)
      }
    }
  }
  
  func clearSearch() {
    searchBar.text = ""
    self.view.endEditing(true)
    searchBar.showsCancelButton = false
  }
  
  func finishedReceivingData(results: [SearchResult]?) {
    removeAnnotations()
    guard let result = results else {
      return
    }
    filterResult = result
    for places in result {
      guard let lat = places.lat else{
        return
      }
      guard let long = places.long else{
        return
      }
      DispatchQueue.main.async {
        
        let location = CLLocationCoordinate2D(latitude: lat,longitude: long)
        
        let place = MapPoint(name: places.name!, address: places.vicinity!, coordinate: location,icon: places.icon!)
        //since this method is been called form content controller update must be done on main thread
        self.mapView.addAnnotation(place)
        
      }
    }
  
  }
    
}

extension ContentViewController: MKMapViewDelegate{
  
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
    print(mapView.annotations.count)
    if mapView.annotations.count <= 1{
        mapView.showAnnotations(mapView.annotations, animated: true)
    }
  }
  
  }
  


extension ContentViewController: PlacesListViewControllerDelegate{
  
  func didFinish(_ controller: PlacesListViewController, place: SearchResult) {
    var selectedPlace: [SearchResult] = []
    selectedPlace.append(place)
    finishedReceivingData(results: selectedPlace)
    self.clearSearch()
  }
  
}


