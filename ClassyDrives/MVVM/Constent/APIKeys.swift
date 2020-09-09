//
//  APIKeys.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation

//let BASE_URL = "https://classydrives.mindfulljunkies.com/api/"

let BASE_URL = "https://classydrives.com/api/"
let kMessage = "kMessage"
let  kLoginStatus = "kLoginStatus"
//if (UserDefaults.standard.value(forKey: "LoginUser")) != nil{
//    if let value = UserDefaults.standard.value(forKey: "LoginUser") as? NSDictionary{
//        
//    }
//}



class APIKeys {
    static let kstatus = "status"
    static let kmessage = "message"
    static let kemail = "email"
    static let kpassword = "password"
    static let kdevice_type = "device_type"
    static let kdevice_token = "device_token"
    static let kdevice_id = "device_id"
    static let kfirstname = "firstname"
    static let klastname = "lastname"
    static let kdob = "dob"
    static let kcity = "city"
    static let kstate = "state"
    static let kzip = "zip"
    static let kbio = "bio"
    static let kmobile = "mobile"
    static let kstate_id = "state_id"
    static let kride_user = "ride_user"
    static let kride_from_address = "ride_from_address"
    static let kride_from_address2 = "ride_from_address2"
    static let kride_from_address3 = "ride_from_address3"
    static let kride_to_address = "ride_to_address"
    static let kride_from_lat = "ride_from_lat"
    static let kride_from_long = "ride_from_long"
    static let kride_to_lat = "ride_to_lat"
    static let kride_to_long = "ride_to_long"
    static let kride_from_lat2 = "ride_from_lat2"
    static let kride_from_long2 = "ride_from_long2"
    static let kride_from_lat3 = "ride_from_lat3"
    static let kride_from_long3 = "ride_from_long3"
    static let kride_date = "ride_date"
    static let kride_time = "ride_time"
    static let kride_amount = "ride_amount"
    static let kride_seat = "ride_seat"
    static let kride_about = "ride_about"
    static let kcar_id = "car_id"
    
    static let kcar_type = "car_type"

    static let kID = "ID"
    static let kSTATE_CODE = "STATE_CODE"
    static let kSTATE_NAME = "STATE_NAME"
    static let kCITY = "CITY"
    static let kCOUNTY = "COUNTY"
    static let kLATITUDE = "LATITUDE"
    static let kLONGITUDE = "LONGITUDE"
    static let kcar_name = "car_name"
    static let kcar_model = "car_model"
    static let kcar_year = "car_year"
    static let kcar_image = "car_image"
    static let kcar_user = "car_user"
    static let kuserid = "userid"
    static let kfrom_address = "from_address"
    static let kto_address = "to_address"
    static let kfrom_lat = "from_lat"
    static let kfrom_long = "from_long"
    static let kto_lat = "to_lat"
    static let kto_long = "to_long"
    static let kdate = "date"
    static let kprice = "price"
    static let kride_id = "ride_id"
    
    static let kcar_color = "car_color"

 //   static let kride_id = "ride_id"

    static let kbank_id = "bank_id"
    static let kdetour = "detour"
    static let kcarmaker = "carmaker"
    static let kpic = "pic"
    static let kotp = "otp"
    static let kuser_id = "user_id"
    static let kcard_id = "card_id"
    static let klast4 = "last4"
    static let kcard_data = "card_data"
    static let kcard = "card"
   
    static let kadd_amount = "add_amount"
    
    static let kbank_data = "bank_data"
    static let kbank_account = "bank_account"
    static let kid = "id"
    static let kwallet = "wallet"
    static let krating = "rating"
    static let krouting_number = "routing_number"
    static let kaccount_number = "account_number"
    static let kcard_number = "card_number"
    static let kexp_month = "exp_month"
    static let kcvv = "cvv"
    static let kexp_year = "exp_year"
    static let kcard_type = "card_type"
    static let kbook_seat = "book_seat"
    static let kbook_ride = "book_ride"
    static let kseat = "seat"
    
     static let kIsAleradyBooked = "is_already_booked"
    
    
    static let kIsSeatsAvailable = "is_seats_available"
    
 
    
    
    static let kpickup_distance = "pickup_distance"
    static let kdropup_distance = "dropup_distance"
    static let kdiscountAmount = "discountAmount"
    static let kapplied_id = "applied_id"
    
    static let kbook_amount = "book_amount"
    static let kbook_distance = "book_distance"
    static let kbook_elapsedtime = "book_elapsedtime"
    static let kbook_card_id = "book_card_id"
    static let kdistance = "distance"
    static let kelapsedtime = "elapsedtime"
    static let kbook_id = "book_id"
    static let kbook_user = "book_user"
    static let kbook_from_address = "book_from_address"
    static let kbook_to_address = "book_to_address"
    static let kbook_date = "book_date"
    static let kreason_id = "reason_id"
    static let kreason_name = "reason_name"
    static let kbook_reason_text = "book_reason_text"
    static let kcurrentTime = "currentTime"

    static let kaction = "action"
    static let kbook_status = "book_status"
    static let kcomment = "comment"
    static let kcancel_reason = "cancel_reason"
    static let kis_local_ride = "is_local_ride"
     static let kcurrent_time = "current_time"
    static let kis_autoapproval = "is_autoapproval"
    static let kride_distance = "ride_distance"
    static let kride_duration =  "ride_duration"
    static let kbook_create = "book_create"
    static let kbook_code = "book_code"
    static let kuser_name = "user_name"
    static let kuser_image =  "user_image"
    static let kChat_History = "Chat_History"
    static let kUser1 = "user1"
    static let kUser2 = "user2"
    static let kLastMsg = "lastMessage"
   static let kunread_count = "unread_count"
    static let ksenderId = "senderId"
    static let kMessageList = "MessagesList"
    static let kreceiverId = "receiverId"
    
  
    
   

}

protocol DataEnteredDelegate {
    func selectedData(name: String, Id: String, txtValue: Int)
}
