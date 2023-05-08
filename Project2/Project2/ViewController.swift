//
//  ViewController.swift
//  Project2
//
//  Created by Brandon Johns on 3/31/23.
//

import UIKit

class ViewController: UIViewController {
                                                                                // IBOutlet connects code to the storyboard
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!

    @IBOutlet var button3: UIButton!
    
    var countries: [String] = []
    var score: Int = 0
    var correct_Answer = 0
    var questions_Asked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        
       countries += [ "Estonia", "France", "Germany","Ireland", "Italy", "Monaco", "Nigera", "Poland", "Russia", "Spain", "UK", "US"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
                                                                                // .layer comes from CALayer
                                                                                // .layer.borderWidth = 1 draws a 1 point border around the button
       
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
                                                                                // default CALayer is black
                                                                                // CALayer has its own clolrs called CGColor
                                                                                // UIColor.LightGray.cgColor
                                                                                //  sets the borderColor to light gray and UIColor sets the cgColor

        ask_Question()
    }

    func ask_Question(action: UIAlertAction! = nil)
    {                                                                           //action: UIAlertAction! = nil
                                                                                // if no action is required then set it to nil
                                                                                // this allows the alert to show up when the user selects right/wrong flag
        questions_Asked += 1
        
        countries.shuffle()                                                     // shuffles array
        
        correct_Answer = Int.random(in: 0...2)                                  // button 1 2 3 is the correct answer
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
                                                                                // button.setImage  assigns the button as a UIImage
                                                                                // for: .normal  states which state the button should change
                                                                                //      .normal = standard state of button
                                                                                //                static property in UIControlState

        
        title = countries[correct_Answer].uppercased() + "     Score: \(score)"                        // title is the correct answer and uppercased
         
    }
    
    
                                                                                //IBAction makes the code excute once its tapped on the view
    @IBAction func button_Tapped(_ sender: UIButton)                            //tapped_Button function connected to the Buttons on IB
    {
                                                                                // button 1 = tag 1 and so on
        var title: String
        if sender.tag == correct_Answer                                         // sender.tag == correct button tapped
                                                                                //               sets it to the correct answer
        {
            title = "Correct"                                                   // Title will say correct and score will add 1
            score += 1
            
        }
        
        else
        {
            title = "This Flag is the flag of: \(countries[sender.tag].uppercased())"
            score -= 1
    
        }
        
        if questions_Asked < 10
        {
            
            let alert_controller = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                                                                                    // shows an alert to the user
                                                                                    // title is the title displayed on the view
                                                                                    // message is whatever message you want to provide to the user
                                                                                    //referredStyle: .alert
                                                                                    //      pops an alert in th emiddle of the screen
            
            alert_controller.addAction(UIAlertAction(title: "Continue", style: .default, handler: ask_Question))
                                                                                    // UIAlertACtion
                                                                                    // adds the continue button to the alert
                                                                                    // handler: ask_Question
                                                                                    //  handler is looking for a clsure
                                                                                    //     passed is the ask_Question function instead of the clsure
            
            present(alert_controller, animated: true)
                                                                                    // present the view controller and animate it
        }
        else
        {
            
            let alert_controller_question_Asked = UIAlertController(title: "GAME OVER!" , message: "After 10 questions your score is: \(score)", preferredStyle: .alert)
                                                                                    // questions asked alert controller updates the score
            alert_controller_question_Asked.addAction(UIAlertAction(title: "NEW GAME", style: .default, handler: startNewGame))
                                                                                    // new game calls the new game function
            present(alert_controller_question_Asked, animated: true)
        }
    }
    
    @objc func showScore()
    {
        let scoreAlert = UIAlertController(title: "Score", message: nil, preferredStyle:  .alert)
        
        scoreAlert.addAction(UIAlertAction(title: "Current Score is: \(score)", style: .default, handler: nil))
        
        present(scoreAlert, animated: true)
        
    }
    
    func startNewGame(action: UIAlertAction! = nil)
    {
        score = 0
        questions_Asked = 0
        
        ask_Question()
    }
    
}

