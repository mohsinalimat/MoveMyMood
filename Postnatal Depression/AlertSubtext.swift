//
//  CustomAlertViewVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/5/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit

class AlertSubtext: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblSubText: UILabel!
    
    @IBOutlet weak var btnAlert1: UIButton!
    @IBOutlet weak var btnAlert2: UIButton!
    
    var actionBtn1Tapped: blockAction?
    var actionBtn2Tapped: blockAction?
    
    var alertTitle:String?
    var alertSubTitle:String?
    var alertSubText:String?
    var Button1Name:String?
    var Button2name:String?
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, alertTitle:String?, alertSubTitle:String?, alertSubText:String?, Button1Name:String?, Button2name:String?)   {
        //print("1 Custom init nibName nibNameOrNil")
        super.init(nibName: nil, bundle: nil)
        //print("2 Custom init nibName nibNameOrNil")
        //lblSubText.removeFromSuperview()'
        
        self.alertTitle = alertTitle
        self.alertSubTitle = alertSubTitle
        self.alertSubText = alertSubText
        self.Button1Name = Button1Name
        self.Button2name = Button2name
    }
    
//    override func awakeFromNib() {
//        lblSubText.removeFromSuperview()
//    }
    
//    required init(coder aDecoder: NSCoder) {
//        print("init coder")
//        super.init()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        print("1 Custom init nibName nibNameOrNil")
//        super.init(nibName: nil, bundle: nil)
//        print("2 Custom init nibName nibNameOrNil")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //additionalSetup?()
        //lblSubText.hidden = true
        
        btnAlert1?.setCornerRadious(btnAlert1.frame.height/2)
        btnAlert2?.setCornerRadious(btnAlert2.frame.height/2)
        
        lblTitle.text = alertTitle
        lblSubTitle.text = alertSubTitle
        lblSubText.text = alertSubText
        btnAlert1.setTitle(Button1Name ?? "", forState: .Normal)
        btnAlert2.setTitle(Button2name ?? "", forState: .Normal)
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
