//
//  CongratsVC.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 1/2/17.
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
    
    
    @IBAction func actionBackButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func actionDoneButton(_ sender: AnyObject) {
        
        let notification = UILocalNotification()
        notification.fireDate = Date(timeIntervalSinceNow: 10)
        //notification.fireDate = startDate t
        notification.alertBody = "it's almost time for some self care"
        notification.alertAction = "StartActivity"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["RemiderType": "StartActivity", "UUID": "reminderID"]
        UIApplication.shared.scheduleLocalNotification(notification)
        
        let endANotification = UILocalNotification()
        endANotification.fireDate = Date(timeIntervalSinceNow: 20)
        //endANotification.fireDate = endDate
        endANotification.alertBody = "checkin to shedule another activities"
        endANotification.alertAction = "EndActivity"
        endANotification.soundName = UILocalNotificationDefaultSoundName
        endANotification.userInfo = ["RemiderType": "EndActivity", "UUID": "reminderID"]
        //UIApplication.sharedApplication().scheduleLocalNotification(endANotification)
        
        
        guard let settings = UIApplication.shared.currentUserNotificationSettings else { return }
        
        if settings.types == UIUserNotificationType() {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
            return
        }
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScoreQuestion2ViewController") as! ScoreQuestion2ViewController!
        self.navigationController?.pushViewController(next!, animated: true)
    }
    
}
