//
//  ReminderNextViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class ReminderNextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButton(sender: AnyObject) {
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("MainCategoryVC") as! MainCategoryVC!
        self.navigationController?.pushViewController(next, animated: true)
    }
}
