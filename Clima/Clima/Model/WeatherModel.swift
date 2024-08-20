//
//  WeatherModel.swift
//  Clima
//
//  Created by Shubham on 22/10/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let weatherId: Int
    let tempDefault: Double
    
    var weatherName: String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.heavyrain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud"
        default:
            return "icloud.slash"
        }
    }
    
    var tempValue: String {
        return String(format: "%0.1f", tempDefault)
    }
}
