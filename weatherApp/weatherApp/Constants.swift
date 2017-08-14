//
//  Constants.swift
//  weatherApp
//
//  Created by Billy Pierce on 8/14/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "3aeaea2c919b65947746f342180fef34"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.lat!)\(LONGITUDE)\(Location.sharedInstance.long!)\(APP_ID)\(API_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.lat!)&lon=\(Location.sharedInstance.long!)&cnt=&appid=3aeaea2c919b65947746f342180fef34"
