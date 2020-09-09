//
//  OfferRideDetail.swift
//  ClassyDrives
//
//  Created by apple on 12/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
public class OfferRideDetailModel {
    
    public var status: Int?
    public var message: String?
    
    public var count_userbank : Int?
    public var get_distance : GetDistance?
   
  
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [OfferRideDetailModel]
    {
        var models:[OfferRideDetailModel] = []
        for item in array
        {
            models.append(OfferRideDetailModel(dictionary: item as! NSDictionary)!)
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
        
        status = dictionary["status"] as? Int
        count_userbank = dictionary["count_userbank"] as? Int
        message = dictionary["message"] as? String
        if (dictionary["get_distance"] != nil) { get_distance = GetDistance(dictionary: dictionary["get_distance"] as! NSDictionary) }
     
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
