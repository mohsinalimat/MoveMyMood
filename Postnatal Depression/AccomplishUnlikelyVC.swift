//
//  AccomplishUnlikelyViewController.swift
//  Postnatal Depression
//
//  Created by iParth on 1/3/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit

class AccomplishUnlikelyVC: UIViewController {
    
    @IBOutlet weak var tblRates: UITableView!
    
    var categories:Array<String> = ["Nap","Watch a movie","Read a book","Make a good meal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tblRates.scrollEnabled = false
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theCategory.count
        //return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //Main Category
        let cell:RateListTableViewCell = self.tblRates.dequeueReusableCellWithIdentifier("RateListTableViewCell") as! RateListTableViewCell
        
        cell.lblCategoryTitle?.text = theCategory[indexPath.row]
        cell.vRate?.tintColor = UIColor(red: 241/255.0, green: 196/255.0, blue: 15/255.0, alpha: 1)
        cell.vRate?.value = 3
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tblRates.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
