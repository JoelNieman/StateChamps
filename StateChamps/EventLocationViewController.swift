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
import Parse

class EventLocationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {

    @IBOutlet weak var eventLocationMap: MKMapView!
    
    let locationManager = CLLocationManager()
    var collectionOfLocations = [MKAnnotation]()
    
    var eventLatitude: Double!
    var eventLongitude: Double!
    var locationName: String!
    var dateAndTime: String!
    var eventDescription: String!
    
    var eventLocationCoordinates: CLLocationCoordinate2D  {
        get {
            return CLLocationCoordinate2DMake(eventLatitude, eventLongitude)
        }
    }
    
    //  standard mapview set-up in viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setupEventLocationMap()
        queryParseForLocations()
        
    }

    //  SetupEventLocationMap sets the default location to Grand Circus for simulation.
    //  Will need to be updated to user's current location before deploying.
    
    func setupEventLocationMap() {
        let startLocation = CLLocationCoordinate2D(latitude: 42.335879, longitude: -83.049745)
        let span = MKCoordinateSpanMake(0.45, 0.45)
        let region = MKCoordinateRegion(center: startLocation, span: span)
        eventLocationMap.setRegion(region, animated: false)
    }
    
    func queryParseForLocations() {
        var query = PFQuery(className:"EventLocation")
        query.whereKey("eventLatitude", greaterThan: 0)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
    
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) objects.")
                // Create a MKPointAnnotation for every EventLocation object, append the collection, and place a pin on the map.
                if let objects = objects {
                    for object in objects {
                        self.eventLatitude = object.valueForKey("eventLatitude") as! Double
                        self.eventLongitude = object.valueForKey("eventLongitude") as! Double
                        self.locationName = object.valueForKey("locationName") as! String
                        self.dateAndTime = object.valueForKey("dateAndTime") as! String
                        self.eventDescription = object.valueForKey("eventDescription") as! String

                        let location = MKPointAnnotation()
                        location.coordinate = self.eventLocationCoordinates
                        location.title = self.locationName
                        location.subtitle = String("\(self.eventDescription): \(self.dateAndTime)")
                        
                        self.collectionOfLocations.append(location)
                        
                        var event = 1
                        print("\(self.eventLocationCoordinates) are the event coordinates for event \(event)")
                        event++
                    }
                    self.eventLocationMap.addAnnotations(self.collectionOfLocations)
                }
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
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
