//
//  ViewController.swift
//  Video Game Questions
//
//  Created by Jonathan Rhea on 4/4/21.
//

import UIKit
import SwiftUI
import Foundation

class ViewController: UIViewController {
    
    //link buttons and labels with varaibles
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    //varaibles and arrays needed
    var questionsArray : [String] = []
    var questionOrder = Array(repeating: 0, count: 10)
    var questionLine : [Substring] = []
    var answerArray : [Substring] = ["","","",""]
    var questionCounter = 0
    var correctCoutner = 0
    var correctAnswer : Substring!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true;
        resetButton.isEnabled = false;
        readQuestion()
        setTexts()
 
        // Do any additional setup after loading the view.
    }
    
    func readQuestion(){
        
        //put 0 through 4 in this order array
        //this is needed to randomize the questions later
        for counter in 0...9{
            
            questionOrder[counter] = counter
            
        }//end for
        
        //array of questions
        questionsArray = ["Which Wii game was a launch title and the best selling game for the system?,Wii Sports,The Legend of Zelda: Twilight Princess,Wii Play,Super Mario Galaxy," , "What is Mario's first 3D adventure?,Super Mario 64,Super Mario Sunshine,Mario Party,Mario Tennis," , "Which Pokemon game takes place in the Sinnoh region?,Pokemon Platinum,Pokemon Sword/Shield,Pokemon Heart Gold/Soul Silver,Pokemon Emerald," , "Who is Joker's main persona in Persona 5?,Arsene,Izanagi,Captain Kidd,Carmen," , "Who is Mario trying to save in the original Donkey Kong game?,Pauline,Princess Peach,Princess Daisy,Rosalina," , "What is Shulk's signature weapon in Xenoblade Chronicles?,Monado,The Master Sword,Buster Sword,Aegis Sword," , "How many shrines are there in The Legend of Zelda: Breath of the Wild?,120,150,60,90," , "How many years does Link time travel in The Legend of Zelda: Ocarina of Time?,7,5,12,10," , "What is the only starter Pokemon in Pokemon Yellow?,Pikachu,Bulbasaur,Charmander,Squirtle," , "As of Pokemon Sword and Shield - how many Pokemon are there?,898,756,976,1002,"]
        
        //shuffle the questionOrder array
        //this is how the questions get randomized
        questionOrder.shuffle()
       
        
    
    }//end readQuestions
    
    func setTexts(){
        
        //get a random question by moving through the index of the randomized questionOrder one by one
        questionLine = questionsArray[questionOrder[questionCounter]].split(separator:",")
        
        //first answer listed in questionLine is the correct answer
        correctAnswer = questionLine[1]
         
        //put answers into answerArray
        answerArray[0] = questionLine[1]
        answerArray[1] = questionLine[2]
        answerArray[2] = questionLine[3]
        answerArray[3] = questionLine[4]
        
        //shuffle the answers
        answerArray.shuffle()
        
        //set the question and button texts
        questionLabel.text = String(questionLine[0])
        answerButton1.setTitle(String(answerArray[0]), for: .normal)
        answerButton2.setTitle(String(answerArray[1]), for: .normal)
        answerButton3.setTitle(String(answerArray[2]), for: .normal)
        answerButton4.setTitle(String(answerArray[3]), for: .normal)

        questionCounter+=1
        
        
    }//end setTexts
    
    func endGame(){
        
        resultLabel.text = "You got all the questions right!"
        resultLabel.textColor = UIColor.green
        resetButton.isHidden = false;
        resetButton.isEnabled = true;
        
    }//end endGame
    
    func reset(){
        
        questionCounter = 0
        correctCoutner = 0
        resultLabel.text = " "
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
        answerButton4.isEnabled = true
        readQuestion()
        setTexts()
    }//end reset

    //methods for all 4 buttons are the same
    //they just correspond to the different buttons
    @IBAction func answer1Button(_ sender: Any) {
        //if correct, display correct and disable buttons
        if(answerArray[0] == correctAnswer){
            self.resultLabel.text = "Correct!"
            resultLabel.textColor = UIColor.green
            correctCoutner+=1
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            //set a three second delay, then get another question
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = " "
                if(self.correctCoutner == 10){
                    
                    self.endGame()
                }else{
                self.setTexts()
                self.answerButton1.isEnabled = true
                self.answerButton2.isEnabled = true
                self.answerButton3.isEnabled = true
                self.answerButton4.isEnabled = true
                }
            }
            
        }//end if
        else{
            //if incorrect, display incorrect and disable buttons
            resultLabel.text = "Incorrect!"
            resultLabel.textColor = UIColor.red
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            //set a three second delay, then display amount of questions that were answered correctly
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = "You got " + String(self.correctCoutner) + " correct!"
                self.resetButton.isHidden = false;
                self.resetButton.isEnabled = true;
            }
        }//end if
            
    }//end answer1Button
    
    @IBAction func answer2Button(_ sender: Any) {
        if(answerArray[1] == correctAnswer){
            self.resultLabel.text = "Correct!"
            resultLabel.textColor = UIColor.green
            correctCoutner+=1
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = " "
                if(self.correctCoutner == 10){
                    
                    self.endGame()
                }else{
                self.setTexts()
                self.answerButton1.isEnabled = true
                self.answerButton2.isEnabled = true
                self.answerButton3.isEnabled = true
                self.answerButton4.isEnabled = true
                }
            }
        }//end if
        else{
            resultLabel.text = "Incorrect!"
            resultLabel.textColor = UIColor.red
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = "You got " + String(self.correctCoutner) + " correct!"
                self.resetButton.isHidden = false;
                self.resetButton.isEnabled = true;
            }
        }//end if

    }//end answer2Button
        
    @IBAction func answer3Button(_ sender: Any) {
        if(answerArray[2] == correctAnswer){
            self.resultLabel.text = "Correct!"
            resultLabel.textColor = UIColor.green
            correctCoutner+=1
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = " "
                if(self.correctCoutner == 10){
                    
                    self.endGame()
                }else{
                self.setTexts()
                self.answerButton1.isEnabled = true
                self.answerButton2.isEnabled = true
                self.answerButton3.isEnabled = true
                self.answerButton4.isEnabled = true
                }
            }
        }//end if
        else{
            resultLabel.text = "Incorrect!"
            resultLabel.textColor = UIColor.red
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = "You got " + String(self.correctCoutner) + " correct!"
                self.resetButton.isHidden = false;
                self.resetButton.isEnabled = true;
            }
        }//end if

    }//end answer3Button
    
    @IBAction func answer4Button(_ sender: Any) {
        if(answerArray[3] == correctAnswer){
            self.resultLabel.text = "Correct!"
            resultLabel.textColor = UIColor.green
            correctCoutner+=1
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = " "
                if(self.correctCoutner == 10){
                    
                    self.endGame()
                }else{
                self.setTexts()
                self.answerButton1.isEnabled = true
                self.answerButton2.isEnabled = true
                self.answerButton3.isEnabled = true
                self.answerButton4.isEnabled = true
                }
            }
        }//end if
        else{
            resultLabel.text = "Incorrect!"
            resultLabel.textColor = UIColor.red
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.resultLabel.text = "You got " + String(self.correctCoutner) + " correct!"
                self.resetButton.isHidden = false;
                self.resetButton.isEnabled = true;
            }
        }//end if

    }//end answer4Button
    
    @IBAction func resetButton(_ sender: Any) {
        resetButton.isHidden = true;
        resetButton.isEnabled = false;
        reset()
    }
}

