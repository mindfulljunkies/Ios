//
//  Notification.swift
//  Tana
//
//  Created by Gurpreet Singh on 20/06/19.
//  Copyright © 2019 Gurpreet Singh. All rights reserved.
//

import Foundation

public class Notification {
    
 
    public var id : Int?
    public var title : String?
    public var description : String?
    public var imgUrl : String?
    public var createdAt : String?
    public var time : String?
    public var location : String?

    
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Notification]
    {
        var models:[Notification] = []
        for item in array
        {
            models.append(Notification(dictionary: item as! NSDictionary)!)
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
        title = dictionary["title"] as? String
        description = dictionary["description"] as? String
        imgUrl = dictionary["imgUrl"] as? String
        createdAt = dictionary["createdAt"] as? String
        time = dictionary["time"] as? String
        location = dictionary["location"] as? String

        
        
    }
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.imgUrl, forKey: "imgUrl")
        dictionary.setValue(self.createdAt, forKey: "createdAt")
        dictionary.setValue(self.time, forKey: "time")
        dictionary.setValue(self.location, forKey: "location")

        
        return dictionary
    }
    
}
