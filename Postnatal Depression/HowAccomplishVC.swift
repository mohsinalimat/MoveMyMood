//
//  HowAccomplishVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/2/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import HCSStarRatingView

class HowAccomplishVC: UIViewController {

    @IBOutlet weak var rateViewNap: HCSStarRatingView!
    @IBOutlet weak var btnUnlikely: UIButton!
    @IBOutlet weak var btnLikely: UIButton!
    @IBOutlet weak var btnGotThis: UIButton!
    @IBOutlet var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnUnlikely.setCornerRadious(btnUnlikely.frame.height/2)
        btnLikely.setCornerRadious(btnUnlikely.frame.height/2)
        btnGotThis.setCornerRadious(btnUnlikely.frame.height/2)
        
        categoryLabel.text = theNewCategory
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
    
    @IBAction func actionBackButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func actionUnlikely(sender: AnyObject) {
        //For test Going to How likely to accomplish screen
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AccomplishUnlikelyVC") as? AccomplishUnlikelyVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func actionSomeWhatLikely(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SomewhatLikelyVC") as? SomewhatLikelyVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func actionEasyiHaveGotThis(sender: AnyObject) {
        //self.navigationController!.popViewControllerAnimated(true)
        
        //For test Going to How likely to accomplish screen
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SelectAStartTimeVC") as? SelectAStartTimeVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    

}
