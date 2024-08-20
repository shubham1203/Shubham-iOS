//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroTipButton: UIButton!
    @IBOutlet weak var tenTipButton: UIButton!
    @IBOutlet weak var twentyTipButton: UIButton!
    @IBOutlet weak var splitCountLabel: UILabel!
    @IBOutlet weak var amountField: UITextField!
    

    var calculatorBrain = CalculatorBrain()
    var amountShare: Float?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        zeroTipButton.isSelected = false
//        tenTipButton.isSelected = false
//        twentyTipButton.isSelected = false
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        calculatorBrain.splitMembers = Float(sender.value)
        splitCountLabel.text = String(format: "%0.0f", calculatorBrain.splitMembers)
//        calculatorBrain.shareAmount?.splitMembers = Float(splitCountLabel.text!) ?? 1.0
    }

    
    @IBAction func tipChanged(_ sender: UIButton) {
        calculatorBrain.tipAmount = calculatorBrain.getTipFromLabel(zeroTip: zeroTipButton, tenTip: tenTipButton, twentyTip: twentyTipButton)
        calculatorBrain.tipPercent = (sender.titleLabel?.text) ?? "0%"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.billAmount = Float(amountField.text ?? "0.0") ?? 0.0
        amountShare = calculatorBrain.calculateShare()
        print(amountShare ?? 0.0)
        
        performSegue(withIdentifier: "getResultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getResultSegue" {
            let resultVC = segue.destination as! ResultViewController
            resultVC.resultValue = String(format: "%0.2f", amountShare ?? 0.0)
            resultVC.tipAmount = calculatorBrain.tipPercent
            resultVC.splitMembers = String(format: "%0.0f", calculatorBrain.splitMembers)
        }
    }
}

