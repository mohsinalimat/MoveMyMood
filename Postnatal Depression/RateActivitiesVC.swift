//
//  RateActivitiesVC.swift
//  Postnatal Depression
//
//  Created by iParth on 12/17/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

class RateActivitiesVC: UIViewController {

    @IBOutlet weak var tblRates: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    
    var categories:Array<String> = ["Nap","Watch a movie","Read a book","Make a good meal"]
    var theCategory:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnNext.layer.cornerRadius = (btnNext.frame.height/2)
        btnNext.layer.masksToBounds = true
        
        tblRates.scrollEnabled = false
        
        if itemChosen == "At home" {
            theCategory = homeItems
        }
        if itemChosen == "Outside" {
            theCategory = outsideItems
        }
        if itemChosen == "With others" {
            theCategory = othersItems
        }
        if itemChosen == "Just for me" {
            theCategory = forMeItems
        }
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
    
    @IBAction func actionNextButton(sender: AnyObject) {
        //self.navigationController!.popViewControllerAnimated(true)
        
        //For test Going to How likely to accomplish screen
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("ListActivityRatesVC") as? ListActivityRatesVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theCategory.count
        //return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Main Category
        let cell:RateTableViewCell = self.tblRates.dequeueReusableCellWithIdentifier("RateTableViewCell") as! RateTableViewCell
        
        cell.lblCategoryTitle?.text = theCategory[indexPath.row]
        cell.vRate?.tintColor = UIColor(red: 241/255.0, green: 196/255.0, blue: 15/255.0, alpha: 1)
        cell.vRate?.value = 4
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tblRates.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
