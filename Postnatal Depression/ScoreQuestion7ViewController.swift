//
//  ScoreQuestion7ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var sixthScore = 0

class ScoreQuestion7ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesMost(sender: AnyObject) {
        sixthScore = 3
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }

    @IBAction func yesSometimes(sender: AnyObject) {
        sixthScore = 2
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }

    @IBAction func mostTimes(sender: AnyObject) {
        sixthScore = 1
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func coping(sender: AnyObject) {
        sixthScore = 3
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
