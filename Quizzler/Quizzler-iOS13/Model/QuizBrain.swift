//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Shubham on 17/09/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var scoreCount = 0
    
    /* 2D Array Approach
    let quiz = [
        ["Four + Two equals Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
    ] */
    
    //Struct approach
    let quiz = [
        Question(question: "Which is the largest organ in the human body?", choices: ["Heart", "Skin", "Large Intestine"], answer: "Skin"),
        Question(question: "Five dollars is worth how many nickels?", choices: ["25", "50", "100"], answer: "100"),
        Question(question: "What do the letters in the GMT time zone stand for?", choices: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], answer: "Greenwich Mean Time"),
        Question(question: "What is the French word for 'hat'?", choices: ["Chapeau", "Écharpe", "Bonnet"], answer: "Chapeau"),
        Question(question: "In past times, what would a gentleman keep in his fob pocket?", choices: ["Notebook", "Handkerchief", "Watch"], answer: "Watch"),
        Question(question: "How would one say goodbye in Spanish?", choices: ["Au Revoir", "Adiós", "Salir"], answer: "Adiós"),
        Question(question: "Which of these colours is NOT featured in the logo for Google?", choices: ["Green", "Orange", "Blue"], answer: "Orange"),
        Question(question: "What alcoholic drink is made from molasses?", choices: ["Rum", "Whisky", "Gin"], answer: "Rum"),
        Question(question: "What type of animal was Harambe?", choices: ["Panda", "Gorilla", "Crocodile"], answer: "Gorilla"),
        Question(question: "Where is Tasmania located?", choices: ["Indonesia", "Australia", "Scotland"], answer: "Australia")
        ]

    
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            scoreCount += 1
//            sender.backgroundColor = UIColor.green //Background color of button
            return true
        }
        else{
//            sender.backgroundColor = UIColor.red
            return false
        }
    }
    
    //function to get question to display on label
    func getQuestion() -> String {
        return quiz[questionNumber].question //taking first index of each array for question. QuestionNumber is taken from the value within the struct
    }
    
    //Function to get progressBar
    func getProgress() -> Float {
        let progress = (Float(questionNumber) + 1.0)/Float(quiz.count) //+1 added to match progresBar with conditions for nextQuestion and getScore
        return progress
    }
    
    //Function to get the next question
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
            
        }
        else{
            questionNumber = 0
        }
    }
    
    //Function to set score
    mutating func getScore() -> Int{
        if questionNumber < quiz.count - 1 {
            return scoreCount
            
        }
        else{
            scoreCount = 0
            return scoreCount
        }
    }
    
    func getChoice(choiceNum: Int) -> String {
        return quiz[questionNumber].choices[choiceNum]
    }
}
