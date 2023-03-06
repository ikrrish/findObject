//
//  Gamepage.swift
//  findObject
//
//  Created by R82 on 28/02/23.
//

import UIKit

class GamePage: UIViewController {

    var firstNumber = 0
    var secondNumber = 0
    var difficulty = 100
    var score = 0
    var highScore = UserDefaults.standard.integer(forKey: "highScore")

    @IBOutlet weak var labelOfScore: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var labelOfOperator: UILabel!
    @IBOutlet weak var labelOfAnswers: UILabel!
    @IBOutlet weak var progressField: UIProgressView!
    var time = Timer()
    var freq = 0.10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        labelOfScore.text = "\(score)"
        labelOfScore.layer.cornerRadius = 49
        labelOfScore.layer.masksToBounds = true
        labelOfScore.textColor = .black
        progressField.progress = 1.0
        timeOfProgress()
        generated()
        labelOfOperator.text = "?"
        labelOfOperator.textColor = .red
        labelOfAnswers.textColor = .blue
        UserDefaults.standard.set(score, forKey: "score")
    }
    
    func timeOfProgress(){
        var a = 1.0
        time = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { i in
            a -= 0.01
            self.progressField.progress = Float(a)
            if self.progressField.progress == 0.0{
                self.time.invalidate()
                self.gameover()
                self.alert(score: self.score, highScore: self.highScore)
                self.score = 0
             
            }})
    }

    func generated(){
        firstNumber = Int.random(in: 30...599)
        secondNumber = Int.random(in: 75...250)
        label1.text = "\(firstNumber)"
        label2.text = "\(secondNumber)"
             let plus = firstNumber + secondNumber
             let minus = firstNumber - secondNumber
             let multi = firstNumber * secondNumber
             let divide = firstNumber / secondNumber
             var array = [plus,multi,minus,divide]
             var question = array.randomElement()
             var answer = question
             labelOfAnswers.text = "\(answer!)"
    }

    @IBAction func plusButton(_ sender: UIButton){
        
        if labelOfAnswers.text == "\(firstNumber + secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
            
        }
            else
                {
                    time.invalidate()
                    gameover()
                    alert(score:score,highScore:highScore)
                    score = 0
                 
                }
        
        
    }
    @IBAction func multiButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber * secondNumber)"{
            time.invalidate()
            score+=1
            setup()
           
        }
        else{
            time.invalidate()
            gameover()
            alert(score:score,highScore:highScore)
            score = 0
  

        }
        
    }
    @IBAction func divideButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber / secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
        }
        else{
            time.invalidate()
            gameover()
            alert(score:score,highScore:highScore)
            score = 0
    

        }
        
    }
    @IBAction func minusButton(_ sender: UIButton){
        if labelOfAnswers.text == "\(firstNumber - secondNumber)"{
            time.invalidate()
            score+=1
            labelOfScore.text = "\(score)"
            setup()
            
        }
        else{
            time.invalidate()
            gameover()
            alert(score:score,highScore:highScore)
            score = 0
        
        }
        
    }

    func alert(score:Int,highScore:Int){
        let alert = UIAlertController.init(title: "GAME OVER", message: "\nScore = \(score) \n\nHighScore = \(highScore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "HOME", style: .default, handler: {i in self.navigateToHome()}))
        alert.addAction(UIAlertAction.init(title: "RETRY", style: .default, handler: {i in self.navigateToRetry()}))
        present(alert, animated: true, completion: nil)
        
    }
    func gameover(){
        if  score > highScore{
            highScore = score
            UserDefaults.standard.set(score, forKey: "highScore")
        }
    }
    func navigateToHome(){
           let nv = storyboard?.instantiateViewController(withIdentifier: "Modepage") as! Modepage
           navigationController?.popViewController(animated: true)
       }
       func navigateToRetry(){
           setup()
       }
    
    
}
