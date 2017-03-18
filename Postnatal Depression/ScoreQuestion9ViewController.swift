//
//  ScoreQuestion9ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var eighthScore = 0

class ScoreQuestion9ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesMost(_ sender: AnyObject) {
        eighthScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion10ViewController") as! ScoreQuestion10ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func yesQuite(_ sender: AnyObject) {
        eighthScore = 2
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion10ViewController") as! ScoreQuestion10ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func notVery(_ sender: AnyObject) {
        eighthScore = 1
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion10ViewController") as! ScoreQuestion10ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func notAt(_ sender: AnyObject) {
        eighthScore = 0
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion10ViewController") as! ScoreQuestion10ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
}
