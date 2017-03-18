//
//  LicenseViewController.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit
import JSSAlertView
import PopupDialog


class LicenseViewController: UIViewController {
    
    @IBOutlet weak var btn18Years: UIButton!
    @IBOutlet weak var btnAgreeTerms: UIButton!
    
    var isAgeConfirmed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        btn18Years.tag = 0
        btn18Years.setImage(UIImage(named: "ic_uncheck")!, for: UIControlState())
        
        btnAgreeTerms.tag = 0
        btnAgreeTerms.setImage(UIImage(named: "ic_uncheck")!, for: UIControlState())
    }
    
    @IBAction func onCheckboxTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.setImage(UIImage(named: "ic_check")!, for: UIControlState())
        } else {
            sender.tag = 0
            sender.setImage(UIImage(named: "ic_uncheck")!, for: UIControlState())
        }
        
        // This Code is omnly added for testing diffrent custom alertview without waiting to local notification
        
        /*
         //--------------------------------
         // POPUP TYPE 1
         // Create the dialog
         let popup = PopupDialog(title: title, message: "", image: image)
         
         // Create buttons
         //        let buttonOne = CancelButton(title: "CANCEL") {
         //            print("You canceled the car dialog.")
         //        }
         
         let buttonTwo = DefaultButton(title: "Nailed it.") {
         print("What a beauty!")
         }
         buttonTwo.buttonColor = UIColor.darkGrayColor()
         buttonTwo.separatorColor = UIColor.clearColor()
         buttonTwo.setCornerRadious(buttonTwo.frame.size.height/2)
         
         let buttonThree = DefaultButton(title: "I didn't get to it.", dismissOnTap: false, action: {
         print("Ah, maybe next time :)")
         })
         
         // Add buttons to dialog
         // Alternatively, you can use popup.addButton(buttonOne)
         // to add a single button
         popup.addButtons([buttonTwo, buttonThree])
         
         // Present dialog
         self.navigationController?.presentViewController(popup, animated: true, completion: nil)
         */
        
        /*
         //--------------------------------
         // Create a custom view controller
         let ratingVC = RateAlertViewVC(nibName: "RateAlertViewVC", bundle: nil)
         
         // Create the dialog  - PopupDialogTransitionStyle
         let popup = PopupDialog(viewController: ratingVC, buttonAlignment: .Vertical, transitionStyle: .BounceDown
         , gestureDismissal: true) {
         print("Popup dismissed")
         }
         
         ratingVC.submitAction = {
         print("You rated \(ratingVC.ratingView.value) stars")
         popup.dismiss()
         }
         
         // Present dialog
         self.navigationController?.presentViewController(popup, animated: true, completion: nil)
         */
        
        /*
         //--------------------------------
         // Create a custom view controller
         let alertVC = AlertTitleOnlyVC(nibName: "AlertTitleOnlyVC", bundle: nil, alertTitle: "Activity completed?", Button1Name: "Nailed it.", Button2name: "I didn't get to it.")
         
         //alertVC.lblSubTitle.removeFromSuperview()
         
         // Create the dialog  - PopupDialogTransitionStyle
         let popup = PopupDialog(viewController: alertVC, buttonAlignment: .Vertical, transitionStyle: .BounceDown
         , gestureDismissal: true) {
         print("Popup dismissed")
         }
         
         alertVC.actionBtn1Tapped = {
         print("You tapped button1")
         popup.dismiss()
         }
         
         alertVC.actionBtn2Tapped = {
         print("You tapped button2")
         popup.dismiss()
         }
         
         // Present dialog
         self.navigationController?.presentViewController(popup, animated: true, completion: nil)
         */
        
        /*
         //--------------------------------
         // Create a custom view controller
         let alertVC = AlertSubtitleVC(nibName: "CustomAlertViewVC", bundle: nil, alertTitle: "Are you feeling diffrently?", alertSubTitle: "retakin an questionnnaire helps to identify if this app is helping", Button1Name: "Retake the questionarre", Button2name: "Let's do another activity")
         
         //alertVC.lblSubTitle.removeFromSuperview()
         
         // Create the dialog  - PopupDialogTransitionStyle
         let popup = PopupDialog(viewController: alertVC, buttonAlignment: .Vertical, transitionStyle: .BounceDown
         , gestureDismissal: true) {
         print("Popup dismissed")
         }
         
         alertVC.actionBtn1Tapped = {
         print("You tapped button1")
         popup.dismiss()
         }
         
         alertVC.actionBtn2Tapped = {
         print("You tapped button2")
         popup.dismiss()
         }
         
         // Present dialog
         self.navigationController?.presentViewController(popup, animated: true, completion: nil)
         */
        
        
        /*
         //--------------------------------
         // Create a custom view controller
         let alertVC = AlertSubtext(nibName: "CustomAlertViewVC", bundle: nil, alertTitle: "Making time is hard...", alertSubTitle: "Let's try it again!Here are common barriers mothers face when trying to complete an activity.",alertSubText: "No enough data.\nit seems hard.\nToo tired.\nNo childcare.\nThe baby doesent nap.\ni don't feel like going outside.", Button1Name: "I need help ovrcomming barriers", Button2name: "Let's do another activity")
         
         //alertVC.lblSubTitle.removeFromSuperview()
         
         // Create the dialog  - PopupDialogTransitionStyle
         let popup = PopupDialog(viewController: alertVC, buttonAlignment: .Vertical, transitionStyle: .BounceDown
         , gestureDismissal: true) {
         print("Popup dismissed")
         }
         
         alertVC.actionBtn1Tapped = {
         print("You tapped button1")
         popup.dismiss()
         }
         
         alertVC.actionBtn2Tapped = {
         print("You tapped button2")
         popup.dismiss()
         }
         
         // Present dialog
         self.navigationController?.presentViewController(popup, animated: true, completion: nil)
         */
        
        
    }
    
    @IBAction func continueButton(_ sender: AnyObject)
    {
        if btn18Years.tag == 0 {
            //if isAgeConfirmed == false {
            //isAgeConfirmed = true
            //"You must be older than 18 years to use this application. \nIf you are? Then select checkbox to continue. Thank you!"
            //JSSAlertView().info(self, title: "Message", text: "if you are under 18, please use this ink to find a mental helth provider in your area", buttonText: "Call", cancelButtonText: "Okay", delay: nil, timeLeft: {
                //print("Call..")
            //})
            //JSSAlertView().info(self, title: "Message", text: "if you are under 18, please use this ink to find a mental helth provider in your area", buttonText: "Call", cancelButtonText: "Okay", delay: nil)
            //JSSAlertView().info(self, title: "Message", text: "if you are under 18, please use this ink to find a mental helth provider in your area", buttonText: "Okay")
            return
            //            } else {
            //                NSUserDefaults.standardUserDefaults().setObject("0", forKey: "isOlderThen18Years")
            //                NSUserDefaults.standardUserDefaults().synchronize()
            //            }
        } else {
            UserDefaults.standard.set("1", forKey: "isOlderThen18Years")
            UserDefaults.standard.synchronize()
        }
        if btnAgreeTerms.tag == 0 {
            JSSAlertView().info(self, title: "Message", text: "You must be agree to our terms and conditions. Thank you!", buttonText: "Okay")
            return
        }
        
        //Save Flag value
        UserDefaults.standard.set("1", forKey: "isEligibleToUseOurApp")
        UserDefaults.standard.synchronize()
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
}
