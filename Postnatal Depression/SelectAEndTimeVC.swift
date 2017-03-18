//
//  SelectAEndTimeVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/2/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import IQDropDownTextField

class SelectAEndTimeVC: UIViewController, IQDropDownTextFieldDelegate {

    @IBOutlet var txtEndDate: IQDropDownTextField?
    @IBOutlet var txtalertBeforeEndDate: IQDropDownTextField?
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        btnNext.setCornerRadious(btnNext.frame.height/2)
        
        txtEndDate?.setLeftMargin(8)
        txtEndDate?.setCornerRadious(4)
        txtEndDate?.isOptionalDropDown = false
        txtEndDate?.dropDownMode = IQDropDownMode.dateTimePicker
        txtEndDate?.setDate(startDate?.addMinutes(30), animated: true)
        txtEndDate?.minimumDate = startDate?.addMinutes(30)
        endDate = startDate?.addMinutes(30)
        
        
        txtalertBeforeEndDate?.setLeftMargin(8)
        txtalertBeforeEndDate?.setCornerRadious(4)
        txtalertBeforeEndDate?.isOptionalDropDown = false
        txtalertBeforeEndDate?.itemList = alertDurations
        alertBeforeEndDate = alertDurations[0]
        
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
        endDate = date
        print(date)
    }
    
    func textField(_ textField: IQDropDownTextField, didSelectItem item: String?) {
        alertBeforeEndDate = item
    }
    
    @IBAction func actionBackButton(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func actionNextButton(_ sender: AnyObject) {
        //self.navigationController!.popViewControllerAnimated(true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CongratsVC") as? CongratsVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }

}
