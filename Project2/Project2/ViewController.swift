//
//  ViewController.swift
//  Project2
//
//  Created by Brandon Johns on 3/31/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!

    @IBOutlet var button3: UIButton!
    
    var countries: [String] = []
    var score: Int = 0
    var correct_Answer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       countries += [ "Estonia", "France", "Germany","Ireland", "Italy", "Monaco", "Nigera", "Poland", "Russia", "Spain", "UK", "US"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        ask_Question()
    }

    func ask_Question(action: UIAlertAction! = nil)
    {
        countries.shuffle()
        
        correct_Answer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correct_Answer].uppercased()
    }
    
    
    
    @IBAction func button_Tapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correct_Answer
        {
            title = "Correct"
            score += 1
        }
        
        else
        {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: ask_Question))
        
        present(ac, animated: true)
    }
    
}

