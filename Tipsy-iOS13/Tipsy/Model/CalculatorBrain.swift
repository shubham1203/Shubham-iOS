//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Shubham on 29/09/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var billAmount: Float = 0.0
    var tipAmount: Float = 0.0
    var tipPercent: String = "0%"
    var splitMembers: Float = 2.0
    
    mutating func getTipFromLabel (zeroTip: UIButton, tenTip: UIButton, twentyTip: UIButton) -> Float {
        zeroTip.isSelected = false
        tenTip.isSelected = false
        twentyTip.isSelected = false
        
        if zeroTip.isTouchInside {
            tipAmount = 0.0
            zeroTip.isSelected = true
        }
        else if tenTip.isTouchInside {
            tipAmount = 0.1
            tenTip.isSelected = true
        }
        else if twentyTip.isTouchInside {
            tipAmount = 0.2
            twentyTip.isSelected = true
        }
        return tipAmount
    }
    
    mutating func calculateShare() -> Float {
        let shareAmount = (billAmount * (1 + tipAmount)) / splitMembers
        return shareAmount
    }
}
