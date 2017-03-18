//
//  AppDelegate.swift
//  Postnatal Depression
//
//  Created by Dustin Allen on 12/13/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift
import JSSAlertView
import PopupDialog


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var storyBoard: UIStoryboard?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.sharedManager().enable = true
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        //Local Notification
        let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
        
        
        if let options = launchOptions {
            let value = options[UIApplicationLaunchOptionsKey.localNotification] as? UILocalNotification
            if let notification = value {
                delay(3, closure: {
                    self.application(application, didReceive: notification)
                })
            }
        }
        
        if let isEligibleToUseOurApp = UserDefaults.standard.object(forKey: "isEligibleToUseOurApp") as? String, isEligibleToUseOurApp == "11"
        {
            print("User is Eligible To Use Our App")
            
            let landingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LandingViewController") as! LandingViewController
            let nav = UINavigationController(rootViewController: landingVC)
            nav.isNavigationBarHidden = true
            self.window?.rootViewController = nav
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        
        print("notificationSettings.types.rawValue : \(notificationSettings.types.rawValue)")
        
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        // Do something serious in a real app.
        print("Received Local Notification:")
        print(notification.alertBody as Any)
        print(notification.userInfo as Any)
        
        
        if ( application.applicationState == .active )
        {
            //opened from a notification when the app was on background
            //let alertNotification = UIAlertView(title: "Title", message: notification.alertBody ?? "Title", delegate: nil, cancelButtonTitle: "Okay")
            //alertNotification.show()
            
            //            JSSAlertView().info(UIApplication.topViewController()!, title: "Notification", text: notification.alertBody, buttonText: "Nailed it", buttonAction: {
            //                print("Call..")
            //                }, cancelButtonText: "Ididn't get to it", delay: nil)
            
        } else {
            //App opened from Notification
            //            if let alertType = notification.userInfo?["RemiderType"] as? String where alertType == "EndActivity" {
            //                let alertNotification = UIAlertView()
            //                alertNotification.title = notification.alertBody ?? "Title"
            //                alertNotification.show()
            //            } else {
            //                JSSAlertView().info(UIApplication.topViewController()!, title: "Notification", text: notification.alertBody, buttonText: "Nailed it", buttonAction: {
            //                    print("Call..")
            //                    }, cancelButtonText: "Ididn't get to it", delay: nil)
            //            }
        }
        
        let alertVC = AlertTitleOnlyVC(nibName: "AlertTitleOnlyVC", bundle: nil, alertTitle: "Activity completed?", Button1Name: "Nailed it.", Button2name: "I didn't get to it.")
        
        //alertVC.lblSubTitle.removeFromSuperview()
        
        let popup = PopupDialog(viewController: alertVC, buttonAlignment: .vertical, transitionStyle: .bounceDown
        , gestureDismissal: true) {
            print("Popup dismissed")
        }
        
        alertVC.actionBtn1Tapped = {
            print("You tapped button1")
            popup.dismiss({
                let alertVC = AlertSubtext(nibName: "CustomAlertViewVC", bundle: nil, alertTitle: "Making time is hard...", alertSubTitle: "Let's try it again!Here are common barriers mothers face when trying to complete an activity.",alertSubText: "No enough data.\nit seems hard.\nToo tired.\nNo childcare.\nThe baby doesent nap.\ni don't feel like going outside.", Button1Name: "I need help ovrcomming barriers", Button2name: "Let's do another activity")
                
                // Create the dialog  - PopupDialogTransitionStyle
                let popup = PopupDialog(viewController: alertVC, buttonAlignment: .vertical, transitionStyle: .bounceDown
                , gestureDismissal: true) {
                    print("Popup dismissed")
                }
                
                alertVC.actionBtn1Tapped = {
                    print("You tapped button1")
                    popup.dismiss({
                        let vc = self.storyBoard?.instantiateViewController(withIdentifier: "SomewhatLikelyVC") as? SomewhatLikelyVC
                        UIApplication.topViewController()?.navigationController?.pushViewController(vc!, animated: true)
                    })
                }
                
                alertVC.actionBtn2Tapped = {
                    print("You tapped button2")
                    popup.dismiss({
                        let vc = self.storyBoard?.instantiateViewController(withIdentifier: "ListActivityRatesVC") as? ListActivityRatesVC
                        UIApplication.topViewController()?.navigationController?.pushViewController(vc!, animated: true)
                    })
                }
                
                UIApplication.topViewController()?.navigationController?.present(popup, animated: true, completion: nil)
            })
        }
        
        alertVC.actionBtn2Tapped = {
            print("You tapped button2")
            
            popup.dismiss(
                {
                    let ratingVC = RateAlertViewVC(nibName: "RateAlertViewVC", bundle: nil)
                    let popup = PopupDialog(viewController: ratingVC, buttonAlignment: .vertical, transitionStyle: .bounceDown
                    , gestureDismissal: true) {
                        print("Popup dismissed")
                    }
                    
                    ratingVC.submitAction = {
                        print("You rated \(ratingVC.ratingView.value) stars")
                        popup.dismiss({
                            let vc = self.storyBoard?.instantiateViewController(withIdentifier: "ListActivityRatesVC") as? ListActivityRatesVC
                            UIApplication.topViewController()?.navigationController?.pushViewController(vc!, animated: true)
                        })
                    }
                    UIApplication.topViewController()?.navigationController?.present(popup, animated: true, completion: nil)
            })
        }
        
        UIApplication.topViewController()?.navigationController?.present(popup, animated: true, completion: nil)
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        
        if identifier == "StartActivity" {
            //NSNotificationCenter.defaultCenter().postNotificationName("startActivityNotification", object: nil)
        }
        else if identifier == "EndActivity" {
            //NSNotificationCenter.defaultCenter().postNotificationName("endActivityNotification", object: nil)
        }
        
        completionHandler()
    }
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.harloch.Postnatal_Depression" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = Bundle.main.url(forResource: "Postnatal_Depression", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        // Create the coordinator and store
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("SingleViewCoreData.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
}

