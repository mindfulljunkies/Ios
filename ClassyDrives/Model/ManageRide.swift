//
//  ManageRide.swift
//  ClassyDrives
//
//  Created by apple on 17/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
public class ManageRides {
    
    public var count_booked_ride: Int?
    public var booked_ride: [RideDetail]?
    public var current_offer_ride: [RideDetail]?

    
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [ManageRides]
    {
        var models:[ManageRides] = []
        for item in array
        {
            models.append(ManageRides(dictionary: item as! NSDictionary)!)
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
        
        count_booked_ride = dictionary["count_booked_ride"] as? Int
        if (dictionary["booked_ride"]) != nil{
            if (dictionary["booked_ride"]) is NSNull{
                return
            }
            booked_ride = RideDetail.modelsFromDictionaryArray(array: dictionary["booked_ride"] as! NSArray)
        }
        
        if (dictionary["current_offer_ride"]) != nil{
            if (dictionary["current_offer_ride"]) is NSNull{
                return
            }
            current_offer_ride = RideDetail.modelsFromDictionaryArray(array: dictionary["current_offer_ride"] as! NSArray)
        }
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
