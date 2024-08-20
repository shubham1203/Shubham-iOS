//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
//    var leftDiceIndex = 0
//    var rightDiceIndex = 5
    let diceImageArray = [
        UIImage(imageLiteralResourceName: "DiceOne"),
        UIImage(imageLiteralResourceName: "DiceTwo"),
        UIImage(imageLiteralResourceName: "DiceThree"),
        UIImage(imageLiteralResourceName: "DiceFour"),
        UIImage(imageLiteralResourceName: "DiceFive"),
        UIImage(imageLiteralResourceName: "DiceSix")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Button is tapped")
        
//        diceImageViewOne.image = diceImageArray[leftDiceIndex]
//        diceImageViewTwo.image = diceImageArray[rightDiceIndex]
//
//        leftDiceIndex = Int.random(in: 0...5)
//        rightDiceIndex = Int.random(in: 0...5)
        
        diceImageViewOne.image = diceImageArray.randomElement() //pick random element from array instead of declaring indexes and then passing random funtion
        diceImageViewTwo.image = diceImageArray.randomElement()
                
    }


}
