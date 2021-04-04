//
//  UserVM.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation


class UserVM {
    public static let sheard = UserVM()
    
    var stateDetails = [states]()
    var stateDetails1 = [states]()
    var cityDetails = [citys]()
    var allRideDetails = [allRide]()
    var carDetails = [carDetail]()
    var walletDetails = [walletData]()
    var profileDetails = [profile]()
    var allRidesDetails = [manageRideData]()
    var bookRideDetails = [bookedDetailData]()
    var selectRideDetails = [rideData]()
    var ratingDetails = [urseRating]()
    var notification = [notificationUser]()

    var reasonDetailsArr = [Reasons]()
    var bookRideid = String()
     var discountAmount = String()
    var applied_id = String()
    var bookUserId = String()
    var offerRideId = String()
    var makeListData = [MakeList]()
    var modelListData = [ModelList]()
    var yearListData = [YearDataList]()
    var bookID = String()
    var rideID = String()
    
    func loginUser(login_type : Int,email: String, password: String, device_type: String, device_token: String, device_id: String, response: @escaping responseCallBack) {
        APIManager.login(login_type: login_type, email: email, password: password, device_type: device_type, device_token: device_token, device_id: device_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
               self.parseLoginData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                
                if message == "Otp not verified!"{
                   self.parseLoginData(responseDict: responseDict!)
                    response(false, message, nil)
                }else{
                   response(false, message, nil)
                }
                
                
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func registorUser(firstname: String, lastname: String, email: String, password: String, device_type: String, device_token: String, dob: String, city: String, state: String, zip: String, bio: String, mobile: String,apple_id : String, response: @escaping responseCallBack) {
         UserDefaults.standard.removeObject(forKey: "LoginID")

        APIManager.registor(firstname: firstname, lastname: lastname, email: email, password: password, device_type: device_type, device_token: device_token, dob: dob, city: city, state: state, zip: zip, bio: bio, mobile: mobile, apple_id: apple_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func resendOtp(mobile: String, response: @escaping responseCallBack) {
        
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
        APIManager.resendOtp(mobile: mobile,userid : userID, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func otpVarify(otp: String, mobile: String, response: @escaping responseCallBack) {
        UserDefaults.standard.removeObject (forKey: "LoginID")

        APIManager.otpvarify(otp: otp, mobile: mobile, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict)
                let data = responseDict?["data"] as? NSDictionary
                let userId = data?.value(forKey: "id") as? String
                UserDefaults.standard.set(userId, forKey: "LoginID")

                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func walletInfo(user_id: String, response: @escaping responseCallBack)
    {
   APIManager.walletInfo(user_id: user_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                
                print(responseDict)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func forgetPassword(email: String, response: @escaping responseCallBack) {
        APIManager.forgetPass(email: email, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    
    func state(response: @escaping responseCallBack) {
        APIManager.stateDetail(successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict)
                self.parseStateData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    
    
    func state1(response: @escaping responseCallBack) {
        APIManager.stateDetail1(successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict)
                self.parseStateData1(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    
    
    func city(state_id: String, response: @escaping responseCallBack) {
        APIManager.cityDetail(state_id: state_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict)
                self.parseCityData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func createRide(ride_user: String, ride_from_address: String, ride_to_address: String, ride_from_lat: String, ride_from_long: String, ride_to_lat: String, ride_to_long: String, ride_from_address2: String, ride_from_lat2: String, ride_from_long2: String, ride_from_address3: String, ride_from_lat3: String, ride_from_long3: String, ride_date: String, ride_time: String, ride_amount: String, ride_seat: String, ride_about: String, car_id: String,  detour:String,is_local_ride: String ,current_time: String,is_autoapproval : String,response: @escaping withResponseCallBack) {
        APIManager.createRide(ride_user: ride_user, ride_from_address: ride_from_address, ride_to_address: ride_to_address, ride_from_lat: ride_from_lat, ride_from_long: ride_from_long, ride_to_lat: ride_to_lat, ride_to_long: ride_to_long, ride_from_address2: ride_from_address2, ride_from_lat2: ride_from_lat2, ride_from_long2: ride_from_long2, ride_from_address3: ride_from_address3, ride_from_lat3: ride_from_lat3, ride_from_long3: ride_from_long3, ride_date: ride_date, ride_time: ride_time, ride_amount: ride_amount, ride_seat: ride_seat, ride_about: ride_about, car_id: car_id,  detour: detour, is_local_ride: is_local_ride, current_time: current_time, is_autoapproval: is_autoapproval, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success == 1{
                print(responseDict!)
                self.parseRideIdData(responseDict: responseDict!)
                response(true, responseDict,message, nil)
            }else{
                response(false,nil, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil,nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
   
    func findRide(userid: String, from_address: String, to_address: String, from_lat: String, from_long: String, to_lat: String, to_long: String, date: String, price: String,is_local_ride : String, response: @escaping responseCallBack){
        
         let formatters = DateFormatter()
                         formatters.dateFormat = "MM-dd-yyyy"
                     let   currentDate = "\(formatters.string(from: Date()))"
        APIManager.findRide(userid: userid, from_address: from_address, to_address: to_address, from_lat: from_lat, from_long: from_long, to_lat: to_lat, to_long: to_long, date: is_local_ride == "0" ? date : currentDate, price: price, is_local_ride: is_local_ride, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseAllRideData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }){ (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func carDetails(car_user: String, response: @escaping withResponseCallBack) {
        APIManager.CarDetail(car_user: car_user, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseCarDetails(responseDict: responseDict!)
                response(true, responseDict,message, nil)
            }else{
                response(false,nil ,message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil,nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func addCar(car_name: String, car_model: String, car_year: String, car_image: String, car_user: String,car_color : String, response: @escaping responseCallBack) {
        APIManager.addCar(car_name: car_name, car_model: car_model, car_year: car_year, car_image: car_image, car_user: car_user,car_color : car_color, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseCarDetails(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    
//    func addCar(car_name: String, car_model: String, car_year: String, car_image: String, car_user: String,car_color : String, response: @escaping responseCallBack) {
//        APIManager.addCar(car_name: car_name, car_model: car_model, car_year: car_year, car_image: car_image, car_user: car_user,car_color : car_color, successCallback: { (responseDict) in
//            let success = responseDict?[APIKeys.kstatus] as! Int
//            let message = responseDict?[APIKeys.kmessage] as? String
//            if success ==  1{
//                response(true, message, nil)
//            }else{
//                response(false, message, nil)
//            }
//        }) { (errorReason, error) in
//            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
//        }
//    }
    
    func wallet(user_id: String, response: @escaping withResponseCallBack) {
        APIManager.wallet(user_id: user_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseWalletDetails(responseDict: responseDict!)
                response(true, responseDict,message, nil)
            }else{
                response(false,nil, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil,nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    func addMoneyToCard(user_id: String, card_id: String, add_amount: String, response: @escaping withResponseCallBack) {
        APIManager.wallet(user_id: user_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseWalletDetails(responseDict: responseDict!)
                response(true, responseDict,message, nil)
            }else{
                response(false,nil, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil,nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    func userProfile(userid: String, response: @escaping responseCallBack) {
        APIManager.profile(userid: userid, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                print(responseDict!)
                self.parseProfileDetails(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func userNotifications(userid: String, response: @escaping responseCallBack) {
           APIManager.userNotification(userid: userid, successCallback: { (responseDict) in
               let success = responseDict?[APIKeys.kstatus] as! Int
               let message = responseDict?[APIKeys.kmessage] as? String
               if success ==  1{
                   print(responseDict!)
                   self.parseNotifactionDetails(responseDict: responseDict!)
                   response(true, message, nil)
               }else{
                   response(false, message, nil)
               }
           }) { (errorReason, error) in
               response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
           }
       }
    func deleteNotification(userid: String,notifiID : String, response: @escaping responseCallBack) {
        APIManager.deleteUserNotification(userid: userid,notif : notifiID, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                print(responseDict!)
                self.parseNotifactionDetails(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func addBank(user_id: String, routing_number: String, account_number: String, line1: String,line2: String,ssn: String,ssn_last_4: String,city: String,state: String,postal_code: String,dob: String,response: @escaping responseCallBack) {
        APIManager.addBankStrip(user_id: user_id, routing_number: routing_number, account_number: account_number,line1: line1,line2: line2,ssn: ssn,ssn_last_4: ssn_last_4,city: city,state: state,postal_code: postal_code,dob: dob, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }){ (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func addCard(user_id: String, card_number: String, exp_month: String, cvv: String, exp_year: String,card_type : String, response: @escaping responseCallBack) {
        APIManager.addCardStrip(user_id: user_id, card_number: card_number, exp_month: exp_month, cvv: cvv, exp_year: exp_year,card_type: card_type, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }){ (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func manageRide(userid: String, response: @escaping withResponseCallBack) {
        print("userid--\(userid)")
        APIManager.manageRide(user_id: userid, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseManageRideData(responseDict: responseDict!)
                response(true, responseDict,message, nil)
            }else{
                response(false,nil ,message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil,nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }

    }
    
    func bookRideData(user_id: String, book_ride: String, seat: String, ride_from_address: String, ride_from_lat: String, ride_from_long: String, ride_to_address: String, ride_to_lat: String, ride_to_long: String, book_amount: String, book_distance: String, book_elapsedtime: String, book_card_id: String,is_local_ride: String , pickup_distance: String, dropup_distance: String, discountAmount: String, applied_id: String,book_create:String, response: @escaping responseCallBack) {
        APIManager.bookRide(user_id: user_id, book_ride: book_ride, seat: seat, ride_from_address: ride_from_address, ride_from_lat: ride_from_lat, ride_from_long: ride_from_long, ride_to_address: ride_to_address, ride_to_lat: ride_to_lat, ride_to_long: ride_to_long, book_amount: book_amount, book_distance: book_distance, book_elapsedtime: book_elapsedtime, book_card_id: book_card_id, is_local_ride: is_local_ride, pickup_distance: pickup_distance, dropup_distance: dropup_distance, discountAmount: discountAmount, applied_id: applied_id, book_create: book_create, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.bookID = responseDict?[APIKeys.kbook_id] as? String ?? ""
                self.rideID = responseDict?[APIKeys.kride_user] as? String ?? ""
            //    self.parseRideDetail(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func bookRideDetailData(user_id: String, ride_id: String, book_id: String, response: @escaping withResponseCallBack) {
        APIManager.bookRideDetail(user_id: user_id, ride_id: ride_id, book_id: book_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                print(responseDict!)
                self.parseBookedRideDetailData(responseDict: responseDict!)
                response(true, responseDict,message, nil)
            }else{
                response(false,nil ,message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil,nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }

    }
    
    func bankDelete(user_id: String, bank_id: String, response: @escaping responseCallBack) {
        APIManager.deleteBank(user_id: user_id, bank_id: bank_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func cardDelete(user_id: String, card_id: String, response: @escaping responseCallBack) {
        APIManager.deleteCard(user_id: user_id, card_id: card_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func carDelete(user_id: String, car_id: String, response: @escaping responseCallBack) {
        APIManager.deleteCar(user_id: user_id, car_id: car_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func offerRideData(user_id: String, ride_id: String, response: @escaping responseCallBack) {
        APIManager.offerRideDetail(user_id: user_id, ride_id: ride_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                print(responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func updateProfileData(userid: String, firstName: String, lastName: String, pic: String, city: String, state: String, zip: String, dob: String, bio: String,is_smoking : String,is_pets : String,is_music : String,is_chat : String, relative_mobile : String, response: @escaping responseCallBack) {
        APIManager.updateProfile(userid: userid, firstName: firstName, lastName: lastName, pic: pic, city: city, state: state, zip: zip, dob: dob, bio: bio,is_smoking : is_smoking,is_pets : is_pets,is_music : is_music,is_chat : is_chat, relative_mobile: relative_mobile,  successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                print(responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func cancelReasions(user_id: String,reason_type : String,currentTime: String,book_id : String, response: @escaping responseCallBack) {
        APIManager.cancelReasions(user_id: user_id,reason_type : reason_type, currentTime: currentTime, book_id: book_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseReasonsData(responseDict : responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
  
    func cancelRide(user_id: String, ride_id: String, book_id: String, action: String, book_reason_text: String,comment : String,currentTime : String, response: @escaping responseCallBack) {
        APIManager.cancelRide(user_id: user_id, ride_id: ride_id, book_id: book_id, action: action, book_reason_text: book_reason_text, comment: comment ,currentTime : currentTime, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
               
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    func CheckRide(user_id: String, ride_id: String, book_id: String, action: String, currentTime: String,comment : String,book_code : String, response: @escaping responseCallBack) {
        APIManager.CheckRide(user_id: user_id, ride_id: ride_id, book_id: book_id, action: action, currentTime: currentTime, comment: comment,book_code : book_code, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    func rideHistory(user_id: String, response: @escaping responseCallBack) {
        APIManager.rideHistory(user_id: user_id, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                 self.historyRideData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func getRideDetails(user_id : String,from_lat : String,from_long : String,to_lat : String, to_long : String, response: @escaping withResponseCallBack) {
        
        APIManager.getRideDetails(user_id : user_id,from_lat : from_lat,from_long : from_long,to_lat : to_lat, to_long : to_long, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.parseRideData(responseDict: responseDict!)

              //  self.historyRideData(responseDict: responseDict!)
                response(true, responseDict,message, nil)
            }else{
                response(false, nil,message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil,nil,APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func deleteRide(user_id : String,ride_id : String,action : String,cancel_reason : String,comment : String, book_id : String,book_code : String, response: @escaping responseCallBack) {
        APIManager.deleteRide(user_id : user_id,ride_id : ride_id,action : action,cancel_reason : cancel_reason,comment : comment, book_id: book_id,book_code: book_code, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
             
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func socialLogin(email : String,device_type : String,device_token : String,socialtoken : String,firstname : String,lastname : String,login_type : Int , response: @escaping responseCallBackNew,response1:@escaping responseCallBack) {
        APIManager.socialLogin(email : email,device_type : device_type,device_token : device_token,socialtoken : socialtoken,firstname : firstname,lastname : lastname,login_type : login_type, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                
                
                guard let data = responseDict?["data"] as? [String:Any]else{return}
                
                let mobile = data["mobile"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                  self.parseLoginData(responseDict: responseDict!)
                response(true, message,email ,mobile,nil)
            }else{
                response1(false, message, nil)
            }
        }) { (errorReason, error) in
            response1(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func verifySSN(user_id : String,snn : String, response: @escaping responseCallBack) {
        APIManager.verifySSN(user_id : user_id,snn : snn, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    func VerifyLicence(user_id : String,first_name : String,last_name : String,state : String,doi : String,dob : String,license_number : String, response: @escaping responseCallBack) {
        APIManager.VerifyLicence(user_id : user_id,first_name : first_name,last_name : last_name,state : state,doi : doi,dob : dob,license_number : license_number, successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    func carMakeList(response: @escaping responseCallBack) {
        APIManager.carMakeList(successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                  self.makeListData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func carModel(make: String,response: @escaping responseCallBack) {
        APIManager.carModel(make: make,successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.modelListData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func carYear(make : String,model : String,response: @escaping responseCallBack) {
        APIManager.carYear(make : make,model : model,successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.yearsListData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    
    func panicApi(user_id : String,ride_id : String,lattitude : String,longitude : String,response: @escaping responseCallBack) {
          APIManager.panicApi(userId: user_id, ride_id: ride_id, latitude: lattitude, longitude: longitude,successCallback: { (responseDict) in
              let success = responseDict?[APIKeys.kstatus] as! Int
              let message = responseDict?[APIKeys.kmessage] as? String
              if success ==  1{
//                  self.yearsListData(responseDict: responseDict!)
                  response(true, message, nil)
              }else{
                  response(false, message, nil)
              }
          }) { (errorReason, error) in
              response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
          }
      }
    func completeDriver(user_id: String, ride_id: String,  response: @escaping responseCallBack) {
        APIManager.completeDriver(userId: user_id, ride_id: ride_id,  successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
               
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    
    func addAddress(work_type : String,user_id : String,favourite_address : String,address:String,work_address:String,response: @escaping responseCallBack) {
        APIManager.addAddress(work_type : work_type,user_id : user_id,favourite_address : favourite_address,address: address,work_address: work_address,successCallback: { (responseDict) in
            let success = responseDict?[APIKeys.kstatus] as! Int
            let message = responseDict?[APIKeys.kmessage] as? String
            if success ==  1{
                self.yearsListData(responseDict: responseDict!)
                response(true, message, nil)
            }else{
                response(false, message, nil)
            }
        }) { (errorReason, error) in
            response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
        }
    }
    func sendNumber(phone : String,userid : String,email:String,response: @escaping responseCallBack) {
    
        APIManager.sendNumber(phone: phone, userid: userid, email: email,successCallback: { (responseDict) in
       let success = responseDict?[APIKeys.kstatus] as! Int
       let message = responseDict?[APIKeys.kmessage] as? String
       if success ==  1{
           self.yearsListData(responseDict: responseDict!)
           response(true, message, nil)
       }else{
           response(false, message, nil)
       }
   }) { (errorReason, error) in
       response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
   }
}//
    func getReviewDetail(userid : String,response: @escaping responseCallBack) {
       APIManager.walletInfo(user_id: userid,successCallback: { (responseDict) in
           let success = responseDict?[APIKeys.kstatus] as! Int
           let message = responseDict?[APIKeys.kmessage] as? String
           if success ==  1{
               self.parseRatingData(responseDict: responseDict!)
               response(true, message, nil)
           }else{
               response(false, message, nil)
           }
       }) { (errorReason, error) in
           response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
       }
    }//
    
    
    func deleteUser(userid : String,reason : String,comment : String,response: @escaping responseCallBack) {
        APIManager.deleteUser(userId: userid,reason: reason,comment: comment,successCallback: { (responseDict) in
           let success = responseDict?[APIKeys.kstatus] as! Int
           let message = responseDict?[APIKeys.kmessage] as? String
           if success ==  1{
//               self.parseRatingData(responseDict: responseDict!)
               response(true, message, nil)
           }else{
               response(false, message, nil)
           }
       }) { (errorReason, error) in
           response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
       }
    }//
    
    
    
    func feedback(rate_from_user: String, rate_to_user: String, rate_star: String, rate_comment: String, is_clean: String, is_friendly: String, is_safe: String, is_punctual: String, like_dislike: String,response: @escaping responseCallBack) {
        APIManager.feedBack(rate_from_user: rate_from_user, rate_to_user: rate_to_user, rate_star: rate_star, rate_comment: rate_comment, is_clean: is_clean, is_friendly: is_friendly, is_safe: is_safe, is_punctual: is_punctual, like_dislike: like_dislike,successCallback: { (responseDict) in
           let success = responseDict?[APIKeys.kstatus] as! Int
           let message = responseDict?[APIKeys.kmessage] as? String
           if success ==  1{
//               self.parseRatingData(responseDict: responseDict!)
               response(true, message, nil)
           }else{
               response(false, message, nil)
           }
       }) { (errorReason, error) in
           response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
       }
    }
    
    func rideOnlineStatus(userid : String,response: @escaping responseCallBack2) {
        APIManager.rideOnlineStatus(userId: userid,successCallback: { (responseDict) in
               let success = responseDict?[APIKeys.kstatus] as! Int
               let message = responseDict?[APIKeys.kmessage] as? String
               if success ==  1{
    //               self.parseRatingData(responseDict: responseDict!)
                let rideId = responseDict?["ride_id"] as? String ?? ""
                let am_i_booked = String(responseDict?["am_i_booked"] as? Int ?? 0)
                response(am_i_booked,rideId,true, message, nil)
               }else{
                   response("","",false, message, nil)
               }
           }) { (errorReason, error) in
               response("","",false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
           }
        }//
    
    func discountAmount(userid : String ,ride_id: String,book_amount: String,coupon_code: String,response: @escaping responseCallBack) {
        APIManager.discountAmount(userId: userid, ride_id: ride_id, book_amount: book_amount, coupon_code: coupon_code,successCallback: { (responseDict) in
               let success = responseDict?[APIKeys.kstatus] as! Int
               let message = responseDict?[APIKeys.kmessage] as? String
               if success ==  1{
                  self.parseCoupounAmount(responseDict: responseDict!)
                   response(true, message, nil)
               }else{
                   response(false, message, nil)
               }
           }) { (errorReason, error) in
               response(false, nil, APIManager.errorForNetworkErrorReason(errorReason: errorReason!))
           }
        }//
    
}
