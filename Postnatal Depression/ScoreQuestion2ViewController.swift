//
//  ScoreQuestion2ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var firstScore = 0

class ScoreQuestion2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func asMuch(_ sender: AnyObject) {
        firstScore = 0
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion3ViewController") as! ScoreQuestion3ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func notQuite(_ sender: AnyObject) {
        firstScore = 1
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion3ViewController") as! ScoreQuestion3ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

    @IBAction func definitelyNot(_ sender: AnyObject) {
        firstScore = 2
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion3ViewController") as! ScoreQuestion3ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func notAt(_ sender: AnyObject) {
        firstScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion3ViewController") as! ScoreQuestion3ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
}
