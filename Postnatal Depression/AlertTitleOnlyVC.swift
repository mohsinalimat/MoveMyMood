//
//  CAVTitleOnlyVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/7/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit

class AlertTitleOnlyVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    var actionBtn1Tapped: blockAction?
    var actionBtn2Tapped: blockAction?
    
    var alertTitle:String?
    var Button1Name:String?
    var Button2name:String?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, alertTitle:String?, Button1Name:String?, Button2name:String?)   {
        //print("1 Custom init nibName nibNameOrNil")
        super.init(nibName: nil, bundle: nil)
        //print("2 Custom init nibName nibNameOrNil")
        //lblSubText.removeFromSuperview()'
        
        self.alertTitle = alertTitle
        self.Button1Name = Button1Name
        self.Button2name = Button2name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btn1?.setCornerRadious(btn1.frame.height/2)
        btn2?.setCornerRadious(btn1.frame.height/2)
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

    @IBAction func actionBtn1Tapped(sender: AnyObject) {
        self.actionBtn1Tapped?()
    }
    
    @IBAction func actionBtn2Tapped(sender: AnyObject) {
        self.actionBtn2Tapped?()
    }
    
}
