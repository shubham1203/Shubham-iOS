//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Shubham on 28/09/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    var bmiValue: String?
    var advice: String?
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice?.capitalized
        view.backgroundColor = bgColor
    }
    


     @IBAction func recalculatePressed(_ sender: UIButton) {
         self.dismiss(animated: true)
     }
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
