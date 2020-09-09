//
//  CommonModel.swift
//  Hair App
//
//  Created by Chandan on 07/04/20.
//  Copyright © 2020 mac3. All rights reserved.
//

import Foundation
struct ArrayResponseModel:Mappable {
   
     var count_booked_ride: Int?
     var status:Int?
     var booked_ride: [RideDetail2]?
     
    enum CodingKeys: String, CodingKey {
        case count_booked_ride  = "count_booked_ride"
        case booked_ride = "booked_ride"
        case status = "status"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        count_booked_ride = try values.decodeIfPresent(Int.self,
                                                       forKey: .count_booked_ride)
       
        status = try values.decodeIfPresent(Int.self, forKey: .status)
              
        guard let genericModel =  try values.decodeIfPresent([RideDetail2].self, forKey: .booked_ride) else{ return }
        
        
        self.booked_ride = genericModel
        
        
     
     }
}






struct RideDetail1:Mappable  {
    let pic: String
    let rideID, carID, bankID, detour: String
    let detourMiles, rideUser, rideFromAddress, rideFromLat: String
    let rideFromLong, rideFromAddress2, rideFromLat2, rideFromLong2: String
    let rideFromAddress3, rideFromLat3, rideFromLong3, rideToAddress: String
    let rideToLat, rideToLong, rideDate, rideTime: String
    let rideDuration, rideDistance, contact: String
    let rideSeat: Int
    let rideAmount, rideAbout, cancelReason, comment: String
    let isLocalRide, isAutoapproval, rideStatus, rideCreate: String
    let id, firstname, lastname, mobile: String
    let email, dob, loginType, city: String
    let state, zip, wallet, bio: String
    let carUser, carName, carColor, carModel: String
    let carYear, carImage, isDelete, createdDate: String
    let lastUpdated, rating: String

    enum CodingKeys: String, CodingKey {
        case pic
        case rideID = "ride_id"
        case carID = "car_id"
        case bankID = "bank_id"
        case detour
        case detourMiles = "detour_miles"
        case rideUser = "ride_user"
        case rideFromAddress = "ride_from_address"
        case rideFromLat = "ride_from_lat"
        case rideFromLong = "ride_from_long"
        case rideFromAddress2 = "ride_from_address2"
        case rideFromLat2 = "ride_from_lat2"
        case rideFromLong2 = "ride_from_long2"
        case rideFromAddress3 = "ride_from_address3"
        case rideFromLat3 = "ride_from_lat3"
        case rideFromLong3 = "ride_from_long3"
        case rideToAddress = "ride_to_address"
        case rideToLat = "ride_to_lat"
        case rideToLong = "ride_to_long"
        case rideDate = "ride_date"
        case rideTime = "ride_time"
        case rideDuration = "ride_duration"
        case rideDistance = "ride_distance"
        case contact
        case rideSeat = "ride_seat"
        case rideAmount = "ride_amount"
        case rideAbout = "ride_about"
        case cancelReason = "cancel_reason"
        case comment
        case isLocalRide = "is_local_ride"
        case isAutoapproval = "is_autoapproval"
        case rideStatus = "ride_status"
        case rideCreate = "ride_create"
        case id, firstname, lastname, mobile, email, dob
        case loginType = "login_type"
        case city, state, zip, wallet, bio
        case carUser = "car_user"
        case carName = "car_name"
        case carColor = "car_color"
        case carModel = "car_model"
        case carYear = "car_year"
        case carImage = "car_image"
        case isDelete = "is_delete"
        case createdDate = "created_date"
        case lastUpdated = "last_updated"
        case rating
    }
}



struct RideDetail2:Mappable  {
    let pic: String
    let bookID, bookUser, bookRide, bookSeat: String
    let bookFromAddress, bookFromLat, bookFromLong, bookToAddress: String
    let bookToLat, bookToLong, pickupDistance, dropupDistance: String
    let bookAmount: String
    let bookCoupon, bookAmountToUser, bookDistance, bookElapsedtime: String
    let bookCardID, chargeID, returnedAmount, bookCardIDStatus: String
    let bookReason, bookReasonText, appliedID, discountPerSeat: String
    let bookCode, bookDate, bookCreate, bookStatus: String
    let rideID, carID, bankID, detour: String
    let detourMiles, rideUser, rideFromAddress, rideFromLat: String
    let rideFromLong, rideFromAddress2, rideFromLat2, rideFromLong2: String
    let rideFromAddress3, rideFromLat3, rideFromLong3, rideToAddress: String
    let rideToLat, rideToLong, rideDate, rideTime: String
    let rideDuration, rideDistance, contact, rideSeat: String
    let rideAmount, rideAbout, cancelReason, comment: String
    let isLocalRide, isAutoapproval, rideStatus, rideCreate: String
    let id, firstname, lastname, mobile: String
    let email, dob, loginType, city: String
    let state, zip, wallet, bio: String
    let rating: String

    enum CodingKeys: String, CodingKey {
        case pic
        case bookID = "book_id"
        case bookUser = "book_user"
        case bookRide = "book_ride"
        case bookSeat = "book_seat"
        case bookFromAddress = "book_from_address"
        case bookFromLat = "book_from_lat"
        case bookFromLong = "book_from_long"
        case bookToAddress = "book_to_address"
        case bookToLat = "book_to_lat"
        case bookToLong = "book_to_long"
        case pickupDistance = "pickup_distance"
        case dropupDistance = "dropup_distance"
        case bookAmount = "book_amount"
        case bookCoupon = "book_coupon"
        case bookAmountToUser = "book_amount_to_user"
        case bookDistance = "book_distance"
        case bookElapsedtime = "book_elapsedtime"
        case bookCardID = "book_card_id"
        case chargeID = "charge_id"
        case returnedAmount = "returned_amount"
        case bookCardIDStatus = "book_card_id_status"
        case bookReason = "book_reason"
        case bookReasonText = "book_reason_text"
        case appliedID = "applied_id"
        case discountPerSeat = "discount_per_seat"
        case bookCode = "book_code"
        case bookDate = "book_date"
        case bookCreate = "book_create"
        case bookStatus = "book_status"
        case rideID = "ride_id"
        case carID = "car_id"
        case bankID = "bank_id"
        case detour
        case detourMiles = "detour_miles"
        case rideUser = "ride_user"
        case rideFromAddress = "ride_from_address"
        case rideFromLat = "ride_from_lat"
        case rideFromLong = "ride_from_long"
        case rideFromAddress2 = "ride_from_address2"
        case rideFromLat2 = "ride_from_lat2"
        case rideFromLong2 = "ride_from_long2"
        case rideFromAddress3 = "ride_from_address3"
        case rideFromLat3 = "ride_from_lat3"
        case rideFromLong3 = "ride_from_long3"
        case rideToAddress = "ride_to_address"
        case rideToLat = "ride_to_lat"
        case rideToLong = "ride_to_long"
        case rideDate = "ride_date"
        case rideTime = "ride_time"
        case rideDuration = "ride_duration"
        case rideDistance = "ride_distance"
        case contact
        case rideSeat = "ride_seat"
        case rideAmount = "ride_amount"
        case rideAbout = "ride_about"
        case cancelReason = "cancel_reason"
        case comment
        case isLocalRide = "is_local_ride"
        case isAutoapproval = "is_autoapproval"
        case rideStatus = "ride_status"
        case rideCreate = "ride_create"
        case id, firstname, lastname, mobile, email, dob
        case loginType = "login_type"
        case city, state, zip, wallet, bio, rating
    }
}
