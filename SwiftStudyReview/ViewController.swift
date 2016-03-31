//
//  ViewController.swift
//  SwiftStudyReview
//
//  Created by Abigail Atchison on 3/28/16.
//  Copyright © 2016 Chapman University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var TopicLabel: UILabel!
    let StudyTopics: [String] = ["Let vs. Var","Computed Initializers", "Computed Variables", "Setter Observers", "Functions","External Parameters","Default Parameters","Anonymous Functions","Optional Chaining","Failable Initializers","Casting","Class Methods","Extensions","Enumeration","Error Handling","Dictionaries","Conditional Binding","Protocols","Inheritance","Structs","Enums","Classes","Subscripts","Setter Observers"]
    var currentIndex = 0
    var second = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TopicLabel.text = StudyTopics[0]
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
        
    }
    
    func update()
    {
        print("update \(second)" )
        second--;
        if(second == 0)
        {
            NextButtonClicked(NextButton)
        }
        else
        {
            if(second < 10)
            {
                TimerLabel.text = "00:0\(second)"
            }
            else
            {
                TimerLabel.text = "00:\(second)"
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func NextButtonClicked(sender: UIButton) {
        print("next")
        //iterate to next topic
        if(currentIndex == StudyTopics.count-1)
        {
            currentIndex = -1
        }
            TopicLabel.text = StudyTopics[currentIndex+1]
            currentIndex += 1
            //reset timer
            second = 30
            TimerLabel.text = "00:\(second)"
        
    }

}


