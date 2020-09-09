//
//  Date.swift
//  ClassyDrives
//
//  Created by Shami Kapoor on 03/12/19.
//  Copyright © 2019 Safal Bhatia. All rights reserved.
//

import Foundation
extension String
{
    
    func convertDateFormatMy(inputDate: String) -> String {

        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
       guard let  date = formatter.date(from:inputDate) else {return ""}
        formatter.dateFormat = "MMM-dd-yyyy"
        print(formatter.string(from: date))
        
        return formatter.string(from: date)
        
        
        
    }
    
    
     func getCurrentShortDate() -> String {
        let todaysDate = NSDate()
        let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM-dd-yyyy"
        let DateInFormat = dateFormatter.string(from: todaysDate as Date)

    return DateInFormat
}
    
    func localToUTC(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current

        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"

        return dateFormatter.string(from: dt ?? Date())
    }

    func UTCToLocal(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let dt = dateFormatter.date(from: date)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "h:mm a"

        return dateFormatter.string(from: dt!)
    }
}
