//
//  ScoreQuestion8ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var seventhScore = 0

class ScoreQuestion8ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesMost(_ sender: AnyObject) {
        seventhScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion9ViewController") as! ScoreQuestion9ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func sometimes(_ sender: AnyObject) {
        seventhScore = 2
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion9ViewController") as! ScoreQuestion9ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func notOften(_ sender: AnyObject) {
        seventhScore = 1
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion9ViewController") as! ScoreQuestion9ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func notAt(_ sender: AnyObject) {
        seventhScore = 0
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion9ViewController") as! ScoreQuestion9ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
}
