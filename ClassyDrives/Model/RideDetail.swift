//
//  RideDetail.swift
//  ClassyDrives
//
//  Created by apple on 17/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
public class RideDetail {
    
    public var bank_id: String?
    public var bio: String?
    public var book_amount : String?
    public var book_amount_to_user : String?
    public var book_card_id: String?
    public var book_card_id_status: String?
    public var book_code : String?
    public var book_coupon : String?
    public var book_create : String?
    public var book_date : String?
    
    public var book_distance: String?
    public var book_elapsedtime: String?
    public var book_from_address : String?
    public var book_from_lat : String?
    public var book_from_long: String?
    public var book_id: Int?
    public var book_reason : Int?
    public var book_reason_text : String?
    public var book_ride : String?
    public var book_seat : String?
    
    public var book_status: String?
    public var book_to_address: String?
    public var book_to_lat : String?
    public var book_to_long : String?
    public var book_user: String?
    public var cancel_reason: Int?
    public var car_id : String?
    public var charge_id : Int?
    public var city : String?
    public var comment : String?
    public var car_model : String?
    public var car_name : String?

    public var contact: Int?
    public var detour: String?
    public var detour_miles : String?
    public var dob : String?
    public var email: String?
    public var firstname: String?
    public var id : Int?
    public var is_autoapproval : String?
    public var is_local_ride : String?
    public var lastname : String?
    
    public var login_type: Int?
    public var mobile: String?
    public var pic : String?
    public var rating : String?
    public var returned_amount: String?
    public var ride_about: String?
    public var ride_amount : String?
    public var ride_create : String?
    public var ride_date : String?
    public var ride_distance : String?
    
    public var ride_duration: String?
    public var ride_from_address: String?
    public var ride_from_address2 : String?
    public var ride_from_address3 : String?
    
    public var ride_from_lat: String?
    public var ride_from_lat2: String?
    public var ride_from_lat3 : String?
    public var ride_from_lat4 : String?

    public var ride_from_long : String?
    public var ride_from_long2 : String?
    public var ride_from_long3 : String?
    public var ride_from_long4 : String?

    public var ride_id: String?
    public var ride_seat: Int?
    public var ride_status : String?
    public var ride_time : String?
    public var ride_to_address: String?
    public var ride_to_lat: String?
    public var ride_to_long : String?
    public var ride_user : String?
    public var state : String?
    public var wallet : String?
    public var zip : String?

    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [RideDetail]
    {
        var models:[RideDetail] = []
        for item in array
        {
            models.append(RideDetail(dictionary: item as! NSDictionary)!)
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
        
        bank_id = dictionary["bank_id"] as? String
        bio = dictionary["bio"] as? String
        book_amount = dictionary["book_amount"] as? String
        book_amount_to_user = dictionary["book_amount_to_user"] as? String
        book_card_id = dictionary["book_card_id"] as? String
        book_card_id_status = dictionary["book_card_id_status"] as? String
        book_code = dictionary["book_code"] as? String
        book_coupon = dictionary["book_coupon"] as? String
        book_create = dictionary["book_create"] as? String
        book_date = dictionary["book_date"] as? String
        
        book_distance = dictionary["book_distance"] as? String
        book_from_lat = dictionary["book_from_lat"] as? String
        book_elapsedtime = dictionary["book_elapsedtime"] as? String
        book_from_address = dictionary["book_from_address"] as? String
        book_from_long = dictionary["book_from_long"] as? String
        book_id = dictionary["book_id"] as? Int
        book_reason = dictionary["book_reason"] as? Int
        book_reason_text = dictionary["book_reason_text"] as? String
        book_ride = dictionary["book_ride"] as? String
        book_seat = dictionary["book_seat"] as? String
        
        book_status = dictionary["book_status"] as? String
        book_to_address = dictionary["book_to_address"] as? String
        book_to_lat = dictionary["book_to_lat"] as? String
        book_to_long = dictionary["book_to_long"] as? String
        book_user = dictionary["book_user"] as? String
        cancel_reason = dictionary["cancel_reason"] as? Int
        car_id = dictionary["car_id"] as? String
        charge_id = dictionary["charge_id"] as? Int
        city = dictionary["city"] as? String
        comment = dictionary["comment"] as? String
        car_model = dictionary["car_model"] as? String

        contact = dictionary["contact"] as? Int
        detour = dictionary["detour"] as? String
        detour_miles = dictionary["detour_miles"] as? String
        dob = dictionary["dob"] as? String
        email = dictionary["email"] as? String
        firstname = dictionary["firstname"] as? String
        id = dictionary["id"] as? Int
        is_autoapproval = dictionary["is_autoapproval"] as? String
        is_local_ride = dictionary["is_local_ride"] as? String
        lastname = dictionary["lastname"] as? String
        
        login_type = dictionary["login_type"] as? Int
        car_id = dictionary["car_id"] as? String
        mobile = dictionary["mobile"] as? String
        pic = dictionary["pic"] as? String
        rating = dictionary["rating"] as? String
        returned_amount = dictionary["returned_amount"] as? String
        ride_about = dictionary["ride_about"] as? String
        ride_amount = dictionary["ride_amount"] as? String
        ride_create = dictionary["ride_create"] as? String
        ride_date = dictionary["ride_date"] as? String
        
        ride_distance = dictionary["ride_distance"] as? String
        ride_duration = dictionary["ride_duration"] as? String
        ride_from_address = dictionary["ride_from_address"] as? String
        ride_from_address2 = dictionary["ride_from_address2"] as? String
        ride_from_address3 = dictionary["ride_from_address3"] as? String
        ride_from_lat = dictionary["ride_from_lat"] as? String
        ride_from_lat2 = dictionary["ride_from_lat2"] as? String
        ride_from_lat3 = dictionary["ride_from_lat3"] as? String
        ride_from_long = dictionary["ride_from_long"] as? String
        ride_from_long2 = dictionary["ride_from_long2"] as? String
        ride_from_long3 = dictionary["ride_from_long3"] as? String
        car_name = dictionary["car_name"] as? String

               
        
        car_id = dictionary["car_id"] as? String
        ride_seat = dictionary["ride_seat"] as? Int
        ride_status = dictionary["ride_status"] as? String
        ride_time = dictionary["ride_time"] as? String
        ride_to_address = dictionary["ride_to_address"] as? String
        ride_to_lat = dictionary["ride_to_lat"] as? String
        ride_to_long = dictionary["ride_to_long"] as? String
        ride_user = dictionary["ride_user"] as? String
        state = dictionary["state"] as? String
        wallet = dictionary["wallet"] as? String
        zip = dictionary["zip"] as? String
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
