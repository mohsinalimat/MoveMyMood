//
//  LandingViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(LandingViewController.swipeLeft(_:)))
        recognizer.direction = .left
        self.view.addGestureRecognizer(recognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipeLeft(_ recognizer : UISwipeGestureRecognizer) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "Reminder1ViewController") as! Reminder1ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }

}
