//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = ["Soft": 5, "Medium": 8, "Hard": 12]
    var totalTime: Float = 0.0
    var secondsPassed: Float = 0.0
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        progressBar.isHidden = true
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        secondsPassed = 0
        timer.invalidate()
        progressBar.isHidden = false
        progressBar.progress = 0
        let hardness = sender.currentTitle!
        totalTime = Float(eggTime[hardness]!)
        
//        if hardness == "Soft" {
//            print(softTime)
//        }
//        if hardness == "Medium" {
//            print(mediumTime)
//        }
//        if hardness == "Hard" {
//            print(hardTime)
//        }
        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed <= totalTime {
            secondsPassed += 1
            let progress = secondsPassed/totalTime
//            progressBar.progress = progress
            progressBar.setProgress(progress, animated: true) //for animated progress bar
        }
        else if secondsPassed > totalTime {
            timer.invalidate()
            titleLabel.text = "Done"
            progressBar.progress = 1.0
            playAlarm()
        }
    }
    
    func playAlarm() { //
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }

}
