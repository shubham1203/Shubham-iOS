//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Shubham on 30/09/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var resultValue: String?
    var tipAmount: String = "0%"
    var splitMembers: String = "2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = resultValue
        descriptionLabel.text = "Split between \(splitMembers) people, with \(tipAmount) tip"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

    */

}
