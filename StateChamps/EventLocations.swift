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
