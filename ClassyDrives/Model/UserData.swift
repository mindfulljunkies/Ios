//
//  UserData.swift
//  ClassyDrives
//
//  Created by apple on 27/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
public class UserData {
    
    public var user_image: String?
    public var user_name: String?
    public var userid: String?
  
    
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserData]
    {
        var models:[UserData] = []
        for item in array
        {
            models.append(UserData(dictionary: item as! NSDictionary)!)
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
        
        user_image = dictionary["user_image"] as? String
        user_name = dictionary["user_name"] as? String
        userid = dictionary["userid"] as? String
    
    }
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        return dictionary
    }
    
}
