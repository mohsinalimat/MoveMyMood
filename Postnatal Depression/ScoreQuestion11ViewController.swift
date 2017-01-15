//
//  ScoreQuestion11ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit
import JSSAlertView

class ScoreQuestion11ViewController: UIViewController {
    
    var localResults = 0
    var tenthScore = 0
    var totalScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        localResults = firstScore + secondScore + thirdScore + fourthScore + fifthScore + sixthScore + seventhScore + eighthScore + ninthScore
        print("Current Total: \(localResults)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func often(sender: AnyObject) {
        tenthScore = 3
        totalScore = tenthScore + localResults
        if totalScore < 9 {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are not experiencing all the symptoms of depression. If you would like extra help improving your mood, go ahead!", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        } else {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are experiencing some symptoms of depression. This app can help you improve your mood.", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        }
    }

    @IBAction func sometimes(sender: AnyObject) {
        tenthScore = 2
        totalScore = tenthScore + localResults
        if totalScore < 9 {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are not experiencing all the symptoms of depression. If you would like extra help improving your mood, go ahead!", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        } else {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are experiencing some symptoms of depression. This app can help you improve your mood.", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        }
    }

    @IBAction func hardly(sender: AnyObject) {
        tenthScore = 1
        totalScore = tenthScore + localResults
        if totalScore < 9 {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are not experiencing all the symptoms of depression. If you would like extra help improving your mood, go ahead!", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        } else {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are experiencing some symptoms of depression. This app can help you improve your mood.", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        }
    }
    
    @IBAction func never(sender: AnyObject) {
        tenthScore = 0
        totalScore = tenthScore + localResults
        if totalScore < 9 {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are not experiencing all the symptoms of depression. If you would like extra help improving your mood, go ahead!", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        } else {
            JSSAlertView().info(self, title: "Your Score is \(totalScore)", text: "This indicates that you are experiencing some symptoms of depression. This app can help you improve your mood.", buttonText: "Next Step")
            let next = self.storyboard?.instantiateViewControllerWithIdentifier("ReminderViewController") as! ReminderViewController!
            self.navigationController?.pushViewController(next, animated: true)
        }
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
