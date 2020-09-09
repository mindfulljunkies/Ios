//
//  Event.swift
//  Tana
//
//  Created by Gurpreet Singh on 17/06/19.
//  Copyright © 2019 Gurpreet Singh. All rights reserved.
//

import Foundation

public class Event {

    public var id : Int?
    public var name : String?
    public var time : String?
    public var room : String?
    public var scheduleId : Int?
    public var imgUrl : String?
    public var description : String?

    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Event]
    {
        var models:[Event] = []
        for item in array
        {
            models.append(Event(dictionary: item as! NSDictionary)!)
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
        time = dictionary["time"] as? String
        room = dictionary["room"] as? String
        scheduleId = dictionary["scheduleId"] as? Int
        imgUrl = dictionary["imgUrl"] as? String
        description = dictionary["description"] as? String

        
    }
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.time, forKey: "time")
        dictionary.setValue(self.room, forKey: "room")
        dictionary.setValue(self.scheduleId, forKey: "scheduleId")
        dictionary.setValue(self.imgUrl, forKey: "imgUrl")
        dictionary.setValue(self.description, forKey: "description")

        return dictionary
    }
    
}
