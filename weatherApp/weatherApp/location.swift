//
//  location.swift
//  weatherApp
//
//  Created by Billy Pierce on 8/14/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//


import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var lat: Double!
    var long: Double!
}
