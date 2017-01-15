//
//  ScoreQuestion10ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var ninthScore = 0

class ScoreQuestion10ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yesMost(sender: AnyObject) {
        ninthScore = 3
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion11ViewController") as! ScoreQuestion11ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }

    @IBAction func often(sender: AnyObject) {
        ninthScore = 2
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion11ViewController") as! ScoreQuestion11ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func occasionally(sender: AnyObject) {
        ninthScore = 1
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion11ViewController") as! ScoreQuestion11ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func never(sender: AnyObject) {
        ninthScore = 0
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion11ViewController") as! ScoreQuestion11ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func backButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
