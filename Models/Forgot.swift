//
//  Forgot.swift
//  ExpressAuto-ios
//
//  Created by Gurpreet Singh on 19/02/19.
//  Copyright © 2019 Gurpreet Singh. All rights reserved.
//

import Foundation

enum ForgotAttributes: String {
    
    case type = "type"
    case text = "text"
    case subject = "subject"
}

public class Forgot {
    public var type : String?
    public var text : String?
    public var subject : String?
    public var phone : String?
    public var reportingPerson : String?
    
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let json4Swift_Base_list = Notification.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Notification Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Forgot]
    {
        var models:[Forgot] = []
        for item in array
        {
            models.append(Forgot(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let json4Swift_Base = Notification(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Notification Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        type = dictionary["type"] as? String
        text = dictionary["text"] as? String
        subject = dictionary["subject"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.type, forKey: "type")
        dictionary.setValue(self.text, forKey: "text")
        dictionary.setValue(self.subject, forKey: "subject")
        return dictionary
    }
    
}
