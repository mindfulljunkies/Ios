//
//  UserAPI.swift
//  AQUA
//
//  Created by Krishna on 05/04/17.
//  Copyright © 2017 MindfulSas. All rights reserved.
//

import Foundation


/**
 UserSignIn API contains the endpoints to Create/Read/Update Logged in UserProfiles.
 */

class UserAPI{
    
    private let userRemoteReplicator: UserRemoteReplicator!
   
    
    //Utilize Singleton pattern by instanciating UserAPI only once.
    class var sharedInstance: UserAPI {
        struct Singleton {
            static let instance = UserAPI()
        }
        return Singleton.instance
    }
    
    init(){
        self.userRemoteReplicator = UserRemoteReplicator()
        
    }
    
    
    // MARK: SignUp
    func userSignUp(userDetials: Dictionary<String, AnyObject> , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
        userRemoteReplicator.userSignUp(userDetials: userDetials){ (responseData, error) -> Void in
            if responseData != nil {
                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
                    Constants.kUserDefaults.set(data[appConstants.id], forKey: appConstants.userId)
                       print(Constants.kUserDefaults.string(forKey: appConstants.userId))
                    let dataProfile = NSKeyedArchiver.archivedData(withRootObject: data)
                    Constants.kUserDefaults.set(dataProfile, forKey: appConstants.profile)
                   
                    
                    callback(true,responseData,nil)
                }else{
                    callback(false,responseData,responseData!["error"] as? String)
                }
            }
            
        }
        
    }
    
    
    
    
    // MARK: Forgot Password
    func forgotPassword(userDetials: Dictionary<String, AnyObject> , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
        userRemoteReplicator.forgotPassword(userDetials: userDetials  as! Dictionary<String, AnyObject>){ (responseData, error) -> Void in
            if responseData != nil {
                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
                    Constants.kUserDefaults.set(data[appConstants.id] , forKey: appConstants.userId)
                    print(Constants.kUserDefaults.string(forKey: appConstants.userId))
                    
                    
                    
                    callback(true,responseData,nil)
                }else{
                    callback(false,responseData,responseData!["error"] as? String)
                }
            }
            
        }
        
    }
    
  
  // MARK: SignIn
  
  
    func allPostRequests(userDetials: Dictionary<String, AnyObject> ,method:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
        userRemoteReplicator.allPostRequests(userDetials: userDetials, method: method){ (responseData, error) -> Void in
            if responseData != nil {
                
                callback(true,responseData,nil)
                
            }else{
                callback(false,nil, error)
            }
        }
    }
//    // MARK: Update Profile
//    func userUpdateProfile(userDetials: User , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//
//        userRemoteReplicator.userUpdateProfile(userDetials: userDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>, userID : String(describing: userDetials.id!) ){ (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
//                    let dataProfile = NSKeyedArchiver.archivedData(withRootObject: data)
//                    Constants.kUserDefaults.set(dataProfile, forKey: appConstants.profile)
//                    Constants.kUserDefaults.set(dataProfile, forKey: appConstants.name)
//
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//
//        }
//
//    }
    
//    func updatePassword(userDetials: User , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//
//        userRemoteReplicator.updatePassword(userDetials: userDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>, userID : String(describing: userDetials.id!) ){ (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
//                    let dataProfile = NSKeyedArchiver.archivedData(withRootObject: data)
//                    Constants.kUserDefaults.set(dataProfile, forKey: appConstants.profile)
//                    Constants.kUserDefaults.set(dataProfile, forKey: appConstants.name)
//
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//
//        }
//
//    }
    
    
    
    func userUpdateProfileWhenForgotPassword(userDetials: Dictionary<String, AnyObject>? , userId: String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
        
        
        userRemoteReplicator.updatePassword(userDetials: userDetials  as! Dictionary<String, AnyObject>, userID: userId ){ (responseData, error) -> Void in
            if responseData != nil {
                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
                    let dataProfile = NSKeyedArchiver.archivedData(withRootObject: data)
                    Constants.kUserDefaults.set(dataProfile, forKey: appConstants.profile)
                    
                    
                    
                    
                    
                    callback(true,responseData,nil)
                }else{
                    callback(false,responseData,responseData!["error"] as? String)
                }
            }
            
        }
        
    }
    

   // MARK:-- GetUserDetals
      func getUserDetails(userId:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
      {
        userRemoteReplicator.getUserDetails(query: userId,pageNo: pageNo) { (Data, error) in
          if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
            callback(Data! , nil)
          }
          else{
            print("Getting Error")

          }

        }
      }
    

    
    // MARK:-- getAllUsers
    func getUser(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        userRemoteReplicator.getUser(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
//  // MARK:-- getAllUsers
//  func getDeliverd(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
//  {
//    userRemoteReplicator.getAlldeliverd(query: query,pageNo: pageNo) { (Data, error) in
//      if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
//        callback(Data! , nil)
//      }
//      else{
//        print("Getting Error")
//        
//      }
//      
//    }
//  }
    
    
    // MARK:-- getAllUsers
    func getAllCountry(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        userRemoteReplicator.getAllCountry(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- Get States
    func getState(countryId:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        userRemoteReplicator.getState(query: countryId,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error. Can't fetch states.")
                
            }
            
        }
    }
    
    
    
    //MARK:-- Get Towns
    func getTowns(countryId:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        userRemoteReplicator.getTowns(query: countryId,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error. Can't fetch states.")
                
            }
            
        }
    }
    
    
    //MARK:-- Get LGA by State Id (When NIgeria)
    func getLGAByStateId(stateId:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        userRemoteReplicator.getLGAByStateId(query: stateId,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error. Can't fetch states.")
                
            }
            
        }
    }

    
    
    //MARK:-- Get LGA by Town Id (When SA)
    func getLGAByTownId(zipCodeId:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        userRemoteReplicator.getLGAByTownId(query: zipCodeId,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error. Can't fetch states.")
                
            }
            
        }
    }
    


    

}
