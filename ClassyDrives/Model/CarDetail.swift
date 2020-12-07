//
//  CarDetail.swift
//  ClassyDrives
//
//  Created by apple on 12/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
public class CarDetail {
    
    public var car_color: String?
    public var car_id: String?
    
    public var car_image : String?
    public var car_model : String?
    
    public var car_name: String?
    public var car_user: Int?
    
    public var car_year : Int?
    public var created_date : String?
    public var is_delete : Int?
    public var last_updated : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [CarDetail]
    {
        var models:[CarDetail] = []
        for item in array
        {
            models.append(CarDetail(dictionary: item as! NSDictionary)!)
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
        
        car_color = dictionary["car_color"] as? String
        car_id = dictionary["car_id"] as? String
        car_image = dictionary["car_image"] as? String
        car_model = dictionary["car_model"] as? String ?? ""
        car_name = dictionary["car_name"] as? String ?? ""
        car_user = dictionary["car_user"] as? Int
        car_year = dictionary["car_year"] as? Int
        created_date = dictionary["created_date"] as? String
        is_delete = dictionary["is_delete"] as? Int
          last_updated = dictionary["last_updated"] as? String
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
