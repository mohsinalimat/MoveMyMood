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
    class func tryURL(_ urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                application.openURL(URL(string: url)!)
                return
            }
        }
    }
}

extension UIApplication {
    class func topViewController(_ base: UIViewController? = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController) -> UIViewController? {
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
    public func setBorder(_ width:CGFloat = 1, color: UIColor = UIColor.darkGray)
    {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    public func setCornerRadious(_ radious:CGFloat = 4)
    {
        self.layer.cornerRadius = radious 
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}

extension UITextField {
    public func setLeftMargin(_ marginWidth:CGFloat = 4)
    {
        let paddingLeft = UIView(frame: CGRect(x: 0, y: 0, width: marginWidth, height: self.frame.size.height))
        self.leftView = paddingLeft
        self.leftViewMode = UITextFieldViewMode .always
    }
    public func setRightMargin(_ marginWidth:CGFloat = 4)
    {
        let paddingRight = UIView(frame: CGRect(x: 0, y: 0, width: marginWidth, height: self.frame.size.height))
        self.rightView = paddingRight
        self.rightViewMode = UITextFieldViewMode .always
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
                for: UIControlEvents.editingChanged
            )
        }
    }
    
    func limitLength(_ textField: UITextField) {
        guard let prospectiveText = textField.text, prospectiveText.characters.count > maxLength else {
                return
        }
        
        let selection = selectedTextRange
        text = prospectiveText.substring(
            with: Range<String.Index>(prospectiveText.startIndex ..< prospectiveText.characters.index(prospectiveText.startIndex, offsetBy: maxLength))
        )
        selectedTextRange = selection
    }
    
}

extension UIButton {
    
    func alignImageAndTitleVertically(_ padding: CGFloat = 6.0) {
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

extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat =  dateFormat
    }
}


extension Date {
    struct Formatter {
        //user_upload_time : Format (YYYY-MM-DD HH:MM:SS) 2016-08-02 11:22:11 (24 hours)
        static let custom = DateFormatter(dateFormat: "yyyy-MM-dd, HH:mm:ss")
        static let customUTC = DateFormatter(dateFormat: "yyyy-MM-dd, HH:mm:ss")
    }
    var strDateInLocal: String {
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        //formatter.timeZone = NSTimeZone.localTimeZone()        // or as local time
        return Formatter.custom.string(from: self)
    }
    var strDateInUTC: String {
        Formatter.customUTC.timeZone = TimeZone(identifier: "UTC")
        return Formatter.customUTC.string(from: self)
    }
    func formattedWith(_ format:String? = "dd MMM yyyy")-> String {
        let formatter = DateFormatter()
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)  // you can set GMT time
        formatter.timeZone = TimeZone.autoupdatingCurrent        // or as local time
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension String {
    

    var asDateLocal: Date? {
        return Date.Formatter.custom.date(from: self)
    }
    var asDateUTC: Date? {
        Date.Formatter.customUTC.timeZone = TimeZone(identifier: "UTC")
        return Date.Formatter.customUTC.date(from: self)
    }
    func asDateFormatted(with dateFormat: String) -> Date? {
        return DateFormatter(dateFormat: dateFormat).date(from: self)
    }
    var asDateFromMiliseconds: Date? {
        if let interval = Double(self) {
            return Date.init(timeIntervalSince1970: interval)
        }
        return nil
    }
    
    func convertToDictionary() -> [String:AnyObject]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: [.allowFragments]) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}

extension Double {
    var asDateFromMiliseconds: Date {
        return Date.init(timeIntervalSince1970: self)
    }
}

extension Date {
    
    func getElapsedInterval() -> String {
        
        var interval = (Calendar.current as NSCalendar).components(.year, from: self, to: Date(), options: []).year
        
        if interval! > 0 {
            return interval == 1 ? "\(interval)" + " " + "year ago" :
                "\(interval)" + " " + "years ago"
        }
        
        interval = (Calendar.current as NSCalendar).components(.month, from: self, to: Date(), options: []).month
        if interval! > 0 {
            return interval == 1 ? "\(interval)" + " " + "month ago" :
                "\(interval)" + " " + "months ago"
        }
        
        interval = (Calendar.current as NSCalendar).components(.day, from: self, to: Date(), options: []).day
        if interval! > 0 {
            return interval == 1 ? "\(interval)" + " " + "day ago" :
                "\(interval)" + " " + "days ago"
        }
        
        interval = (Calendar.current as NSCalendar).components(.hour, from: self, to: Date(), options: []).hour
        if interval! > 0 {
            return interval == 1 ? "\(interval)" + " " + "hour ago" :
                "\(interval)" + " " + "hours ago"
        }
        
        interval = (Calendar.current as NSCalendar).components(.minute, from: self, to: Date(), options: []).minute
        if interval! > 0 {
            return interval == 1 ? "\(interval)" + " " + "minute ago" :
                "\(interval)" + " " + "minutes ago"
        }
        
        return "a moment ago"
    }
}

extension Date {
    func isGreaterThanDate(_ dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(_ dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }
        //NSCalendar.currentCalendar().compareDate(now, toDate: olderDate,toUnitGranularity: .Day)
        //Return Result
        return isLess
    }
    
    func isExpiredDate(_ dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if (Calendar.current as NSCalendar).compare(self, to: dateToCompare, toUnitGranularity: .day) == ComparisonResult.orderedAscending {
            isLess = true
        }
        //
        //Return Result
        return isLess
    }
    
    func equalToDate(_ dateToCompare: Date) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addDays(_ daysToAdd: Int) -> Date {
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: Date = self.addingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(_ hoursToAdd: Int) -> Date {
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
    
    func addMinutes(_ minutesToAdd: Int) -> Date {
        let secondsInMinutes: TimeInterval = Double(minutesToAdd) * 60
        let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInMinutes)
        
        //Return Result
        return dateWithHoursAdded
    }
}


func compareDateWithUnit(_ date1: Date, toDate date2: Date, toUnitGranularity unit: NSCalendar.Unit) -> ComparisonResult {
    let now = Date()
    // "Sep 23, 2015, 10:26 AM"
    
    let olderDate = Date(timeIntervalSinceNow: -10000)
    // "Sep 23, 2015, 7:40 AM"
    
    var order = (Calendar.current as NSCalendar).compare(now, to: olderDate,toUnitGranularity: .hour)
    switch order {
        case .orderedDescending:
            print("DESCENDING")
        case .orderedAscending:
            print("ASCENDING")
        case .orderedSame:
            print("SAME")
    }
    // Compare to hour: DESCENDING
    
    order = (Calendar.current as NSCalendar).compare(now, to: olderDate,toUnitGranularity: .day)
    
    switch order {
    case .orderedDescending:
        print("DESCENDING")
    case .orderedAscending:
        print("ASCENDING")
    case .orderedSame:
        print("SAME")
    }
    // Compare to day: SAME
    
    return order
}
