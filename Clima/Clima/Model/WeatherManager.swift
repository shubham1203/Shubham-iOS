//
//  WeatherManager.swift
//  Clima
//
//  Created by Shubham on 10/10/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=f07615c08ddc74f59dc580378dd872ca&units=metric"
    
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    //This function denotes creation of a URLSession and the task started by it
    func performRequest(urlString: String){
//        1. Create the URL
        if let url = URL(string: urlString){
            
//        2. Create URLSession
            let session = URLSession(configuration: .default)
            
//        3. Give a task to the Session
//            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            //task provided to session, the completionHandler function is used to define what happens when the task is complete -> data or error scenarios
            //We can also utlize closures to handle the completionHandler method within this call as below
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("Error")
                    return
                }
                
                //Safe unwrapping the data received in the session and converting it into UTF-8 string
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8) Used only to print strings
                    self.parseJSON(weatherData: safeData)
                }
            }
            
//        4. Start the task
            task.resume()
            //resume is used instead of start since newly initialized tasks start in suspended states only
        }
    }
    
    //Create handler functions to be passed onto the above task -> Not required in case of closures
//    func handle(data: Data?, response: URLResponse?, error: Error?) -> Void {
//        if error != nil {
//            print("Error")
//            return
//        }
//        
//        //Safe unwrapping the data received in the session and converting it into UTF-8 string
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//    }
    
    func parseJSON(weatherData: Data){
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData) //Moved into do try catch to remove error
            let cityName = decodedData.name
            let temp = decodedData.main.temp
            let description = decodedData.weather[0].description
            let weatherId = decodedData.weather[0].id
            
            let weather = WeatherModel(cityName: cityName, weatherId: weatherId, tempDefault: temp)
            print(weather.weatherName)
            print(weather.tempValue)
        } catch {
            print(error)
        }
        
    }
}
