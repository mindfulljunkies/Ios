//
//  UserServices.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
import UIKit

enum UserServices: APIService{
    
    case Login(login_type : Int,email: String, password: String, device_type: String, device_token: String, device_id: String)
    case Register(firstname: String, lastname: String, email: String, password: String, device_type: String, device_token: String, dob: String, city: String, state: String, zip: String, bio: String, mobile: String,apple_id:String)
    case ForgetPassword(email: String)
    case State
    case City(state_id: String)
    case CreateRide(ride_user: String, ride_from_address: String, ride_to_address: String, ride_from_lat: String, ride_from_long: String, ride_to_lat: String, ride_to_long: String, ride_from_address2: String, ride_from_lat2: String, ride_from_long2: String, ride_from_address3: String, ride_from_lat3: String, ride_from_long3: String, ride_date: String, ride_time: String, ride_amount: String, ride_seat: String, ride_about: String, car_id: String, detour: String,is_local_ride : String,current_time : String,is_autoapproval : String)

    case BookRide(user_id: String, book_ride: String, seat: String, ride_from_address: String, ride_from_lat: String, ride_from_long: String, ride_to_address: String, ride_to_lat: String, ride_to_long: String, book_amount: String, book_distance: String, book_elapsedtime: String, is_local_ride : String, pickup_distance:String,dropup_distance:String,discountAmount:String,applied_id:String,book_create:String)
  
    case CarDetails(car_user: String)
    case AddCar(car_name: String, car_model: String, car_year: String, car_image: String, car_user: String,car_color : String)
    case FindRide(userid: String, from_address: String, to_address: String, from_lat: String, from_long: String, to_lat: String, to_long: String, date: String, price: String,is_local_ride : String)
    case ResendOtp(mobile: String,userid:String)
    case otpVerify(otp: String, mobile: String)
    case  wallet(user_id: String)
    case  addMoneyToCard(user_id: String, card_id: String, add_amount: String)

    case ProfileDetails(userid: String)
    case NotificationsDetails(userid: String)
    case UserNotificationsDelete(userid: String,notif : String)

    case AddCard(user_id: String, card_number: String, exp_month: String, cvv: String, exp_year: String,card_type: String)
    case AddBank(user_id: String, routing_number: String, account_number: String)
    case ManageRide(user_id: String)
    case BookRideDetail(user_id: String, ride_id: String, book_id: String)
    case DeleteBank(user_id: String, bank_id: String)
    case DeleteCard(user_id: String, card_id: String)
    case DeleteCar(user_id: String, car_id: String)
    case OfferRideDetail(user_id: String, ride_id:String)
   
    case UpdateProfile(userid: String, firstName: String, lastName: String, pic: String, city: String, state: String, zip: String, dob: String, bio: String,is_smoking : String,is_pets : String,is_music : String,is_chat : String,relative_mobile : String)
   
    case CancelReasions(user_id : String,reason_type : String, currentTime : String , book_id : String)
    case CancelRide(user_id : String,ride_id : String,book_id : String,action : String,book_reason_text : String,comment : String,currentTime : String)
    case CheckRide(user_id : String,ride_id : String,book_id : String,action : String,currentTime : String,comment : String, book_code : String)

    case RideHistory(user_id : String)
    case GetRideDetails(user_id : String,from_lat : String,from_long : String,to_lat : String, to_long : String)
    case DeleteRide(user_id : String,ride_id : String,action : String,cancel_reason : String,comment : String,book_id : String , book_code : String)

        //MarK:- Social Integration Api
    case SocialLogin(email : String,device_type : String,device_token : String,socialtoken : String,firstname : String,lastname : String,login_type : Int)
    case VerifySSN(user_id : String,snn : String)
    case Send_Number(userid : String , phone_number : String,email:String)

     //MarK:- Add Car
    case CarMakeList
    case CarModel(make : String)
    case CarYear(make : String,model : String)
    
    //MarK:- Add User Address
    case Addadress(work_type : String,user_id : String,favourite_address : String)
    case panicApi(user_id : String,ride_id : String, latitude : String,longitude : String)
    case completeDriver(user_id : String,ride_id : String)
    case walletInfo(user_id : String)
    case rideOnlineStatus(user_id : String)
    case discountAmount(user_id : String,ride_id : String,book_amount : String,coupon_code : String)

    //MArk:- Varify Driving Licness
    case VerifyLicence(user_id : String,first_name : String,last_name : String,state : String,doi : String,dob : String,license_number : String)
case deleteUser(user_id : String,reason : String,comment : String)

    var path: String{
        var path = ""
        
        switch self {
        case .Login:
            path = BASE_URL.appending("login")
            case .NotificationsDetails:
            path = BASE_URL.appending("notiList")
            
            case .Register:
            path = BASE_URL.appending("registration")
            case .ForgetPassword:
            path = BASE_URL.appending("forget_password")
            case .State:
            path = BASE_URL.appending("stateDetail")
            
        case .City:
            path = BASE_URL.appending("cityDetail")
            
        case .CreateRide:
            path = BASE_URL.appending("createride")
            
        case .CarDetails:
            path = BASE_URL.appending("carDetail")
            
        case .AddCar:
            path = BASE_URL.appending("addCar")
            
        case .FindRide:
            path = BASE_URL.appending("search")
            
        case .ResendOtp:
            path = BASE_URL.appending("resend_otp")
            
        case .otpVerify:
            path = BASE_URL.appending("otp_verify")
            
        case .wallet:
            path = BASE_URL.appending("bankcardDetail")
            
        case .ProfileDetails:
            path = BASE_URL.appending("profileDetail")
            
        case .AddCard:
            path = BASE_URL.appending("addcardstripe")
            
        case .AddBank:
            path = BASE_URL.appending("addbankstripe")
            
        case .ManageRide:
            path = BASE_URL.appending("manageRides")
            
        case .BookRide:
            path = BASE_URL.appending("bookingRide")
            
        case .BookRideDetail:
            path = BASE_URL.appending("rideBookingDetail")
            
        case .DeleteBank:
            path = BASE_URL.appending("bankDelete")
            
        case .DeleteCard:
            path = BASE_URL.appending("cardDelete")
            
        case .DeleteCar:
            path = BASE_URL.appending("carDelete")
            
        case .OfferRideDetail:
            path = BASE_URL.appending("rideDetail")
            
        case .UpdateProfile:
            path = BASE_URL.appending("updateProfile")
      
        case .CancelReasions:
            path = BASE_URL.appending("reason")
        
        case .CancelRide:
            path = BASE_URL.appending("actionuserride")
      
        case  .RideHistory:
            path = BASE_URL.appending("manageHistoryRides")
   
        case .GetRideDetails:
            path = BASE_URL.appending("carBankList")
       
        case .DeleteRide:
            path = BASE_URL.appending("actionRide")
      
        case .SocialLogin:
            path = BASE_URL.appending("sociallogin")
       
        case .VerifySSN:
            path = BASE_URL.appending("addSnnDriving")
       
        case .CarMakeList:
            path = BASE_URL.appending("makeList")
       
        case .CarModel:
            path = BASE_URL.appending("modalList")
        
        case .CarYear:
            path = BASE_URL.appending("yearList")
      
        case .Addadress:
            path = BASE_URL.appending("addressType")
     
      case   .VerifyLicence:
            path = BASE_URL.appending("driving_license")
        
        case .CheckRide:
            path = BASE_URL.appending("startRideCheck")
            case .Send_Number:
                path = BASE_URL.appending("send_number")
        case .addMoneyToCard:
            path = BASE_URL.appending("addMoneytoWallet")
        case .panicApi :
            path = BASE_URL.appending("panicButton")
            case .completeDriver :
            path = BASE_URL.appending("completeDriver")
            case .walletInfo :
            path = BASE_URL.appending("walletInfo")
           case .deleteUser :
           path = BASE_URL.appending("deleteuser")
            
            case .rideOnlineStatus :
            path = BASE_URL.appending("rideOnlineStatus")

        case .discountAmount :
            path = BASE_URL.appending("discountAmount")
        case .UserNotificationsDelete :
        path = BASE_URL.appending("notiDelete")

        }
       //
         return path
    }
    
    var resource: Resource{
        var resource: Resource?
        
        var parameterDict = JSONDictionary()
        switch  self {
          case let .Login(login_type,email, password, device_type, device_token, device_id):
            parameterDict[APIKeys.kemail] = email
            parameterDict[APIKeys.kpassword] = password
            parameterDict[APIKeys.kdevice_type] = device_type
            parameterDict[APIKeys.kdevice_token] = device_token
            parameterDict[APIKeys.kdevice_id] = device_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .Register(firstname, lastname, email, password, device_type, device_token, dob, city, state, zip, bio, mobile,apple_id):
            parameterDict[APIKeys.kfirstname] = firstname
            parameterDict[APIKeys.klastname] = lastname
            parameterDict[APIKeys.kemail] = email
            parameterDict[APIKeys.kpassword] = password
            parameterDict[APIKeys.kdevice_type] = device_type
            parameterDict[APIKeys.kdevice_token] = device_token
            parameterDict[APIKeys.kdob] = dob
            parameterDict[APIKeys.kcity] = city
            parameterDict[APIKeys.kstate] = state
            parameterDict[APIKeys.kzip] = zip
            parameterDict[APIKeys.kbio] = bio
            parameterDict[APIKeys.kmobile] = mobile
            parameterDict["apple_id"] = apple_id

            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .ResendOtp(mobile,userid):
            parameterDict[APIKeys.kmobile] = mobile
            parameterDict[APIKeys.kuserid] = userid
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .otpVerify(otp, mobile):
            parameterDict[APIKeys.kotp] = otp
            parameterDict[APIKeys.kmobile] = mobile
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .ForgetPassword(email):
            parameterDict[APIKeys.kemail] = email
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case .State:
            resource = Resource(method: .get, parameters: nil, headers: nil)
            
        case let .City(state_id):
            parameterDict[APIKeys.kstate_id] = state_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .CreateRide(ride_user, ride_from_address, ride_to_address, ride_from_lat, ride_from_long, ride_to_lat, ride_to_long, ride_from_address2, ride_from_lat2, ride_from_long2, ride_from_address3, ride_from_lat3, ride_from_long3, ride_date, ride_time, ride_amount, ride_seat, ride_about, car_id, detour,is_local_ride,current_time,is_autoapproval):
            parameterDict[APIKeys.kride_user] = ride_user
            parameterDict[APIKeys.kride_from_address] = ride_from_address
            parameterDict[APIKeys.kride_to_address] = ride_to_address
            parameterDict[APIKeys.kride_from_lat] = ride_from_lat
            parameterDict[APIKeys.kride_from_long] = ride_from_long
            parameterDict[APIKeys.kride_to_lat] = ride_to_lat
            parameterDict[APIKeys.kride_to_long] = ride_to_long
            parameterDict[APIKeys.kride_from_address2] = ride_from_address2
            parameterDict[APIKeys.kride_from_lat2] = ride_from_lat2
            parameterDict[APIKeys.kride_from_long2] = ride_from_long2
            parameterDict[APIKeys.kride_from_address3] = ride_from_address3
            parameterDict[APIKeys.kride_from_lat3] = ride_from_lat3
            parameterDict[APIKeys.kride_from_long3] = ride_from_long3
            parameterDict[APIKeys.kride_date] = ride_date
            parameterDict[APIKeys.kride_time] = ride_time
            parameterDict[APIKeys.kride_amount] = ride_amount
            parameterDict[APIKeys.kride_seat] = ride_seat
            parameterDict[APIKeys.kride_about] = ride_about
            parameterDict[APIKeys.kcar_id] = car_id
           // parameterDict[APIKeys.kbank_id] = bank_id
            parameterDict[APIKeys.kdetour] = detour
            parameterDict[APIKeys.kis_local_ride] = is_local_ride
            parameterDict[APIKeys.kcurrent_time] = current_time
            parameterDict[APIKeys.kis_autoapproval] = is_autoapproval
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .FindRide(userid, from_address, to_address, from_lat, from_long, to_lat, to_long, date, price,is_local_ride):
            parameterDict[APIKeys.kuserid] = userid
            parameterDict[APIKeys.kfrom_address] = from_address
            parameterDict[APIKeys.kto_address] = to_address
            parameterDict[APIKeys.kfrom_lat] = from_lat
            parameterDict[APIKeys.kfrom_long] = from_long
            parameterDict[APIKeys.kto_lat] = to_lat
            parameterDict[APIKeys.kto_long] = to_long
            parameterDict[APIKeys.kdate] = date
            parameterDict[APIKeys.kprice] = price
            parameterDict["is_local_ride"] = is_local_ride
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .CarDetails(car_user):
            parameterDict[APIKeys.kcar_user] = car_user
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
            
//            ////////////
        case let .AddCar(car_name, car_model, car_year, car_image, car_user,car_color):
            parameterDict[APIKeys.kcar_name] = car_name
            parameterDict[APIKeys.kcar_model] = car_model
            parameterDict[APIKeys.kcar_year] = car_year
            parameterDict[APIKeys.kcar_image] = car_image
            parameterDict[APIKeys.kcar_user] = car_user
            parameterDict["car_color"] = car_color
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
       case let .wallet(user_id):
            parameterDict[APIKeys.kuser_id] = user_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .ProfileDetails(userid):
            parameterDict[APIKeys.kuserid] = userid
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .AddCard(user_id, card_number, exp_month, cvv, exp_year,card_type):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kcard_number] = card_number
            parameterDict[APIKeys.kexp_month] = exp_month
            parameterDict[APIKeys.kcvv] = cvv
            parameterDict[APIKeys.kexp_year] = exp_year
            parameterDict[APIKeys.kcard_type] = card_type
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .AddBank(user_id, routing_number, account_number):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.krouting_number] = routing_number
            parameterDict[APIKeys.kaccount_number] = account_number
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .ManageRide(user_id):
            parameterDict[APIKeys.kuser_id] = user_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
          //,book_amount : String,book_distance : String,book_elapsedtime : String
   
        case let .BookRide(user_id, book_ride, seat, ride_from_address, ride_from_lat, ride_from_long, ride_to_address, ride_to_lat, ride_to_long, book_amount, book_distance, book_elapsedtime ,is_local_ride, pickup_distance, dropup_distance, discountAmount, applied_id,book_create):
       
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kbook_ride] = book_ride
            parameterDict[APIKeys.kseat] = seat
            parameterDict[APIKeys.kride_from_address] = ride_from_address
            parameterDict[APIKeys.kride_from_lat] = ride_from_lat
            parameterDict[APIKeys.kride_from_long] = ride_from_long
            parameterDict[APIKeys.kride_to_address] = ride_to_address
            parameterDict[APIKeys.kride_to_lat] = ride_to_lat
            parameterDict[APIKeys.kride_to_long] = ride_to_long
            parameterDict[APIKeys.kbook_amount] = book_amount
            parameterDict[APIKeys.kbook_distance] = book_distance
            parameterDict[APIKeys.kbook_elapsedtime] = book_elapsedtime
            parameterDict[APIKeys.kis_local_ride] = is_local_ride
            parameterDict[APIKeys.kbook_create] = book_create

            parameterDict[APIKeys.kpickup_distance] = pickup_distance
            parameterDict[APIKeys.kdropup_distance] = dropup_distance
            parameterDict[APIKeys.kdiscountAmount] = discountAmount
            parameterDict[APIKeys.kapplied_id] = applied_id
            
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
            
        case let .BookRideDetail(user_id, ride_id, book_id):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kride_id] = ride_id
            parameterDict[APIKeys.kbook_id] = book_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .DeleteBank(user_id, bank_id):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kbank_id] = bank_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .DeleteCard(user_id, card_id):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kcard_id] = card_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .DeleteCar(user_id, car_id):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kcar_id] = car_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .OfferRideDetail(user_id, ride_id):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kride_id] = ride_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case let .UpdateProfile(userid, firstName, lastName, pic, city, state, zip, dob, bio,is_smoking ,is_pets,is_music,is_chat,updateProfile):
            parameterDict[APIKeys.kuserid] = userid
            parameterDict[APIKeys.kfirstname] = firstName
            parameterDict[APIKeys.klastname] = lastName
            parameterDict[APIKeys.kpic] = pic
            parameterDict[APIKeys.kcity] = city
            parameterDict[APIKeys.kstate] = state
            parameterDict[APIKeys.kzip] = zip
            parameterDict[APIKeys.kdob] = dob
            parameterDict[APIKeys.kbio] = bio
            parameterDict["relative_mobile"] = updateProfile

            parameterDict["is_smoking"] = is_smoking
            parameterDict["is_pets"] = is_pets
            parameterDict["is_music"] = is_music
            parameterDict["is_chat"] = is_chat
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
        
        case let .CancelReasions(user_id,reason_type,currentTime,book_id):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict["reason_type"] = reason_type
            parameterDict["currentTime"] = currentTime
            parameterDict["book_id"] = book_id

             resource = Resource(method: .post, parameters: parameterDict, headers: nil)
      
        case let .CancelRide( user_id, ride_id, book_id, action, book_reason_text,comment,currentTime):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kride_id] = ride_id
            parameterDict[APIKeys.kbook_id] = book_id
            parameterDict[APIKeys.kaction] = action
            parameterDict[APIKeys.kcomment] = comment
            parameterDict["currentTime"] = currentTime

            parameterDict[APIKeys.kbook_reason_text] = book_reason_text
             resource = Resource(method: .post, parameters: parameterDict, headers: nil)
       
        case let .RideHistory(user_id):
              parameterDict[APIKeys.kuser_id] = user_id
             resource = Resource(method: .post, parameters: parameterDict, headers: nil)
       
    case let .GetRideDetails( user_id,  from_lat,  from_long,  to_lat,  to_long):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kfrom_lat] = from_lat
            parameterDict[APIKeys.kfrom_long] = from_long
            parameterDict[APIKeys.kto_lat] = to_lat
            parameterDict[APIKeys.kto_long] = to_long
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
        
        case  let .DeleteRide( user_id,  ride_id, action,  cancel_reason,  comment,bookId,bookCode):
            parameterDict[APIKeys.kuser_id] = user_id
           parameterDict[APIKeys.kride_id] = ride_id
            parameterDict[APIKeys.kaction] = action
            parameterDict[APIKeys.kcancel_reason] = cancel_reason
            parameterDict[APIKeys.kcomment] = comment
            parameterDict["book_id"] = bookId
            parameterDict["book_code"] = bookCode

            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
      
        case let .SocialLogin( email,  device_type,  device_token, socialtoken,  firstname, lastname,  login_type ):
            parameterDict["email"] = email
            parameterDict["device_type"] = device_type
            parameterDict["device_token"] = device_token
            parameterDict["socialtoken"] = socialtoken
            parameterDict["firstname"] = firstname
            parameterDict["lastname"] = lastname
            parameterDict["login_type"] = login_type
            

            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
     
        case let .VerifySSN( user_id,  snn):
            parameterDict["user_id"] = user_id
            parameterDict["snn"] = snn
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
      
        case .CarMakeList:
             resource = Resource(method: .post, parameters: parameterDict, headers: nil)
      
        case let .CarModel(make):
              parameterDict["make"] = make
             resource = Resource(method: .post, parameters: parameterDict, headers: nil)
       
        case let .CarYear( make,  model):
            parameterDict["make"] = make
            parameterDict["model"] = model
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            
        case  let .Addadress( work_type,  user_id,  favourite_address):
            parameterDict["work_type"] = work_type
            parameterDict["user_id"] = user_id
            parameterDict["favourite_address"] = favourite_address
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
      
        case let  .VerifyLicence(  user_id,   first_name,   last_name,  state,  doi,  dob,  license_number):
            parameterDict["user_id"] = user_id
            parameterDict["first_name"] = first_name
            parameterDict["last_name"] = last_name
            parameterDict["state"] = state
            parameterDict["doi"] = doi
            parameterDict["dob"] = dob
            parameterDict["license_number"] = license_number
//            parameterDict["driving_id"] = driving_id
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
       
        case .CheckRide(let user_id, let ride_id, let book_id, let action, let currentTime, let comment , let book_code):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kride_id] = ride_id
            parameterDict[APIKeys.kbook_id] = book_id
            parameterDict[APIKeys.kaction] = action
            parameterDict[APIKeys.kcomment] = comment
            parameterDict["book_code"] = book_code

            parameterDict[APIKeys.kcurrentTime] = String().localToUTC(date: currentTime)
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)
        case .Send_Number(let user_id, let phone_number,let email):
             parameterDict[APIKeys.kuserid] = user_id
                     parameterDict[APIKeys.kmobile] = phone_number
parameterDict["email"] = email
                       resource = Resource(method: .post, parameters: parameterDict, headers: nil)
        case .addMoneyToCard(let user_id, let card_id, let add_amount):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kcard_id] = card_id
            parameterDict[APIKeys.kadd_amount] = add_amount
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)

        case .panicApi( let user_id , let ride_id , let latitude ,let longitude ):
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict[APIKeys.kride_id] = ride_id
            parameterDict["latitude"] = latitude
            parameterDict["longitude"] = longitude
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)

        
        case .completeDriver( let user_id , let ride_id ):
                   parameterDict[APIKeys.kuser_id] = user_id
                   parameterDict[APIKeys.kride_id] = ride_id
                  
                   resource = Resource(method: .post, parameters: parameterDict, headers: nil)

        case .walletInfo(let user_id):
            parameterDict[APIKeys.kuser_id] = user_id
             resource = Resource(method: .post, parameters: parameterDict, headers: nil)
            case .NotificationsDetails(let user_id):
                      parameterDict[APIKeys.kuser_id] = user_id
                       resource = Resource(method: .post, parameters: parameterDict, headers: nil)
        case .UserNotificationsDelete(let user_id,let notiId ):
                                 parameterDict[APIKeys.kuser_id] = user_id
                                 parameterDict["noti_id"] = notiId

                                  resource = Resource(method: .post, parameters: parameterDict, headers: nil)
        case .deleteUser(let user_id, let reason, let comment):
            
            parameterDict[APIKeys.kuser_id] = user_id
            parameterDict["comment"] = comment
            parameterDict["reason"] = reason
            resource = Resource(method: .post, parameters: parameterDict, headers: nil)

        
        case .rideOnlineStatus(let user_id):
                   
                   parameterDict[APIKeys.kuser_id] = user_id
                   resource = Resource(method: .post, parameters: parameterDict, headers: nil)
         
        case .discountAmount(let user_id, let ride_id, let book_amount, let coupon_code):
             parameterDict[APIKeys.kuser_id] = user_id
             parameterDict["ride_id"] = ride_id
             parameterDict["book_amount"] = book_amount
             parameterDict["coupon_code"] = coupon_code

                              resource = Resource(method: .post, parameters: parameterDict, headers: nil)
        
        }
        return resource ?? Resource(method: .post, parameters: [:], headers: [:])
  }
}



//MARK: - API Manager
extension APIManager{
    class func login(login_type : Int,email: String, password: String, device_type: String, device_token: String, device_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.Login(login_type: login_type, email: email, password: password, device_type: device_type, device_token: device_token, device_id: device_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
  
    class func registor(firstname: String, lastname: String, email: String, password: String, device_type: String, device_token: String, dob: String, city: String, state: String, zip: String, bio: String, mobile: String,apple_id : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.Register(firstname: firstname, lastname: lastname, email: email, password: password, device_type: device_type, device_token: device_token, dob: dob, city: city, state: state, zip: zip, bio: bio, mobile: mobile, apple_id: apple_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func resendOtp(mobile: String,userid:String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.ResendOtp(mobile: mobile, userid: userid).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func otpvarify(otp: String, mobile: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.otpVerify(otp: otp, mobile: mobile).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func forgetPass(email: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
        UserServices.ForgetPassword(email: email).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func walletInfo(user_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
        UserServices.walletInfo(user_id: user_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func stateDetail(successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.State.request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func cityDetail(state_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.City(state_id: state_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func createRide(ride_user: String, ride_from_address: String, ride_to_address: String, ride_from_lat: String, ride_from_long: String, ride_to_lat: String, ride_to_long: String, ride_from_address2: String, ride_from_lat2: String, ride_from_long2: String, ride_from_address3: String, ride_from_lat3: String, ride_from_long3: String, ride_date: String, ride_time: String, ride_amount: String, ride_seat: String, ride_about: String, car_id: String, detour: String,is_local_ride : String,current_time: String ,is_autoapproval:String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
     
        UserServices.CreateRide(ride_user: ride_user, ride_from_address: ride_from_address, ride_to_address: ride_to_address, ride_from_lat: ride_from_lat, ride_from_long: ride_from_long, ride_to_lat: ride_to_lat, ride_to_long: ride_to_long, ride_from_address2: ride_from_address2, ride_from_lat2: ride_from_lat2, ride_from_long2: ride_from_long2, ride_from_address3: ride_from_address3, ride_from_lat3: ride_from_lat3, ride_from_long3: ride_from_long3, ride_date: ride_date, ride_time: ride_time, ride_amount: ride_amount, ride_seat: ride_seat, ride_about: ride_about, car_id: car_id, detour: detour, is_local_ride: is_local_ride, current_time: current_time,is_autoapproval : is_autoapproval).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func findRide(userid: String, from_address: String, to_address: String, from_lat: String, from_long: String, to_lat: String, to_long: String, date: String, price: String,is_local_ride: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.FindRide(userid: userid, from_address: from_address, to_address: to_address, from_lat: from_lat, from_long: from_long, to_lat: to_lat, to_long: to_long, date: date, price: price, is_local_ride: is_local_ride).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func CarDetail(car_user: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.CarDetails(car_user: car_user).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func addCar(car_name: String, car_model: String, car_year: String, car_image: String, car_user: String,car_color : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
        UserServices.AddCar(car_name: car_name, car_model: car_model, car_year: car_year, car_image: car_image, car_user: car_user, car_color: car_color).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func wallet(user_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.wallet(user_id: user_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func addMoneyToCard(user_id: String, card_id: String, add_amount: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.addMoneyToCard(user_id: user_id, card_id: card_id, add_amount: add_amount).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func addmo(user_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.wallet(user_id: user_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func profile(userid: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
        UserServices.ProfileDetails(userid: userid).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func userNotification(userid: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
        UserServices.NotificationsDetails(userid: userid).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func deleteUserNotification(userid: String,notif : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
        UserServices.UserNotificationsDelete(userid: userid, notif: notif).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func addCardStrip(user_id: String, card_number: String, exp_month: String, cvv: String, exp_year: String,card_type : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.AddCard(user_id: user_id, card_number: card_number, exp_month: exp_month, cvv: cvv, exp_year: exp_year,card_type: card_type).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func addBankStrip(user_id: String, routing_number: String, account_number: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.AddBank(user_id: user_id, routing_number: routing_number, account_number: account_number).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func manageRide(user_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.ManageRide(user_id: user_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func bookRide(user_id: String, book_ride: String, seat: String, ride_from_address: String, ride_from_lat: String, ride_from_long: String, ride_to_address: String, ride_to_lat: String, ride_to_long: String, book_amount: String, book_distance: String, book_elapsedtime: String, book_card_id: String,is_local_ride: String ,pickup_distance: String, dropup_distance: String, discountAmount: String, applied_id: String,book_create: String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
        UserServices.BookRide(user_id: user_id, book_ride: book_ride, seat: seat, ride_from_address: ride_from_address, ride_from_lat: ride_from_lat, ride_from_long: ride_from_long, ride_to_address: ride_to_address, ride_to_lat: ride_to_lat, ride_to_long: ride_to_long, book_amount: book_amount, book_distance: book_distance, book_elapsedtime: book_elapsedtime, is_local_ride: is_local_ride, pickup_distance: pickup_distance, dropup_distance: dropup_distance, discountAmount: discountAmount, applied_id: applied_id, book_create: book_create).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func bookRideDetail(user_id: String, ride_id: String, book_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.BookRideDetail(user_id: user_id, ride_id: ride_id, book_id: book_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
            
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func deleteBank(user_id: String, bank_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.DeleteBank(user_id: user_id, bank_id: bank_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func deleteCard(user_id: String, card_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.DeleteCard(user_id: user_id, card_id: card_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func deleteCar(user_id: String, car_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.DeleteCar(user_id: user_id, car_id: car_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func offerRideDetail(user_id: String, ride_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.OfferRideDetail(user_id: user_id, ride_id: ride_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func updateProfile(userid: String, firstName: String, lastName: String, pic: String, city: String, state: String, zip: String, dob: String, bio: String,is_smoking : String,is_pets : String,is_music : String,is_chat : String,relative_mobile : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.UpdateProfile(userid: userid, firstName: firstName, lastName: lastName, pic: pic, city: city, state: state, zip: zip, dob: dob, bio: bio,is_smoking : is_smoking,is_pets : is_pets,is_music : is_music,is_chat : is_chat, relative_mobile : relative_mobile).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func cancelReasions(user_id: String,reason_type : String,currentTime : String,book_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        
        UserServices.CancelReasions(user_id: user_id, reason_type: reason_type,currentTime : currentTime,book_id: book_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func cancelRide(user_id: String, ride_id: String, book_id: String, action: String, book_reason_text: String,comment: String,currentTime : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.CancelRide(user_id: user_id, ride_id: ride_id, book_id: book_id, action: action, book_reason_text: book_reason_text, comment: comment, currentTime: currentTime).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func CheckRide(user_id: String, ride_id: String, book_id: String, action: String, currentTime: String,comment: String,book_code : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.CheckRide(user_id: user_id, ride_id: ride_id, book_id: book_id, action: action, currentTime: currentTime, comment: comment,book_code: book_code).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func rideHistory(user_id: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.RideHistory(user_id: user_id).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func getRideDetails(user_id : String,from_lat : String,from_long : String,to_lat : String, to_long : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.GetRideDetails(user_id : user_id,from_lat : from_lat,from_long : from_long,to_lat : to_lat, to_long : to_long).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func deleteRide(user_id : String,ride_id : String,action : String,cancel_reason : String,comment : String, book_id: String,book_code: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.DeleteRide(user_id : user_id,ride_id : ride_id,action : action,cancel_reason : cancel_reason,comment : comment, book_id: book_id ?? "",book_code: book_code ?? "").request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func socialLogin(email : String,device_type : String,device_token : String,socialtoken : String,firstname : String,lastname : String,login_type : Int, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.SocialLogin(email : email,device_type : device_type,device_token : device_token,socialtoken : socialtoken,firstname : firstname,lastname : lastname,login_type : login_type).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func verifySSN(user_id : String,snn : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.VerifySSN(user_id : user_id, snn : snn).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
  class  func drivingLicence(user_id : String,first_name : String,last_name : String,state : String,doi : String,dob : String,license_number : String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback){
      UserServices.VerifyLicence(user_id : user_id,first_name : first_name,last_name : last_name,state : state,doi : doi,dob : dob,license_number : license_number).request(success: { (response) in
          if let responseDict = response as? JSONDictionary {
              successCallback(responseDict)
          }else {
              successCallback([:])
          }
      }, failure: failureCallback)
  }
    class func carMakeList(successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.CarMakeList.request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func carModel(make: String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.CarModel(make: make).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func carYear(make : String,model : String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.CarYear(make : make,model : model).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func addAddress(work_type : String,user_id : String,favourite_address : String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.Addadress(work_type : work_type,user_id : user_id,favourite_address : favourite_address).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func sendNumber(phone : String,userid : String,email:String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.Send_Number(userid: userid, phone_number: phone,email:email).request(success: { (response) in
               if let responseDict = response as? JSONDictionary {
                   successCallback(responseDict)
               }else {
                   successCallback([:])
               }
           }, failure: failureCallback)
       }
    class func VerifyLicence(user_id : String,first_name : String,last_name : String,state : String,doi : String,dob : String,license_number : String,successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.VerifyLicence(user_id : user_id,first_name : first_name,last_name : last_name,state : state,doi : doi,dob : dob,license_number : license_number).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func panicApi(userId: String, ride_id: String, latitude: String, longitude: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        print("hsdhshdhhw--\(userId,ride_id,latitude,longitude)")
        UserServices.panicApi(user_id: userId, ride_id: ride_id, latitude: latitude, longitude: longitude).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func completeDriver(userId: String, ride_id: String,  successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
           UserServices.completeDriver(user_id: userId, ride_id: ride_id).request(success: { (response) in
               if let responseDict = response as? JSONDictionary {
                   successCallback(responseDict)
               }
               else {
                   successCallback([:])
               }
           }, failure: failureCallback)
       }
    class func rideOnlineStatus(userId: String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.rideOnlineStatus(user_id: userId).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func ratingInfo(userId: String, ride_id: String,  successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.walletInfo(user_id: userId).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    class func deleteUser(userId: String, reason: String,comment : String , successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
        UserServices.deleteUser(user_id: userId,reason: reason,comment : comment).request(success: { (response) in
            if let responseDict = response as? JSONDictionary {
                successCallback(responseDict)
            }
            else {
                successCallback([:])
            }
        }, failure: failureCallback)
    }
    
    class func discountAmount(userId: String, ride_id: String,book_amount:String,coupon_code:String,  successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
           UserServices.discountAmount(user_id: userId,ride_id: ride_id,book_amount:book_amount,coupon_code:coupon_code).request(success: { (response) in
               if let responseDict = response as? JSONDictionary {
                   successCallback(responseDict)
               }
               else {
                   successCallback([:])
               }
           }, failure: failureCallback)
       }
//    class func VerifyLicence( user_id : String, first_name : String,last_name : String,state : String,doi : String,dob : String,license_number : String, successCallback: @escaping JSONDictionaryResponseCallback, failureCallback: @escaping APIServiceFailureCallback) {
//        UserServices.VerifyLicence(user_id : user_id, first_name : first_name,last_name : last_name,state : state,doi : doi,dob : dob,license_number : license_number).request(success: { (response) in
//            if let responseDict = response as? JSONDictionary {
//                successCallback(responseDict)
//            }
//            else {
//                successCallback([:])
//            }
//        }, failure: failureCallback)
//    }
}//
