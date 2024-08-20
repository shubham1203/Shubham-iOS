//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var scoreDisplay: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var choiceOne: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green //Background color of button
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil,  repeats: false) //Method 1 to add delay
        
//        updateUI() Method 2
        quizBrain.nextQuestion()

    }
    
    
//    func updateUI(){ //Method 2
//        if(questionNumber < quiz.count){
//            questionLabel.text = quiz[questionNumber].question //taking first index of each array for question
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){ //Method 2 to add delay
//                self.trueButton.backgroundColor = UIColor.clear
//                self.falseButton.backgroundColor = UIColor.clear
//            }
//        }
//
//    }
    
    @objc func updateUI(){ //Method 1
        questionLabel.text = quizBrain.getQuestion()
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        scoreDisplay.text = "Score \(quizBrain.getScore())"
        choiceOne.backgroundColor = UIColor.clear
        choiceTwo.backgroundColor = UIColor.clear
        choiceThree.backgroundColor = UIColor.clear
        choiceOne.setTitle(quizBrain.getChoice(choiceNum: 0), for: .normal)
        choiceTwo.setTitle(quizBrain.getChoice(choiceNum: 1), for: .normal)
        choiceThree.setTitle(quizBrain.getChoice(choiceNum: 2), for: .normal)
        }
    }

