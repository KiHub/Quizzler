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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain(
    )
    
    
    
    
    //var questionNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        //questionLabel.text = quiz[1]
        // Do any additional setup after loading the view.
        progressBar.progress = 0
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return  }
        //let actualAnswer = quiz[questionNumber].answer
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
           // progressBar.progress += 0.1
        } else {
            sender.backgroundColor = UIColor.red
          //  progressBar.progress -= 0.1
        }
        
        quizBrain.nextQuestion()
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:
        #selector(updateUI), userInfo: nil, repeats: false)
        
        if progressBar.progress == 1 {
            progressBar.progressTintColor = UIColor.purple
        }
    }
    
    @objc func updateUI()  {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
       
    }
}

