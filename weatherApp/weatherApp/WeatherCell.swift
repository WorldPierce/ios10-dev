//
//  WeatherCell.swift
//  weatherApp
//
//  Created by Billy Pierce on 8/14/17.
//  Copyright © 2017 Billy Pierce. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    func configureCell(forecast: Forecast) {
        lowTemp.text = "\(forecast.lowTemp)°"
        highTemp.text = "\(forecast.highTemp)°"
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLbl.text = forecast.date
    }

    

}
