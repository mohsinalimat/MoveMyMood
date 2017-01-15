//
//  ScoreQuestion5ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var fourthScore = 0

class ScoreQuestion5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notAt(sender: AnyObject) {
        fourthScore = 0
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion6ViewController") as! ScoreQuestion6ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }

    @IBAction func hardly(sender: AnyObject) {
        fourthScore = 1
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion6ViewController") as! ScoreQuestion6ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func sometimes(sender: AnyObject) {
        fourthScore = 2
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion6ViewController") as! ScoreQuestion6ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func often(sender: AnyObject) {
        fourthScore = 3
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion6ViewController") as! ScoreQuestion6ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
