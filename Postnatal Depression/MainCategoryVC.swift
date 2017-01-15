//
//  MainCategoryVC.swift
//  Postnatal Depression
//
//  Created by iParth on 12/15/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import UIKit

var categories:Array<String> = ["At home","Outside","With others","Just for me"]
var items:Dictionary<String,AnyObject> = ["At home":["Self care", "Grooming", "Get your zen on", "Engage your senses", "Let your creative juices flow", "Household stuff", "Future and past fun"],"Outside":["Outside", "Grooming","Health", "Treat", "Exercise"],"With others":["Connect", "Meet with a friend","Romantic fun", "For others"],"Just for me":["Self care", "Grooming", "Get your zen on", "Engage your senses", "Let your creative juices flow", "Household stuff", "Future and past fun"]]

var homeItems:Array<String> = ["Self care", "Grooming", "Get your zen on", "Engage your senses", "Let your creative juices flow", "Household stuff", "Future and past fun"]
var outsideItems:Array<String> = ["Outside", "Grooming","Health", "Treat", "Exercise"]
var othersItems:Array<String> = ["Connect", "Meet with a friend","Romantic fun", "For others"]
var forMeItems:Array<String> = ["Self care", "Grooming", "Get your zen on", "Engage your senses", "Let your creative juices flow", "Household stuff", "Future and past fun"]
var selectedSections:Array<Int> = []
var itemChosen = ""

class MainCategoryVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblCategory: UITableView!
    @IBOutlet weak var btnNext: UIButton!
    
    var atHome = "At home"
    var theOutside = "Outside"
    var withOthers = "With others"
    var justForMe = "Just for me"
    
    //var categories:Array<String> = ["At home","Outside","With others","Just for me"]
    //var items:Dictionary<String,AnyObject> = ["At home":["Self care", "Grooming", "Get your zen on", "Engage your senses", "Let your creative juices flow", "Household stuff", "Future and past fun"],"Outside":["Outside", "Grooming","Health", "Treat", "Exercise"],"With others":["Connect", "Meet with a friend","Romantic fun", "For others"],"Just for me":["Self care", "Grooming", "Get your zen on", "Engage your senses", "Let your creative juices flow", "Household stuff", "Future and past fun"]]
    //var selectedSections:Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        btnNext.layer.cornerRadius = (btnNext.frame.height/2)
        btnNext.layer.masksToBounds = true
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return items.count
        //return 15
        
        //selectedSections?.contains(section)
        if selectedSections.contains(section) {
            //Unselect section
            let category = categories[section]
            let subCats = items[category]
            return 1 + ((subCats?.count) ?? 0)
        } else {
            //Expand submenu
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            //Main Category
            let cell:CategoryTableViewCell = self.tblCategory.dequeueReusableCellWithIdentifier("CategoryTableViewCell") as! CategoryTableViewCell
            
            cell.lblCategoryTitle?.text = categories[indexPath.section]
            
            cell.imgCategory.backgroundColor = UIColor.grayColor()
            cell.imgCategory.layer.cornerRadius = (cell.imgCategory.frame.width/2)
            cell.imgCategory.layer.masksToBounds = true
            
            cell.imgStatus.hidden = false
            cell.imgCategory.hidden = false
            
            if selectedSections.contains(indexPath.section) {
                UIView.animateWithDuration(0.2, animations: {
                    cell.imgStatus.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2.5));
                })
            } else {
                UIView.animateWithDuration(0.2, animations: {
                    cell.imgStatus.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2.0));
                })
            }
            
            return cell
        } else {
            //Sub menu
            let cell:CategoryTableViewCell = self.tblCategory.dequeueReusableCellWithIdentifier("CategoryTableViewCell") as! CategoryTableViewCell
            
            let array = items[categories[indexPath.section]] as? Array<String> ?? []
            cell.lblCategoryTitle?.text = "- \(array[indexPath.row-1])"
            
            cell.imgStatus.hidden = true
            cell.imgCategory.hidden = true
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        guard  else {
//            //selection of first cell to expand
//            
//            return
//        }
        
        var currentCell:CategoryTableViewCell?
        if let indexPath = tableView.indexPathForSelectedRow {
            currentCell = tableView.cellForRowAtIndexPath(indexPath) as? CategoryTableViewCell
            print((currentCell?.lblCategoryTitle.text)! as String)
            
            if currentCell?.lblCategoryTitle.text == "At home" {
                itemChosen = "At home"
            }
            if currentCell?.lblCategoryTitle.text == "Outside" {
                itemChosen = "Outside"
            }
            if currentCell?.lblCategoryTitle.text == "With others" {
                itemChosen = "With others"
            }
            if currentCell?.lblCategoryTitle.text == "Just for me" {
                itemChosen = "Just for me"
            }
        }
        
        
        
        
        if selectedSections.contains(indexPath.section) {
            if indexPath.row == 0 {
                UIView.animateWithDuration(0.2, animations: {
                    currentCell?.imgStatus.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2.0));
                })
                //Unselect section
                selectedSections.removeAtIndex(selectedSections.indexOf(indexPath.section) ?? 0)
                //self.tblCategory.reloadData()
                self.tblCategory.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
            } else {
                //Value Selected
                print(currentCell?.lblCategoryTitle.text)
                
                let next = self.storyboard?.instantiateViewControllerWithIdentifier("RateActivitiesVC") as! RateActivitiesVC!
                self.navigationController?.pushViewController(next, animated: true)
            }
        } else {
            //Expand submenu
            UIView.animateWithDuration(0.2, animations: {
                currentCell?.imgStatus.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2.5));
            })
            
            if selectedSections.count > 0 {
                //self.tblCategory.reloadSections(NSIndexSet(index: selectedSections!), withRowAnimation: UITableViewRowAnimation.None)
                selectedSections.append(indexPath.section)
                //self.tblCategory.reloadData()
                self.tblCategory.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
                return
            }
            
            selectedSections.append(indexPath.section)
            //self.tblCategory.reloadData()
            self.tblCategory.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
}
