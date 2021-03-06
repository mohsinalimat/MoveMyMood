//
//  ReminderCopyViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartedButton(_ sender: AnyObject) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MainCategoryVC") as! MainCategoryVC!
        self.navigationController?.pushViewController(next!, animated: true)
    }
}
