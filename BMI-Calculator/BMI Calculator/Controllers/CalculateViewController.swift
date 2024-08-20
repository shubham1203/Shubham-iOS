//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
//    Declare Global values OR we can reference the values using the outlet directly
//    var height: Float = 0.0
//    var weight: Float = 0.0
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bodyMassIndex: Float = 0.0
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //Method 1 to round off
        let height = round(sender.value * 100) / 100.0
        heightLabel.text = String("\(height)m")
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //Method 2: String(format: "%.0f", sender.value) -> to round off [%.xf -> x number of digits to round off]
        let weight = sender.value
        weightLabel.text = "\(Int(weight))Kg"
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //BMI Calculation
        calculatorBrain.calculateBMI(height: height, weight: weight)
        print(calculatorBrain.bodyMassIndex?.advice ?? "")
        
        //Perform action defined in segue
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
        //Invoke via present
//        let resultVC = ResultViewController()
//        resultVC.bmiValue = String(format: "%0.1f", bodyMassIndex) //Passing value from current view to second VC using property raised in secondVC
//        present(resultVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.bgColor = calculatorBrain.getBackgroundColor()
        }

    }
    

}

