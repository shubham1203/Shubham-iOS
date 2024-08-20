//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    let weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //reference to textField param instead of searchTextField allows us to refer all textfields calling this, not only searchtextfield
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something!!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        print(searchTextField.text!)
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        } else {
            print("Unable to fetch weather")
        }
        searchTextField.text = ""
        searchTextField.placeholder = "Search"
    }
    
    
}

