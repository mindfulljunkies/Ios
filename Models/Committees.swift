//
//  Committees.swift
//  Tana
//
//  Created by Gurpreet Singh on 17/06/19.
//  Copyright © 2019 Gurpreet Singh. All rights reserved.
//

import Foundation

public class Committees {
    
    public var id : Int?
    public var name : String?
    public var designation : String?
    public var imgUrl : String?
    public var phone : String?
    public var email : String?
    public var isFeatured : Bool?
    public var committeeId : Int?

    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Committees]
    {
        var models:[Committees] = []
        for item in array
        {
            models.append(Committees(dictionary: item as! NSDictionary)!)
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
        designation = dictionary["designation"] as? String
        imgUrl = dictionary["imgUrl"] as? String
        phone = dictionary["phone"] as? String
        email = dictionary["email"] as? String
        isFeatured = dictionary["isFeatured"] as? Bool
        committeeId = dictionary["committeeId"] as? Int

    }
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.designation, forKey: "designation")
        dictionary.setValue(self.imgUrl, forKey: "imgUrl")
        dictionary.setValue(self.phone, forKey: "phone")
        dictionary.setValue(self.email, forKey: "email")
        dictionary.setValue(self.isFeatured, forKey: "isFeatured")
        dictionary.setValue(self.committeeId, forKey: "committeeId")

        return dictionary
    }
    
}
