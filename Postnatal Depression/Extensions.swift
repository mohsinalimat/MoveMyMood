//
//  Extensions.swift
//  Postnatal Depression
//
//  Created by iParth on 1/2/17.
//  Copyright © 2017 Harloch. All rights reserved.
//

import Foundation
import UIKit


extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.sharedApplication()
        for url in urls {
            if application.canOpenURL(NSURL(string: url)!) {
                application.openURL(NSURL(string: url)!)
                return
            }
        }
    }
}

extension UIApplication {
    class func topViewController(base: UIViewController? = (UIApplication.sharedApplication().delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIView {
    public func setBorder(width:CGFloat = 1, color: UIColor = UIColor.darkGrayColor())
    {
        self.layer.borderColor = color.CGColor
        self.layer.borderWidth = width
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    public func setCornerRadious(radious:CGFloat = 4)
    {
        self.layer.cornerRadius = radious ?? 4
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}

extension UITextField {
    public func setLeftMargin(marginWidth:CGFloat = 4)
    {
        let paddingLeft = UIView(frame: CGRectMake(0, 0, marginWidth, self.frame.size.height))
        self.leftView = paddingLeft
        self.leftViewMode = UITextFieldViewMode .Always
    }
    public func setRightMargin(marginWidth:CGFloat = 4)
    {
        let paddingRight = UIView(frame: CGRectMake(0, 0, marginWidth, self.frame.size.height))
        self.rightView = paddingRight
        self.rightViewMode = UITextFieldViewMode .Always
    }
}

private var maxLengths = [UITextField: Int]()

extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            addTarget(
                self,
                action: #selector(limitLength),
                forControlEvents: UIControlEvents.EditingChanged
            )
        }
    }
    
    func limitLength(textField: UITextField) {
        guard let prospectiveText = textField.text
            where prospectiveText.characters.count > maxLength else {
                return
        }
        
        let selection = selectedTextRange
        text = prospectiveText.substringWithRange(
            Range<String.Index>(prospectiveText.startIndex ..< prospectiveText.startIndex.advancedBy(maxLength))
        )
        selectedTextRange = selection
    }
    
}

extension UIButton {
    
    func alignImageAndTitleVertically(padding: CGFloat = 6.0) {
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
        let totalHeight = imageSize.height + titleSize.height + padding
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: 0,
            bottom: 0,
            right: -titleSize.width
        )
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }
    
}

extension NSDateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat =  dateFormat
    }
}


extension NSDate {
    struct Formatter {
        //user_upload_time : Format (YYYY-MM-DD HH:MM:SS) 2016-08-02 11:22:11 (24 hours)
        static let custom = NSDateFormatter(dateFormat: "yyyy-MM-dd, HH:mm:ss")
        static let customUTC = NSDateFormatter(dateFormat: "yyyy-MM-dd, HH:mm:ss")
    }
    var strDateInLocal: String {
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        //formatter.timeZone = NSTimeZone.localTimeZone()        // or as local time
        return Formatter.custom.stringFromDate(self)
    }
    var strDateInUTC: String {
        Formatter.customUTC.timeZone = NSTimeZone(name: "UTC")
        return Formatter.customUTC.stringFromDate(self)
    }
    func formattedWith(format:String? = "dd MMM yyyy")-> String {
        let formatter = NSDateFormatter()
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        formatter.timeZone = NSTimeZone.localTimeZone()        // or as local time
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
}

extension String {
    

    var asDateLocal: NSDate? {
        return NSDate.Formatter.custom.dateFromString(self)
    }
    var asDateUTC: NSDate? {
        NSDate.Formatter.customUTC.timeZone = NSTimeZone(name: "UTC")
        return NSDate.Formatter.customUTC.dateFromString(self)
    }
    func asDateFormatted(with dateFormat: String) -> NSDate? {
        return NSDateFormatter(dateFormat: dateFormat).dateFromString(self)
    }
    var asDateFromMiliseconds: NSDate? {
        if let interval = Double(self) {
            return NSDate.init(timeIntervalSince1970: interval)
        }
        return nil
    }
    
    func convertToDictionary() -> [String:AnyObject]? {
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: [.AllowFragments]) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}

extension Double {
    var asDateFromMiliseconds: NSDate {
        return NSDate.init(timeIntervalSince1970: self)
    }
}

extension NSDate {
    
    func getElapsedInterval() -> String {
        
        var interval = NSCalendar.currentCalendar().components(.Year, fromDate: self, toDate: NSDate(), options: []).year
        
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "year ago" :
                "\(interval)" + " " + "years ago"
        }
        
        interval = NSCalendar.currentCalendar().components(.Month, fromDate: self, toDate: NSDate(), options: []).month
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "month ago" :
                "\(interval)" + " " + "months ago"
        }
        
        interval = NSCalendar.currentCalendar().components(.Day, fromDate: self, toDate: NSDate(), options: []).day
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "day ago" :
                "\(interval)" + " " + "days ago"
        }
        
        interval = NSCalendar.currentCalendar().components(.Hour, fromDate: self, toDate: NSDate(), options: []).hour
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "hour ago" :
                "\(interval)" + " " + "hours ago"
        }
        
        interval = NSCalendar.currentCalendar().components(.Minute, fromDate: self, toDate: NSDate(), options: []).minute
        if interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "minute ago" :
                "\(interval)" + " " + "minutes ago"
        }
        
        return "a moment ago"
    }
}

extension NSDate {
    func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending {
            isLess = true
        }
        //NSCalendar.currentCalendar().compareDate(now, toDate: olderDate,toUnitGranularity: .Day)
        //Return Result
        return isLess
    }
    
    func isExpiredDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if NSCalendar.currentCalendar().compareDate(self, toDate: dateToCompare, toUnitGranularity: .Day) == NSComparisonResult.OrderedAscending {
            isLess = true
        }
        //
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addDays(daysToAdd: Int) -> NSDate {
        let secondsInDays: NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: NSDate = self.dateByAddingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd: Int) -> NSDate {
        let secondsInHours: NSTimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: NSDate = self.dateByAddingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
    
    func addMinutes(minutesToAdd: Int) -> NSDate {
        let secondsInMinutes: NSTimeInterval = Double(minutesToAdd) * 60
        let dateWithHoursAdded: NSDate = self.dateByAddingTimeInterval(secondsInMinutes)
        
        //Return Result
        return dateWithHoursAdded
    }
}


func compareDateWithUnit(date1: NSDate, toDate date2: NSDate, toUnitGranularity unit: NSCalendarUnit) -> NSComparisonResult {
    let now = NSDate()
    // "Sep 23, 2015, 10:26 AM"
    
    let olderDate = NSDate(timeIntervalSinceNow: -10000)
    // "Sep 23, 2015, 7:40 AM"
    
    var order = NSCalendar.currentCalendar().compareDate(now, toDate: olderDate,toUnitGranularity: .Hour)
    switch order {
        case .OrderedDescending:
            print("DESCENDING")
        case .OrderedAscending:
            print("ASCENDING")
        case .OrderedSame:
            print("SAME")
    }
    // Compare to hour: DESCENDING
    
    order = NSCalendar.currentCalendar().compareDate(now, toDate: olderDate,toUnitGranularity: .Day)
    
    switch order {
    case .OrderedDescending:
        print("DESCENDING")
    case .OrderedAscending:
        print("ASCENDING")
    case .OrderedSame:
        print("SAME")
    }
    // Compare to day: SAME
    
    return order
}
