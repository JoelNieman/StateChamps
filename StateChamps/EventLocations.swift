//
//  EventLocations.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/10/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import Foundation
import CoreLocation

struct EventLocation {
    var locationName     = String()
    var dateAndTime      = String()
    var eventDescription = String()
    
    var eventLatitude    = CLLocationDegrees()
    var eventLongitude   = CLLocationDegrees()
    
    var eventLocationCoordinates: CLLocationCoordinate2D  {
        get {
            return CLLocationCoordinate2DMake(eventLatitude, eventLongitude)
        }
    }
}

let location1 = EventLocation(locationName: "Cass Technical High School",
    dateAndTime: "November 13th: 7pm",
    eventDescription: "The Cass Tech Technicians football team has a neutral playoff game vs. The Dakota Cougars",
    eventLatitude: 42.338606,
    eventLongitude: -83.059981)

let location2 = EventLocation(locationName: "Allen Park High School",
    dateAndTime: "November 13th: 7pm",
    eventDescription: "The Allen Park Jaguars football team has a neutral playoff game vs. The Chelsea Bulldogs",
    eventLatitude: 42.248952,
    eventLongitude: -83.227267)

let location3 = EventLocation(locationName: "Detroit Martin Luther King High School",
    dateAndTime: "November 14th: 1pm",
    eventDescription: "The Detroit Martin Luther King Crusaders football team has a neutral playoff game vs. Detroit East English Bulldogs",
    eventLatitude: 42.343800,
    eventLongitude: -83.016306)

let location4 = EventLocation(locationName: "Berkley High School",
    dateAndTime: "November 13th: 7pm",
    eventDescription: "The Berkley Bears football team has a neutral playoff game vs. Livonia Franklin Patriots",
    eventLatitude: 42.495668,
    eventLongitude: -83.180513)

let eventLocations = [location1,location2,location3,location4]

