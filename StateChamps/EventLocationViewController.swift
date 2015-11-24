//
//  EventLocationViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/10/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class EventLocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {

    @IBOutlet weak var eventLocationMap: MKMapView!
    
    let locationManager = CLLocationManager()
    var collectionOfLocations = [MKAnnotation]()
//    var broadcastEventLocation = EventLocations.eventLocation
//    var broadcastEventLocations = [broadcastEventLocation]
    
    //  standard mapview set-up in viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setupEventLocationMap()
        populateCollectionOfLocations()
    }

    //  SetupEventLocationMap sets the default location to Grand Circus for simulation.
    //  Will need to be updated to user's current location before deploying.
    
    func setupEventLocationMap() {
        let startLocation = CLLocationCoordinate2D(latitude: 42.335879, longitude: -83.049745)
        let span = MKCoordinateSpanMake(0.45, 0.45)
        let region = MKCoordinateRegion(center: startLocation, span: span)
        eventLocationMap.setRegion(region, animated: false)
    }
    
    //     For-In loop goes through the eventLocations array in the EventLocations.swift file
    //     and appends a pin for each location into the collectionOfLocations
    
    func populateCollectionOfLocations() {
        for i in 0..<eventLocations.count {
            let location = MKPointAnnotation()
            //            broadcastEventLocation = eventLocations()
            location.coordinate = eventLocations[i].eventLocationCoordinates
            location.title = String("\(eventLocations[i].locationName)")
            //            location.description = String("\(eventLocations[i].eventDescription)")
            
            collectionOfLocations.append(location)
        }
        eventLocationMap.addAnnotations(collectionOfLocations)
    }
    
    

//    // Helper function to load some options in native maps
//    func openInMapsTransit(coordinate: CLLocationCoordinate2D)  {
//        
//        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
//        let mapItem = MKMapItem(placemark: placemark)
////        mapItem.name = collectionOfLocations
//        let launchOptions = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeWalking]
//        mapItem.openInMapsWithLaunchOptions(launchOptions)
//    }
//    
//    // pull parking location and load with options in native maps
//    @IBAction func openAppleMaps(sender: AnyObject) {
//        
////        if let loadedParkingSpot = defaults.dataForKey("parkingSpot") {
////            broadcastEventLocation = NSKeyedUnarchiver.unarchiveObjectWithData(loadedParkingSpot) as? CLLocation {
//                let broadcastEventLocation = CLLocationCoordinate2DMake(broadcastEventLocations.coordinate.latitude, broadcastEventLocations.coordinate.longitude)
//                openInMapsTransit(broadcastEventLocation)
//            }
//        }
//    }
//
//    //map style choices and function to choose them
//    enum MapType: Int {
//        case Standard = 0
//        case Satellite
//    }
//    
//    @IBAction func updateMapStyle(sender: AnyObject) {
//        let mapType = MapType(rawValue: mapStyleChoices.selectedSegmentIndex)
//        switch (mapType!) {
//        case .Standard:
//            mapView.mapType = MKMapType.Standard
//        case .Satellite:
//            mapView.mapType = MKMapType.Satellite
//        }
//    }
}
