//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Shubham on 23/09/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: ViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground //since bgColor expects UIColor type, we need not add UIColor.colorname, .colorname is enough
        
        let label = UILabel()
        label.text = bmiValue
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50) //label must be provided with a frame to specify it's start, end, dimensions and so on
        view.addSubview(label) //lebel added in the view -> label(UILabel) is accepted as an argument where UIView was expected since it's parent class is UIView
    }
    
}
