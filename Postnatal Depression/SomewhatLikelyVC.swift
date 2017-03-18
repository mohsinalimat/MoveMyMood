//
//  SomewhatLikelyVC.swift
//  Postnatal Depression
//
//  Created by iParth on 1/4/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import IQDropDownTextField

class SomewhatLikelyVC: UIViewController, IQDropDownTextFieldDelegate {
    
    @IBOutlet var txtBarrier: IQDropDownTextField?
    @IBOutlet var txtBarrierSolution: IQDropDownTextField?
    @IBOutlet weak var btnEasierActivity: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        btnEasierActivity.setCornerRadious(btnEasierActivity.frame.height/2)
        btnNext.setCornerRadious(btnNext.frame.height/2)
        
        txtBarrier?.setLeftMargin(8)
        txtBarrier?.setCornerRadious(4)
        txtBarrier?.isOptionalDropDown = true
        txtBarrier?.itemList = Barriers
        
        txtBarrierSolution?.setLeftMargin(8)
        txtBarrierSolution?.setCornerRadious(4)
        txtBarrierSolution?.isOptionalDropDown = true
        txtBarrierSolution?.itemList = BarriersSolution
        
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
    
    @IBAction func actionEasierActivityButton(_ sender: AnyObject) {
        //self.navigationController!.popViewControllerAnimated(true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListActivityRatesVC") as? ListActivityRatesVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func actionNextButton(_ sender: AnyObject) {
        //self.navigationController!.popViewControllerAnimated(true)
        
        //let vc = self.storyboard?.instantiateViewControllerWithIdentifier("") as?
        //self.navigationController?.pushViewController(vc!, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HowAccomplishVC") as? HowAccomplishVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
