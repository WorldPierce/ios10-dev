//
//  ViewController.swift
//  weatherApp
//
//  Created by Billy Pierce on 8/13/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit
import CoreLocation //access current location
import Alamofire //access web api's

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var currentWeatherImg: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    //setting up location manager and variable
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather: CurrentWeather!
    var forcast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() //only works when app is open and on screen
        locationManager.startMonitoringSignificantLocationChanges()
        
        //these are needed to start filling table with data
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.lat = currentLocation.coordinate.latitude
            Location.sharedInstance.long = currentLocation.coordinate.longitude
            //once location is established it is safe to call api
            currentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                    self.updateMainUI()
                }
            }
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        //Downloading forecast data for tableview
        let forecastURL = URL(string: FORECAST_URL)!
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            //print(result)
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        
                    }

                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    //must use these 3 functions for UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
        
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTemp.text = "\(currentWeather.currentTemp)°"
        currentWeatherTypeLbl.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImg.image = UIImage(named: currentWeather.weatherType)
    }

    


}

