//
//  ScoreQuestion3ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var secondScore = 0

class ScoreQuestion3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Score: \(firstScore)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func asMuch(_ sender: AnyObject) {
        secondScore = 0
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion4ViewController") as! ScoreQuestion4ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func rather(_ sender: AnyObject) {
        secondScore = 1
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion4ViewController") as! ScoreQuestion4ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func definitely(_ sender: AnyObject) {
        secondScore = 2
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion4ViewController") as! ScoreQuestion4ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func hardly(_ sender: AnyObject) {
        secondScore = 3
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion4ViewController") as! ScoreQuestion4ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    @IBAction func backButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
}
