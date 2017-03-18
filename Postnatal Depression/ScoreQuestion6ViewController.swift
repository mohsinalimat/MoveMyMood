//
//  ScoreQuestion6ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var fifthScore = 0

class ScoreQuestion6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesQuite(_ sender: AnyObject) {
        fifthScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion7ViewController") as! ScoreQuestion7ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func sometimes(_ sender: AnyObject) {
        fifthScore = 2
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion7ViewController") as! ScoreQuestion7ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func notMuch(_ sender: AnyObject) {
        fifthScore = 1
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion7ViewController") as! ScoreQuestion7ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func notAt(_ sender: AnyObject) {
        fifthScore = 0
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion7ViewController") as! ScoreQuestion7ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
}
