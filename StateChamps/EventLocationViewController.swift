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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        setupEventLocationMap()
        
        for i in 0..<eventLocations.count {
            let location = MKPointAnnotation()
            location.coordinate = eventLocations[i].eventLocationCoordinates
            location.title = String("\(eventLocations[i].locationName)\n\(eventLocations[i].eventDescription)")

            collectionOfLocations.append(location)
        }
        eventLocationMap.addAnnotations(collectionOfLocations)
    }
    
    
    
    func setupEventLocationMap() {
        let startLocation = CLLocationCoordinate2D(latitude: 42.335879, longitude: -83.049745)
        let span = MKCoordinateSpanMake(0.45, 0.45)
        let region = MKCoordinateRegion(center: startLocation, span: span)
        eventLocationMap.setRegion(region, animated: false)
    }

}
