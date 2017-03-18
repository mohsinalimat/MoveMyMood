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
    
    @IBAction func yesMost(_ sender: AnyObject) {
        sixthScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func yesSometimes(_ sender: AnyObject) {
        sixthScore = 2
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func mostTimes(_ sender: AnyObject) {
        sixthScore = 1
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func coping(_ sender: AnyObject) {
        sixthScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion8ViewController") as! ScoreQuestion8ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
}
