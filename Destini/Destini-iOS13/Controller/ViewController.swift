//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()//extract key from single dictionary
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let choiceSelected = sender.titleLabel!
        if sender == choice1Button {
//            print(choiceSelected.text!)
            index = 0
        }
        else{
//            print(choiceSelected.text!)
            index = 1
        }
        storyBrain.getNextStory(nextPointer: Array(storyBrain.currentStory().choices)[index].value)
        print(Array(storyBrain.currentStory().choices)[index].key)
        print(Array(storyBrain.currentStory().choices)[index].value)
//        storyBrain.getNextStory()
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.currentStory().title
        choice1Button.setTitle(Array(storyBrain.currentStory().choices)[0].key, for: .normal)
        choice2Button.setTitle(Array(storyBrain.currentStory().choices)[1].key, for: .normal)
    }
    
}

