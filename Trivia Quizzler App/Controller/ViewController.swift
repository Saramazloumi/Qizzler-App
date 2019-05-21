

import UIKit

class ViewController: UIViewController {
    
    var allQuestions = Questionbank()
    var userAnswer : Bool = false
    var questionNumber : Int = 0
    var progression : Int = 1
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var scoreLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = allQuestions.list[0].questionText
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            userAnswer = true
        }else {
            userAnswer = false
        }
        //checkAnswer()
        updateProgressLabel()
        updateScore()
        questionNumber += 1
        questionLabel.text = allQuestions.list[questionNumber].questionText
        
    }
    
    func checkAnswer() -> Bool{
        if userAnswer == allQuestions.list[questionNumber].answer {
            print("You got it!")
            return true
        }else{
            print("Wrong!")
            return false
        }
    }
    
    func updateProgressLabel(){
        progression += 1
        progressLabel.text = "\(progression)/15"
    }
    

    func updateScore(){
        if checkAnswer() {
            scoreLabel.text = String (score + 10)
        }
    }

}

