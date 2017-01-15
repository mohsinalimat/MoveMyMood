//
//  CongratsVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/2/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit

class CongratsVC: UIViewController {
    
    @IBOutlet weak var btnDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        btnDone.setCornerRadious(btnDone.frame.height/2)
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
    
    @IBAction func actionDoneButton(sender: AnyObject) {
        
        //let vc = self.storyboard?.instantiateViewControllerWithIdentifier("CongratsVC") as? CongratsVC
        //self.navigationController?.pushViewController(vc!, animated: true)
        
        //"it's almost time for some self care"
        //"checkin to shedule another activities"
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: 10)
        //notification.fireDate = startDate t
        notification.alertBody = "it's almost time for some self care"
        notification.alertAction = "StartActivity"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["RemiderType": "StartActivity", "UUID": "reminderID"]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        let endANotification = UILocalNotification()
        endANotification.fireDate = NSDate(timeIntervalSinceNow: 20)
        //endANotification.fireDate = endDate
        endANotification.alertBody = "checkin to shedule another activities"
        endANotification.alertAction = "EndActivity"
        endANotification.soundName = UILocalNotificationDefaultSoundName
        endANotification.userInfo = ["RemiderType": "EndActivity", "UUID": "reminderID"]
        //UIApplication.sharedApplication().scheduleLocalNotification(endANotification)
        
        
        guard let settings = UIApplication.sharedApplication().currentUserNotificationSettings() else { return }
        
        if settings.types == .None {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(ac, animated: true, completion: nil)
            return
        }
        
        let next = self.storyboard?.instantiateViewControllerWithIdentifier("ScoreQuestion2ViewController") as! ScoreQuestion2ViewController!
        self.navigationController?.pushViewController(next, animated: true)
    }
    
}
