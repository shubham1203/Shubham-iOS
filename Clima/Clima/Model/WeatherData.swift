//
//  WeatherData.swift
//  Clima
//
//  Created by Shubham on 22/10/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
