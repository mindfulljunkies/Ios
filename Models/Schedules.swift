//
//  Schedules.swift
//  Tana
//
//  Created by Gurpreet Singh on 17/06/19.
//  Copyright © 2019 Gurpreet Singh. All rights reserved.
//

import Foundation

public class Schedules {
    
    public var id : Int?
    public var name : String?
    public var date : String?
    public var selected : Bool?

    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Schedules]
    {
        var models:[Schedules] = []
        for item in array
        {
            models.append(Schedules(dictionary: item as! NSDictionary)!)
        }
        return models
        
    }
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let User = User(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: User Instance.
     */
    required public init?(dictionary: NSDictionary) {
        print(dictionary)
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        date = dictionary["date"] as? String
        selected = dictionary["selected"] as? Bool ?? false

    }
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.date, forKey: "date")
        dictionary.setValue(self.selected, forKey: "selected")

        
        return dictionary
    }
    
}
