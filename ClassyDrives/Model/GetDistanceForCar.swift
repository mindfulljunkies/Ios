//
//  GetDistanceForCar.swift
//  ClassyDrives
//
//  Created by apple on 12/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
public class GetDistance {
    
    public var amount: Int?
    public var api_status: String?
    
    public var distance : Double?
    public var message : String?
  
    public var mmiles: String?
    public var status: Int?
    
    public var stringTime : Double?
    public var time : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [GetDistance]
    {
        var models:[GetDistance] = []
        for item in array
        {
            models.append(GetDistance(dictionary: item as! NSDictionary)!)
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
        
        amount = dictionary["amount"] as? Int
        api_status = dictionary["api_status"] as? String
        distance = dictionary["distance"] as? Double
        message = dictionary["message"] as? String
        amount = dictionary["amount"] as? Int
        status = dictionary["status"] as? Int
        stringTime = dictionary["stringTime"] as? Double
        time = dictionary["time"] as? String
        mmiles = dictionary["mmiles"] as? String

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
