//
//  ScoreQuestion4ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var thirdScore = 0

class ScoreQuestion4ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yesMost(_ sender: AnyObject) {
        thirdScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion5ViewController") as! ScoreQuestion5ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func yesSome(_ sender: AnyObject) {
        thirdScore = 2
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion5ViewController") as! ScoreQuestion5ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func notVery(_ sender: AnyObject) {
        thirdScore = 1
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion5ViewController") as! ScoreQuestion5ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func never(_ sender: AnyObject) {
        thirdScore = 0
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion5ViewController") as! ScoreQuestion5ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
}
