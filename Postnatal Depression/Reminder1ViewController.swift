//
//  Reminder1ViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class Reminder1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(LandingViewController.swipeLeft(_:)))
        let recognizer1: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(Reminder1ViewController.swipeRight(_:)))
        recognizer.direction = .left
        recognizer1.direction = .right
        self.view.addGestureRecognizer(recognizer)
        self.view.addGestureRecognizer(recognizer1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeLeft(_ recognizer : UISwipeGestureRecognizer) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "Reminder2ViewController") as! Reminder2ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
    func swipeRight(_ recognizer : UISwipeGestureRecognizer) {
        self.navigationController!.popViewController(animated: true)
    }

}
