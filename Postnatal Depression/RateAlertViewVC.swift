//
//  RateAlertViewVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/5/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import HCSStarRatingView

class RateAlertViewVC: UIViewController {

    @IBOutlet weak var ratingView: HCSStarRatingView!
    
    var submitAction: blockAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func actionSubmitRatingButton(sender: AnyObject)
    {
        self.submitAction?()
    }
}
