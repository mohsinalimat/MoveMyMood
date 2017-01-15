//
//  Reminder2ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class Reminder2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer1: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(Reminder1ViewController.swipeRight(_:)))
        recognizer1.direction = .Right
        self.view.addGestureRecognizer(recognizer1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getStartedButton(sender: AnyObject) {
        //let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion2ViewController") as! ScoreQuestion2ViewController!
        //self.navigationController?.pushViewController(next, animated: true)
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion2ViewController") as! ScoreQuestion2ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    func swipeRight(recognizer : UISwipeGestureRecognizer) {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
