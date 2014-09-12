//
//  Date.swift
//  Track It
//
//  Created by Niclas Günther on 12.09.14.
//  Copyright (c) 2014 Niclas Günther. All rights reserved.
//

import Foundation
import UIKit

class Date {
    
    class func from(#year:Int, month:Int, day:Int) -> NSDate {
        
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        var gregorian = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorian.dateFromComponents(c)
        
        return date!
    }

    class func toString(#date:NSDate) -> String {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormatter.stringFromDate(date)
        
        return dateString
    }
}