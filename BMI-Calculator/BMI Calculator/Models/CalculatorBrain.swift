//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Shubham on 29/09/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bodyMassIndex: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) { 
        let bodyMassIndexValue: Float = weight / pow(height, 2)
        if bodyMassIndexValue < 18.5 {
            bodyMassIndex = BMI(bmiValue: bodyMassIndexValue, advice: "eat more food!!", bgColor: UIColor.systemTeal)
        }
        else if bodyMassIndexValue < 25 {
            bodyMassIndex = BMI(bmiValue: bodyMassIndexValue, advice: "you are fit!!", bgColor: .systemGreen)
        }
        else if bodyMassIndexValue > 25 {
            bodyMassIndex = BMI(bmiValue: bodyMassIndexValue, advice: "you need to run more!!", bgColor: .systemOrange)
        }
        
    }
    
    func getBMIValue() -> String {
        let bmiValue = String(format: "%0.1f", bodyMassIndex?.bmiValue ?? 0.0)
        return bmiValue
    }
    
    func getAdvice() -> String {
        return bodyMassIndex?.advice ?? "No advice"
    }
    
    func getBackgroundColor() -> UIColor {
        return bodyMassIndex?.bgColor ?? .white
    }
}
