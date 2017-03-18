//
//  SelectAStartTimeVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/2/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import IQDropDownTextField

class SelectAStartTimeVC: UIViewController, IQDropDownTextFieldDelegate {

    @IBOutlet var txtStartDate: IQDropDownTextField?
    @IBOutlet var txtalertBeforeStartDate: IQDropDownTextField?
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        btnNext.setCornerRadious(btnNext.frame.height/2)
        
        txtStartDate?.setLeftMargin(8)
        txtStartDate?.setCornerRadious(4)
        txtStartDate?.minimumDate = Date()
        txtStartDate?.isOptionalDropDown = false
        txtStartDate?.dropDownMode = IQDropDownMode.dateTimePicker
        txtStartDate?.setDate(Date().addHours(2), animated: true)
        startDate = Date().addHours(2)
        
        txtalertBeforeStartDate?.setLeftMargin(8)
        txtalertBeforeStartDate?.setCornerRadious(4)
        txtalertBeforeStartDate?.isOptionalDropDown = false
        txtalertBeforeStartDate?.itemList = alertDurations
        alertBeforeStartDate = alertDurations[0]
        
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

    // MARK: - IQDropDownTextFieldDelegate Methods
    func textField(_ textField: IQDropDownTextField, didSelect date: Date?) {
        startDate = date
        print(date)
    }
    
    func textField(_ textField: IQDropDownTextField, didSelectItem item: String?) {
        alertBeforeStartDate = item
    }
    
    @IBAction func actionBackButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func actionNextButton(_ sender: AnyObject) {
        //self.navigationController!.popViewControllerAnimated(true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SelectAEndTimeVC") as? SelectAEndTimeVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}
