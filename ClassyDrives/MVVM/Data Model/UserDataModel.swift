//
//  UserDataModel.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation

struct states {
    var id: String!
    var sCode: String!
    var sName: String!
}
struct citys {
    var id: String!
    var city : String!
    var country : String!
    var lat : String!
    var long : String!
}
struct urseRating {
    var rate_comment: String!
    var rate_from_user: String!
    var rate_id: String!
    var rate_star: String!
    var pic: String!
    var created_date : String!
    var firstname : String!
    var lastname : String!
}
struct notificationUser {
    var noti_id : String!
    var noti_text : String!
    var noti_create : String!

}
struct allRide {
    var rideid: String!
    var carId: String!
    var bankid: String!
    var detour: String!
    var ride_user: String!
    
    var ride_from_address: String!
    var ride_from_address2: String!
    var ride_from_address3: String!

    var ride_from_lat : String!
    var ride_from_long: String!
  
    var car_color : String!
     var car_type: String!
    var car_model: String!

    var ride_to_address: String!
    var ride_to_lat: String!
    var ride_to_long: String!
    var ride_date: String!
    var ride_time: String!
    var ride_seat: Int?
    var ride_amount: Int!
    var firstname: String!
    var mobile : String!
    var carmaker: String!
    var pic : String!
    var distance : String!
    var elapsedtime: String!
    var rating: String!
    var ride_duration : String?
    var ride_distance : Double?
    
    var pickup_distance: String!
    var dropup_distance: String!
    var discountAmount : String!
    var applied_id: String!
    var  is_already_booked:Int!
    var  is_seats_available:Int!
}

struct carDetail{
    var car_id: String!
    var car_name: String!
}

struct userCard {
    var id: String!
    var digits : String!
}

struct userBank{
    var id: String!
    var digits: String!
}

struct walletData {
    var card: [userCard]
    var bank: [userBank]
    var wallet : String = ""
}

struct userDetail {
    var id : String!
    var fname: String!
    var lname: String!
    var mobile: String!
    var email: String!
    var dob: String!
    var pic: String!
    var city: String
    var state: String!
    var zip: String!
    var wallet: String!
    var bio: String!
    var rating: String!
    var is_smoking : String?
    var is_pets : String?
    var is_music : String?
    var is_chat : String?
    var address : String?
    var work_address : String?
    var favourite_address : String?
    var relative_mobile : String?
    var experienceLevel : Int?
    var ssn_status : String?
    var driving_status : String?

}

struct userCar {
    var id : String!
    var user: String!
    var name: String!
    var model: String!
    var year: String!
    var image: String!
    var car_color : String!
    
}
struct profile {
    var profiledata : [userDetail]
    var carData : [userCar]
}

struct offerData {
    var pic : String!
    var ride_id : String!
    var car_id : String!
    var bank_id : String!
    var ride_user : String!
    var ride_from_address : String!
    var ride_to_address : String!
    var firstname : String!
    var ride_date : String!
    var ride_time : String!
    var ride_amount : String!
    var ride_seat: Int!
    var detour : String!
    var book_id : String?
    var is_local_ride : String?
    var book_amount : String?

}

struct bookedData {
    
    var pic : String!
    var ride_id : String!
    var car_id : String!
    var bank_id : String!
    var ride_user : String!
    var ride_from_address : String!
    var ride_to_address : String!
    var firstname : String!
    var ride_date : String!
    var ride_time : String!
    var ride_amount : String!
    
    var ride_seat: String!
    var rating: String!
    var book_id : String?
    var is_local_ride : String?
    var detour : String?
    var book_amount : String!

    
}

struct manageRideData {
    var offerRide : [offerData]
    var bookedRide: [bookedData]
}
struct rideDetails {
    var ride_id: String!
    var car_id: String!
    var car_model: String!
    var bank_id: String!
    var ride_user: String!
    var ride_from_address: String!
    var ride_to_address: String!
    var ride_amount: String!
    var firstname: String!
    var ride_date: String!
    var ride_time: String!
    var ride_seat : String!
    var rating: String!
    var pic: String!
    var ride_status: String!
    var bookAmmount: String!

}
struct bookDetailData {
    var id: String!
    var pic: String!
    var book_id: String!
    var book_user: String?
    var book_ride: String!
    var book_seat: String!
    var book_from_address: String!
    var book_to_address: String!
    var book_amount: String!
    var firstname: String!
    var book_date: String!
    var rating: String!
    var bio: String!
    var book_code : String?
    var book_status : String?
    var ride_status : String?

}
struct bookedDetailData {
    var ride: rideDetails!
    var book: [bookDetailData]
}
struct rideData {
    var pic : String!
    var ride_id : String!
    var car_id : String!
    var bank_id : String!
    var ride_user : String!
    var ride_from_address : String!
    var ride_to_address : String!
    var firstname : String!
    var ride_date : String!
    var ride_time : String!
    var ride_amount : String!
    var ride_seat: String!
}

struct Reasons {
    var reason_id : String?
    var reason_name : String?
}

struct MakeList {
    var make : String?
}

struct ModelList {
    var model : String?
}

struct YearDataList {
    var vehicle_id : String?
    var year  : String?
    var make : String?
    var model : String?
    
}


extension UserVM{
    
    func yearsListData(responseDict : JSONDictionary) {
        if let makelistDic = responseDict["makeList"] as? [NSDictionary] {
            for makeData in makelistDic {
                 let vehicle_id = makeData["vehicle_id"] as? String ?? ""
                   let year = makeData["year"] as? String ?? ""
                   let make = makeData["make"] as? String ?? ""
                   let model = makeData["model"] as? String ?? ""
                yearListData.append(YearDataList.init(vehicle_id: vehicle_id, year: year, make: make, model: model))
            }
        }
    }
    
    
    func makeListData(responseDict : JSONDictionary) {
        if let makelistDic = responseDict["makeList"] as? [NSDictionary] {
            for makeData in makelistDic {
                let carmake = makeData["make"] as? String ?? ""
                makeListData.append(MakeList(make: carmake))
            }
        }
      }
    
    func modelListData(responseDict : JSONDictionary) {
        if let makelistDic = responseDict["makeList"] as? [NSDictionary] {
            for makeData in makelistDic {
                let carmodel = makeData["model"] as? String ?? ""
                modelListData.append(ModelList(model: carmodel))
            }
        }
    }
    
 
    func parseReasonsData(responseDict : JSONDictionary) {
         let refundedAmount = responseDict["RefundedAmount"] as? String
        
        print(refundedAmount as Any)
        UserDefaults.standard.set(refundedAmount, forKey: "RefundedAmount")
    
        if let reasonsDic = responseDict["response"] as? [NSDictionary] {

            for reason in reasonsDic {
                let reason_id = reason[APIKeys.kreason_id] as? String ?? ""
                let reason_name = reason[APIKeys.kreason_name] as? String ?? ""

                reasonDetailsArr.append(Reasons.init(reason_id: reason_id, reason_name: reason_name))
            }
        }
    }
    
    
    
    func parseLoginData(responseDict : JSONDictionary) {
        UserDefaults.standard.removeObject(forKey: "LoginID")

        if let json = responseDict["data"] as? NSDictionary{
//            if (json.value(forKey: "otp_status") as? String == "0")
//            {
//            return
//            }
            let id = json.value(forKey: "id") as? String ?? ""
            userID = id
            let otp_status = json.value(forKey: "otp_status") as? String ?? ""
            
            let already_exist = json.value(forKey: "already_exist") as? Int ?? 0
            
            UserDefaults.standard.set(otp_status, forKey: "otp_status")
            UserDefaults.standard.set(already_exist, forKey: "already_exist")

            
            
            UserDefaults.standard.set(id, forKey: "LoginID")
        }else{
            let id = responseDict["userid"] as? String ?? ""
            userID = id
                       let otp_status = responseDict["otp_status"] as? String ?? ""
                       UserDefaults.standard.set(otp_status, forKey: "otp_status")

                       UserDefaults.standard.set(id, forKey: "LoginID")
        }
    }
    
    func parseStateData(responseDict : JSONDictionary) {
        if let json = responseDict["data"] as? [NSDictionary]{
            for sData in json{
                let id = sData.value(forKey: APIKeys.kID) as? String ?? ""
                let code = sData.value(forKey: APIKeys.kSTATE_CODE) as? String ?? ""
                let name = sData.value(forKey: APIKeys.kSTATE_NAME) as? String ?? ""
                stateDetails.append(states.init(id: id, sCode: code, sName: name))
            }
        }
    }
    
    func parseCityData(responseDict : JSONDictionary) {
        if let json = responseDict["data"] as? [NSDictionary]{
            for cData in json{
                let id = cData.value(forKey: APIKeys.kID) as? String ?? ""
                let city = cData.value(forKey: APIKeys.kCITY) as? String ?? ""
                let country = cData.value(forKey: APIKeys.kCOUNTY) as? String ?? ""
                let lat = cData.value(forKey: APIKeys.kLATITUDE) as? String ?? ""
                let long = cData.value(forKey: APIKeys.kLONGITUDE) as? String ?? ""
                cityDetails.append(citys.init(id: id, city: city, country: country, lat: lat, long: long))
            }
        }
    }
    
    func parseAllRideData(responseDict : JSONDictionary) {
        if let json = responseDict["response"] as? [NSDictionary]{
            for rData in json{
                print(rData)
                
                let rideid = rData.value(forKey: APIKeys.kride_id) as? String ?? ""
                let carId = rData.value(forKey: APIKeys.kcar_id) as? String ?? ""
                let car_color = rData.value(forKey: APIKeys.kcar_color) as? String ?? ""
                let car_type = rData.value(forKey: APIKeys.kcar_type) as? String ?? ""
                let car_model = rData.value(forKey: APIKeys.kcar_model) as? String ?? ""

                let bankid = rData.value(forKey: APIKeys.kbank_id) as? String ?? ""
                let detour = rData.value(forKey: APIKeys.kdetour) as? String ?? ""
                let ride_user = rData.value(forKey: APIKeys.kride_user) as? String ?? ""
                let ride_from_address = rData.value(forKey: APIKeys.kride_from_address) as? String ?? ""
                let ride_from_address2 = rData.value(forKey: APIKeys.kride_from_address2) as? String ?? ""
                let ride_from_address3 = rData.value(forKey: APIKeys.kride_from_address3) as? String ?? ""
                
                let ride_from_lat = rData.value(forKey: APIKeys.kride_from_lat) as? String ?? ""
                let ride_from_long = rData.value(forKey: APIKeys.kride_from_long) as? String ?? ""
                let ride_to_address = rData.value(forKey: APIKeys.kride_to_address) as? String ?? ""
                let ride_to_lat = rData.value(forKey: APIKeys.kride_to_lat) as? String ?? ""
                let ride_to_long = rData.value(forKey: APIKeys.kride_to_long) as? String ?? ""
                let ride_date = rData.value(forKey: APIKeys.kride_date) as? String ?? ""
                let ride_time = rData.value(forKey: APIKeys.kride_time) as? String ?? ""
                let ride_seat = rData.value(forKey: APIKeys.kride_seat) as? Int ?? 0
                let ride_amount = rData.value(forKey: APIKeys.kride_amount) as? Int ?? 0
                let firstname = rData.value(forKey: APIKeys.kfirstname) as? String ?? ""
                let mobile = rData.value(forKey: APIKeys.kmobile) as? String ?? ""
                let carmaker = rData.value(forKey: APIKeys.kcarmaker) as? String ?? ""
                let pic = rData.value(forKey: APIKeys.kpic) as? String ?? ""
                let distance = rData.value(forKey: APIKeys.kdistance) as? String ?? ""
                let eTime = rData.value(forKey: APIKeys.kelapsedtime) as? String ?? ""
                let rate = rData.value(forKey: APIKeys.krating) as? String ?? ""
                let ride_distance = rData.value(forKey: APIKeys.kride_distance) as? Double ?? 0.0
                let ride_duration = rData.value(forKey: APIKeys.kride_duration) as? String ?? ""
                
                let pickup_distance = rData.value(forKey: APIKeys.kpickup_distance) as? String ?? ""
                let dropup_distance = rData.value(forKey: APIKeys.kdropup_distance) as? String ?? ""
                let discountAmount = rData.value(forKey: APIKeys.kdiscountAmount) as? String ?? ""
                let applied_id = rData.value(forKey: APIKeys.kapplied_id) as? String ?? ""
                
                let kIsAleradyBooked = rData.value(forKey: APIKeys.kIsAleradyBooked) as? Int ?? 0
                
                let kIsSeatsAvailable = rData.value(forKey: APIKeys.kIsSeatsAvailable) as? Int ?? 0
                
                allRideDetails.append(allRide.init(rideid: rideid, carId: carId, bankid: bankid, detour: detour, ride_user: ride_user, ride_from_address: ride_from_address,ride_from_address2: ride_from_address2,ride_from_address3:ride_from_address3 , ride_from_lat: ride_from_lat, ride_from_long: ride_from_long, car_color:car_color, car_type: car_type,car_model :car_model, ride_to_address: ride_to_address, ride_to_lat: ride_to_lat, ride_to_long: ride_to_long, ride_date: ride_date, ride_time: ride_time, ride_seat: ride_seat, ride_amount: ride_amount, firstname: firstname, mobile: mobile, carmaker: carmaker, pic: pic, distance: distance, elapsedtime: eTime, rating: rate,ride_duration : ride_duration, ride_distance : ride_distance,pickup_distance:pickup_distance,dropup_distance:dropup_distance,discountAmount:discountAmount,applied_id: applied_id,is_already_booked: kIsAleradyBooked,is_seats_available: kIsSeatsAvailable ))
                
            }
        }
    }
    
    func parseCarDetails(responseDict:JSONDictionary) {
        if let json = responseDict["data"] as? [NSDictionary]{
            for cData in json{
                let id =  cData.value(forKey: APIKeys.kcar_id) as? String ?? ""
                let name =  cData.value(forKey: APIKeys.kcar_name) as? String ?? ""
                carDetails.append(carDetail.init(car_id: id, car_name: name))
            }
        }
    }
    
    func parseWalletDetails(responseDict: JSONDictionary) {
        print(responseDict)
        var uCard = [userCard]()
        var uBank = [userBank]()
        var uWallet = String()
        if let usercard = responseDict["usercard"] as? [NSDictionary]{
            for card in usercard{
                var digit = String()
                let id = card.value(forKey: APIKeys.kcard_id) as? String ?? ""
                if let cardData = card.value(forKey: APIKeys.kcard_data) as? NSDictionary{
                    if let crd = cardData.value(forKey:APIKeys.kcard) as? NSDictionary{
                        digit = crd.value(forKey: APIKeys.klast4) as? String ?? ""
                        uCard.append(userCard.init(id: id, digits: digit))
                    }
                }
            }
        }
        if let userbank = responseDict["userbank"] as? [NSDictionary]{
            for bank in userbank{
                var digit = String()
                let id = bank.value(forKey: APIKeys.kbank_id) as? String ?? ""
                if let bdata = bank.value(forKey: APIKeys.kbank_data) as? NSDictionary{
                    if let baccount = bdata.value(forKey: APIKeys.kbank_account) as? NSDictionary{
                        digit = baccount.value(forKey: APIKeys.klast4) as? String ?? ""
                        uBank.append(userBank.init(id: id, digits: digit))
                    }
                }
                
            }
        }
        if let wallet = responseDict["wallet"] as? String{
          uWallet = wallet
        }
        walletDetails.append(walletData.init(card: uCard, bank: uBank, wallet: uWallet))
    }
    func parseNotifactionDetails(responseDict: JSONDictionary) {
   
    if let user = responseDict["notification"] as? [NSDictionary]{
         for detail in user{
        let noti_create  = detail.value(forKey:"noti_create") as? String ?? ""
                       let noti_id  = detail.value(forKey: "noti_id") as? String ?? ""
                       let noti_title  = detail.value(forKey: "noti_title") as? String ?? ""
            notification.append(notificationUser.init(noti_id: noti_id, noti_text: noti_title, noti_create: noti_create))
        }
        
    }
    }
    func parseProfileDetails(responseDict: JSONDictionary) {
        var userData = [userDetail]()
        var carData = [userCar]()
        if let user = responseDict["userDetail"] as? [NSDictionary]{
            for detail in user{
                print(detail)
                let id  = detail.value(forKey: APIKeys.kid) as? String ?? ""
                let fname  = detail.value(forKey: APIKeys.kfirstname) as? String ?? ""
                let lname  = detail.value(forKey: APIKeys.klastname) as? String ?? ""
                let mobile  = detail.value(forKey: APIKeys.kmobile) as? String ?? ""
                let email  = detail.value(forKey: APIKeys.kemail) as? String ?? ""
                let dob  = detail.value(forKey: APIKeys.kdob) as? String ?? ""
                let pic  = detail.value(forKey: APIKeys.kpic) as? String ?? ""
                let city  = detail.value(forKey: APIKeys.kcity) as? String ?? ""
                let state  = detail.value(forKey: APIKeys.kstate) as? String ?? ""
                let zip  = detail.value(forKey: APIKeys.kzip) as? String ?? ""
                let wallet  = detail.value(forKey: APIKeys.kwallet) as? String ?? ""
                let bio  = detail.value(forKey: APIKeys.kbio) as? String ?? ""
                let rating  = detail.value(forKey: APIKeys.krating) as? String ?? ""
                let is_smoking = detail.value(forKey: "is_smoking") as? String ?? ""
                 let is_pets = detail.value(forKey: "is_pets") as? String ?? ""
                 let is_music = detail.value(forKey: "is_music") as? String ?? ""
                 let is_chat = detail.value(forKey: "is_chat") as? String ?? ""
                 let address = detail.value(forKey: "address") as? String ?? ""
                let work_address = detail.value(forKey: "work_address") as? String ?? ""
                let favourite_address = detail.value(forKey: "favourite_address") as? String ?? ""
                let relative_mobile = detail.value(forKey: "relative_mobile") as? String ?? ""
                let experienceLevel = detail.value(forKey: "experienceLevel") as? Int ?? 0
                let ssn_status = detail.value(forKey: "ssn_status") as? String ?? ""
                let driving_status = detail.value(forKey: "driving_status") as? String ?? ""


                userData.append(userDetail.init(id: id, fname: fname, lname: lname, mobile: mobile, email: email, dob: dob, pic: pic, city: city, state: state, zip: zip, wallet: wallet, bio: bio, rating: rating, is_smoking: is_smoking, is_pets: is_pets, is_music: is_music, is_chat: is_chat, address: address, work_address: work_address, favourite_address: favourite_address, relative_mobile: relative_mobile, experienceLevel: experienceLevel, ssn_status: ssn_status, driving_status: driving_status))
            }
        }
        if let cars = responseDict["carDetail"] as? [NSDictionary]{
            for detail in cars{
                let id  = detail.value(forKey: APIKeys.kcar_id) as? String ?? ""
                let user = detail.value(forKey: APIKeys.kcar_user) as? String ?? ""
                let name = detail.value(forKey: APIKeys.kcar_name) as? String ?? ""
                let model = detail.value(forKey: APIKeys.kcar_model) as? String ?? ""
                let year = detail.value(forKey: APIKeys.kcar_year) as? String ?? ""
                let img = detail.value(forKey: APIKeys.kcar_image) as? String ?? ""
                let car_color = detail.value(forKey: "car_color") as? String ?? ""
                carData.append(userCar.init(id: id, user: user, name: name, model: model, year: year, image: img,car_color : car_color))
            }
        }
        profileDetails.append(profile.init(profiledata: userData, carData: carData))
    }
    
    //MARK:- Offer Details Parsing
  
    func parseManageRideData(responseDict: JSONDictionary) {
        var offer = [offerData]()
        var booked = [bookedData]()
        if let oData = responseDict["current_offer_ride"] as? [NSDictionary]{
            print("oData--\(oData)")
            for data in oData{
                
                let pic = data.value(forKey: APIKeys.kpic) as? String ?? ""
                let rideId = data.value(forKey: APIKeys.kride_id) as? String ?? ""
                let carid = data.value(forKey: APIKeys.kcar_id) as? String ?? ""
                let bankid = data.value(forKey: APIKeys.kbank_id) as? String ?? ""
                let rideUser = data.value(forKey: APIKeys.kride_user) as? String ?? ""
                let from = data.value(forKey: APIKeys.kride_from_address) as? String ?? ""
                let to = data.value(forKey: APIKeys.kride_to_address) as? String ?? ""
                let date = data.value(forKey: APIKeys.kride_date) as? String ?? ""
                let time = data.value(forKey: APIKeys.kride_time) as? String ?? ""
                let ammount = data.value(forKey: APIKeys.kride_amount) as? String ?? ""
                let name = data.value(forKey: APIKeys.kfirstname) as? String ?? ""
                let seat = data.value(forKey: APIKeys.kride_seat) as? Int ?? 0
                let detour = data.value(forKey: APIKeys.kdetour) as? String ?? ""
                let book_id = data.value(forKey: APIKeys.kbook_id) as? String ?? ""
                let is_local_ride = data.value(forKey: APIKeys.kis_local_ride) as? String ?? ""
                let book_amount = data.value(forKey: APIKeys.kbook_amount) as? String ?? ""

                offer.append(offerData.init(pic: pic, ride_id: rideId, car_id: carid, bank_id: bankid, ride_user: rideUser, ride_from_address: from, ride_to_address: to, firstname: name, ride_date: date, ride_time: time, ride_amount:ammount, ride_seat: seat, detour: detour,book_id : book_id,is_local_ride : is_local_ride,book_amount: book_amount))
            }
        }
        
        if let bData = responseDict["booked_ride"] as? [NSDictionary]{
            for data in bData{
                print(data)
                
                let pic = data.value(forKey: APIKeys.kpic) as? String ?? ""
                let rideId = data.value(forKey: APIKeys.kride_id) as? String ?? ""
                let carid = data.value(forKey: APIKeys.kcar_id) as? String ?? ""
                let bankid = data.value(forKey: APIKeys.kbank_id) as? String ?? ""
                let rideUser = data.value(forKey: APIKeys.kride_user) as? String ?? ""
                let from = data.value(forKey: APIKeys.kride_from_address) as? String ?? ""
                let to = data.value(forKey: APIKeys.kride_to_address) as? String ?? ""
                let date = data.value(forKey: APIKeys.kride_date) as? String ?? ""
                let time = data.value(forKey: APIKeys.kride_time) as? String ?? ""
                let ammount = data.value(forKey: APIKeys.kride_amount) as? String ?? ""
                let name = data.value(forKey: APIKeys.kfirstname) as? String ?? ""
                let seat = data.value(forKey: APIKeys.kbook_seat) as? String ?? ""
                let rate = data.value(forKey: APIKeys.krating) as? String ?? ""
                let book_id = data.value(forKey: APIKeys.kbook_id) as? String ?? ""
                let book_amount = data.value(forKey: APIKeys.kbook_amount) as? String ?? ""

                let is_local_ride = data.value(forKey: APIKeys.kis_local_ride) as? String ?? ""
                let detour = data[APIKeys.kdetour] as? String ?? ""
            
                booked.append(bookedData.init(pic: pic, ride_id: rideId, car_id: carid, bank_id: bankid, ride_user: rideUser, ride_from_address: from, ride_to_address: to, firstname: name, ride_date: date, ride_time: time, ride_amount:ammount, ride_seat: seat, rating: rate,book_id : book_id,is_local_ride : is_local_ride,detour : detour,book_amount:book_amount ))
            }
        }
        allRidesDetails.append(manageRideData.init(offerRide: offer, bookedRide: booked))
    }
  
    //MARK:- History Data Parsing
    func historyRideData(responseDict: JSONDictionary) {
        var offer = [offerData]()
        var booked = [bookedData]()
        if let oData = responseDict["offered_history"] as? [NSDictionary]{
            //            print(oData)
            for data in oData{
                
                let pic = data.value(forKey: APIKeys.kpic) as? String ?? ""
                let rideId = data.value(forKey: APIKeys.kride_id) as? String ?? ""
                let carid = data.value(forKey: APIKeys.kcar_id) as? String ?? ""
                let bankid = data.value(forKey: APIKeys.kbank_id) as? String ?? ""
                let rideUser = data.value(forKey: APIKeys.kride_user) as? String ?? ""
                let from = data.value(forKey: APIKeys.kride_from_address) as? String ?? ""
                let to = data.value(forKey: APIKeys.kride_to_address) as? String ?? ""
                let date = data.value(forKey: APIKeys.kride_date) as? String ?? ""
                let time = data.value(forKey: APIKeys.kride_time) as? String ?? ""
                let ammount = data.value(forKey: APIKeys.kride_amount) as? String ?? ""
                let name = data.value(forKey: APIKeys.kfirstname) as? String ?? ""
                let seat = data.value(forKey: APIKeys.kride_seat) as? Int ?? 0
                let detour = data.value(forKey: APIKeys.kdetour) as? String ?? ""
                let book_id = data.value(forKey: APIKeys.kbook_id) as? String ?? ""
                let is_local_ride = data.value(forKey: APIKeys.kis_local_ride) as? String ?? ""
                
                offer.append(offerData.init(pic: pic, ride_id: rideId, car_id: carid, bank_id: bankid, ride_user: rideUser, ride_from_address: from, ride_to_address: to, firstname: name, ride_date: date, ride_time: time, ride_amount:ammount, ride_seat: seat, detour: detour,book_id : book_id,is_local_ride : is_local_ride))
            }
        }
        
        if let bData = responseDict["booking_history"] as? [NSDictionary]{
            for data in bData{
                print(data)
                
                let pic = data.value(forKey: APIKeys.kpic) as? String ?? ""
                let rideId = data.value(forKey: APIKeys.kride_id) as? String ?? ""
                let carid = data.value(forKey: APIKeys.kcar_id) as? String ?? ""
                let bankid = data.value(forKey: APIKeys.kbank_id) as? String ?? ""
                let rideUser = data.value(forKey: APIKeys.kride_user) as? String ?? ""
                let from = data.value(forKey: APIKeys.kride_from_address) as? String ?? ""
                let to = data.value(forKey: APIKeys.kride_to_address) as? String ?? ""
                let date = data.value(forKey: APIKeys.kride_date) as? String ?? ""
                let time = data.value(forKey: APIKeys.kride_time) as? String ?? ""
                let ammount = data.value(forKey: APIKeys.kride_amount) as? String ?? ""
                let name = data.value(forKey: APIKeys.kfirstname) as? String ?? ""
                let seat = data.value(forKey: APIKeys.kbook_seat) as? String ?? ""
                let rate = data.value(forKey: APIKeys.krating) as? String ?? ""
                let book_ride = data.value(forKey: APIKeys.kbook_id) as? String ?? ""
                let is_local_ride = data.value(forKey: APIKeys.kis_local_ride) as? String ?? ""
                let detour = data[APIKeys.kdetour] as? String ?? ""
                
                
                booked.append(bookedData.init(pic: pic, ride_id: rideId, car_id: carid, bank_id: bankid, ride_user: rideUser, ride_from_address: from, ride_to_address: to, firstname: name, ride_date: date, ride_time: time, ride_amount:ammount, ride_seat: seat, rating: rate,book_id : book_ride,is_local_ride : is_local_ride,detour : detour))
            }
        }
        allRidesDetails.append(manageRideData.init(offerRide: offer, bookedRide: booked))
    }
    
    
    
    
    
    func parseBookedRideDetailData(responseDict: JSONDictionary) {
        var rRide = rideDetails()
        var rBook = [bookDetailData]()
        
        
        if let json = responseDict["ride_detail"] as? NSDictionary{
            let pic = json.value(forKey: APIKeys.kpic) as? String ?? ""
            let rideId = json.value(forKey: APIKeys.kride_id) as? String ?? ""
            
            let carid = json.value(forKey: APIKeys.kcar_id) as? String ?? ""
            let bankid = json.value(forKey: APIKeys.kbank_id) as? String ?? ""
            let rideUser = json.value(forKey: APIKeys.kride_user) as? String ?? ""
            let from = json.value(forKey: APIKeys.kride_from_address) as? String ?? ""
            let to = json.value(forKey: APIKeys.kride_to_address) as? String ?? ""
            let date = json.value(forKey: APIKeys.kride_date) as? String ?? ""
            let time = json.value(forKey: APIKeys.kride_time) as? String ?? ""
            let ammount = json.value(forKey: APIKeys.kride_amount) as? String ?? ""
            

            let name = json.value(forKey: APIKeys.kfirstname) as? String ?? ""
            let seat = json.value(forKey: APIKeys.kride_seat) as? String ?? ""
            let rating = json.value(forKey: APIKeys.krating) as? String ?? ""
            let ride_status = json.value(forKey:"ride_status") as? String ?? ""
            let bookAmmount = json.value(forKey: APIKeys.kbook_amount) as? String ?? ""
            rRide = rideDetails.init(ride_id: rideId, car_id: carid, bank_id: bankid, ride_user: rideUser, ride_from_address: from, ride_to_address: to, ride_amount: ammount, firstname: name, ride_date: date, ride_time: time, ride_seat: seat, rating: rating, pic: pic,ride_status: ride_status,bookAmmount : bookAmmount )
        }
        
        if let bData = responseDict["book_detail"] as? [NSDictionary]{
            for data in bData{
                let pic = data.value(forKey: APIKeys.kpic) as? String ?? ""
                let bookId = data.value(forKey: APIKeys.kbook_id) as? String ?? ""
                let bUser = data.value(forKey: APIKeys.kbook_user) as? String ?? ""
                let bRide = data.value(forKey: APIKeys.kbook_ride) as? String ?? ""
                let bSeat = data.value(forKey: APIKeys.kbook_seat) as? String ?? ""
                let from = data.value(forKey: APIKeys.kbook_from_address) as? String ?? ""
                let to = data.value(forKey: APIKeys.kbook_to_address) as? String ?? ""
                let amount = data.value(forKey: APIKeys.kbook_amount) as? String ?? ""
                let name = data.value(forKey: APIKeys.kfirstname) as? String ?? ""
                let date = data.value(forKey: APIKeys.kbook_date) as? String ?? ""
                let rate = data.value(forKey: APIKeys.krating) as? String ?? ""
                let bio = data.value(forKey: APIKeys.kbio) as? String ?? ""
                let book_status =  data[APIKeys.kbook_status] as? String ?? ""
                let book_code =  data[APIKeys.kbook_code] as? String ?? ""

                let id = data.value(forKey: APIKeys.kid)as? String ?? ""

                rBook.append(bookDetailData.init(id: id, pic: pic, book_id: bookId, book_user: bUser, book_ride: bRide, book_seat: bSeat, book_from_address: from, book_to_address: to, book_amount: amount, firstname: name, book_date: date, rating: rate, bio: bio, book_code: book_code, book_status: book_status))
            }
            bookRideDetails.append(bookedDetailData.init(ride: rRide, book: rBook))
        }
    }
    
    func parseRideDetail(responseDict: JSONDictionary) {
        print(responseDict)
        if let json = responseDict as? NSDictionary{
            bookRideid = "\(json.value(forKey: APIKeys.kbook_id) as? Int ?? 0)"
            bookUserId = json.value(forKey: APIKeys.kride_user) as? String ?? ""
        }
     }
    func parseCoupounAmount(responseDict: JSONDictionary) {
       print(responseDict)
       if let json = responseDict as? NSDictionary{
           discountAmount = "\(json.value(forKey: "discountAmount") as? String ?? "")"
        applied_id = "\(json.value(forKey: "applied_id") as? String ?? "")"
        print(discountAmount)

       }
    }
    func parseRideIdData(responseDict: JSONDictionary) {
        print(responseDict)
        if let json = responseDict as? NSDictionary{
            offerRideId = "\(json.value(forKey: APIKeys.kride_id) as? Int ?? 0)"
        }
    }
    
    
    func parseRideData(responseDict: JSONDictionary) {
        if let json = responseDict["ride_detail"] as? NSDictionary{
            let pic = json.value(forKey: APIKeys.kpic) as? String ?? ""
            let rideId = json.value(forKey: APIKeys.kride_id) as? String ?? ""
            let carid = json.value(forKey: APIKeys.kcar_id) as? String ?? ""
            let bankid = json.value(forKey: APIKeys.kbank_id) as? String ?? ""
            let rideUser = json.value(forKey: APIKeys.kride_user) as? String ?? ""
            let from = json.value(forKey: APIKeys.kride_from_address) as? String ?? ""
            let to = json.value(forKey: APIKeys.kride_to_address) as? String ?? ""
            let date = json.value(forKey: APIKeys.kride_date) as? String ?? ""
            let time = json.value(forKey: APIKeys.kride_time) as? String ?? ""
            let ammount = json.value(forKey: APIKeys.kride_amount) as? String ?? ""
            let name = json.value(forKey: APIKeys.kfirstname) as? String ?? ""
            let seat = json.value(forKey: APIKeys.kride_seat) as? String ?? ""
            selectRideDetails.append(rideData.init(pic: pic, ride_id: rideId, car_id: carid, bank_id: bankid, ride_user: rideUser, ride_from_address: from, ride_to_address: to, firstname: name, ride_date: date, ride_time: time, ride_amount: ammount, ride_seat: seat))
        }
    }
    
    func parseRatingData(responseDict: JSONDictionary) {
        if let json = responseDict["urseRating"] as? [NSDictionary]{
            for obj in json
            {
            let pic = obj.value(forKey: APIKeys.kpic) as? String ?? ""
            let rate_comment = obj.value(forKey: "rate_comment") as? String ?? ""
            let rate_from_user = obj.value(forKey: "rate_from_user") as? String ?? ""
            let rate_id = obj.value(forKey: "rate_id") as? String ?? ""
            let rate_star = obj.value(forKey: "rate_star") as? String ?? ""
            let created_date = obj.value(forKey: "created_date") as? String ?? ""
            let firstname = obj.value(forKey: "firstname") as? String ?? ""
            let lastname = obj.value(forKey: "lastname") as? String ?? ""
            self.ratingDetails.append(urseRating.init(rate_comment: rate_comment, rate_from_user: rate_from_user, rate_id: rate_id, rate_star: rate_star, pic: pic, created_date: created_date, firstname: firstname, lastname: lastname))
            }
        }
    }
}
