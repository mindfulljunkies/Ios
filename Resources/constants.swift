//
//  constants.swift
//  
//
//  Created by Gurpreet Gulati on 16/08/18.
//

import Foundation
let kInstanceToken = "instance_Token"
var userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
enum APIConstants :String {
    case
    isSuccess = "isSuccess",
    data = "data",
    error = "error",
    items = "items",
    pageNo = "pageNo",
    total = "total",
    totalRecords = "totalRecords"
}



let kAppTitle             =   (AppInfo.kAppTitle.isEmpty == true) ? "ClassyDrives":AppInfo.kAppTitle


var instanceToken:String{
    set{
        UserDefaults.standard.set(newValue, forKey: kInstanceToken)
        
        UserDefaults.standard.synchronize()
        
    }
    get{
        guard let instanceToken = UserDefaults.standard.object(forKey: kInstanceToken) as? String else { return "" }
        return instanceToken
    }
}

struct AppInfo {
    static let bundleDisplayName =  Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    static let bundleName = Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
    static let kAppTitle = bundleDisplayName ?? bundleName ?? ""
    static let kAppVersionString: String = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    static let kBuildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
}

struct appConstants{
  static let token = "token"
  static let password = "password"
  static let profile = "profile"
  static let orgToken = "orgToken"
  static let deviceId = "deviceId"
  static let id = "id"
  static let userId = "userId"
  static let alreadyLoggedIn = "alreadyLoggedIn"
  static let picUrls = "picUrls"
  static let isDiabetes = "isDiabetes"
  static let fcmToken = "fcmToken"
  static let email = "email"
  static let phone = "phone"
  static let code = "code"
  static let onlyPhoneNo = "onlyPhoneNo"
  static let profileData = "profileData"
  static let designation = "designation"
  static let name = "name"
  static let censoredList = "censoredList"
  static let deviceType = "deviceType"
  static let username = "username"
  static let folder = "folder"
  static let task = "task"
  static let region = "region"
  static let country = "country"
  static let dob = "dob"
  static let zipCode = "zipCode"
  static let lga = "lga"
  static let town = "town"
  static let googleId = "googleId"
  static let facebookId = "facebookId"
  static let post = "post"
  static let isLoggedIn = "isLoggedIn"
  static let isSeenTutorial = "isSeenTutorial"
  static let UserImage = "UserImage"
  static let forgotpassCheck = "forgotpassCheck"
  static let orderId = "orderId"
  static let clientId = "clientId"
  static let productDict = "productDict"
  static let cartArray = "cartArray"
  static let loanId = "loanId"

}

struct AppConstants{
    static let genderArray = ["Male","Female","Other","None"]
    static let sortByPrice = ["Low to high","High to low"]
}

struct Constants {
    static let kUserDefaults = UserDefaults.standard
    static let encodeDefaults = NSKeyedArchiver.self
}

let kAppDelegate = AppDelegate().sharedInstance()



