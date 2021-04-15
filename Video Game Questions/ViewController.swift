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

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    
    var questionsArray : [String] = []
    var questionLine : [Substring] = []
    var answerArray : [Substring] = ["","","",""]
    var questionCounter = 0
    var correctCoutner = 0
    var correctAnswer : Substring!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readQuestion()
        setTexts()
        // Do any additional setup after loading the view.
    }
    var lineArray = [String]()
    
    func readQuestion(){
        
        questionsArray = ["Which Wii game was a launch title and the best selling game for the system?,Wii Sports,The Legend of Zelda: Twilight Princess,Wii Play,Super Mario Galaxy," , "What is Mario's first 3D adventure?,Super Mario 64,Super Mario Sunshine,Mario Party,Mario Tennis," , "Which Pokemon game takes place in the Sinnoh region?,Pokemon Platinum,Pokemon Sword/Shield,Pokemon Heart Gold/Soul Silver,Pokemon Emerald," , "Who is Joker's main persona in Persona 5?,Arsene,Izanagi,Captain Kidd,Carmen," , "Who is Mario trying to save in the original Donkey Kong game?,Pauline,Princess Peach,Princess Daisy,Rosalina,"]
        
        questionLine = questionsArray[questionCounter].split(separator:",")
        correctAnswer = questionLine[1]
        
        answerArray[0] = questionLine[1]
        answerArray[1] = questionLine[2]
        answerArray[2] = questionLine[3]
        answerArray[3] = questionLine[4]
        answerArray.shuffle()
        
        
            
        //let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        //let fileURL = DocumentDirURL.appendingPathComponent(filename).appendingPathExtension("txt")
        //var str1 : String
        //var myCounter : Int
        
        //do {
            //let contents = try String(contentsOfFile: filename)
            //let lines = contents.split(separator:"\n")
            //myCounter = lines.count
            //for n in 0...50 {
                //lineArray[n] = String(lines[n])
            //}
            //str1 = String(myCounter)
            
        //}//end do
        //catch {
         //print(error.localizedDescription)
        //}//end catch
        
    }//end readQuestions
    
    func setTexts(){
        questionLabel.text = String(questionLine[0])
        answerButton1.setTitle(String(answerArray[0]), for: .normal)
        answerButton2.setTitle(String(answerArray[1]), for: .normal)
        answerButton3.setTitle(String(answerArray[2]), for: .normal)
        answerButton4.setTitle(String(answerArray[3]), for: .normal)

        questionCounter+=1
        
        
    }//end setTexts

    @IBAction func answer1Button(_ sender: Any) {
        if(answerArray[0] == correctAnswer){
            print("Correct!")
            correctCoutner+=1
            readQuestion()
            setTexts()
            
        }//end if
        else{
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            print("Incorrect!")
        }//end if
            
    }//end answer1Button
    
    @IBAction func answer2Button(_ sender: Any) {
        if(answerArray[1] == correctAnswer){
            print("Correct!")
            correctCoutner+=1
            readQuestion()
            setTexts()
            
        }//end if
        else{
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            print("Incorrect!")
        }//end if

    }//end answer2Button
        
    @IBAction func answer3Button(_ sender: Any) {
        if(answerArray[2] == correctAnswer){
            print("Correct!")
            correctCoutner+=1
            readQuestion()
            setTexts()
            
        }//end if
        else{
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            print("Incorrect!")
        }//end if

    }//end answer3Button
    
    @IBAction func answer4Button(_ sender: Any) {
        if(answerArray[3] == correctAnswer){
            print("Correct!")
            correctCoutner+=1
            readQuestion()
            setTexts()
            
        }//end if
        else{
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            answerButton3.isEnabled = false
            answerButton4.isEnabled = false
            print("Incorrect!")
        }//end if

    }//end answer4Button
    
}

