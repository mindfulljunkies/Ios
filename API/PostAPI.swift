//
//  PostAPI.swift
//  SearchApp
//
//  Created by dEEEP on 14/03/18.
//  Copyright © 2018 vannteqfarm. All rights reserved.
//

import Foundation

/**
 UserSignIn API contains the endpoints to Create/Read/Update Logged in UserProfiles.
 */

class PostAPI{
  
  private let postRemoteReplicator: PostRemoteReplicator!
  
  
  //Utilize Singleton pattern by instanciating PostAPI only once.
  class var sharedInstance: PostAPI {
    struct Singleton {
      static let instance = PostAPI()
    }
    return Singleton.instance
  }
  
  init(){
    self.postRemoteReplicator = PostRemoteReplicator()
    
  }    
   

//    //MARK: Create Post
//    func createAddAnalysis(postDetials: Analysis , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        
//        postRemoteReplicator.createAddAnalysis(postDetials: postDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject> ) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    //                    let postData = responseData![APIConstants.post.rawValue] as! Dictionary<String, AnyObject>
//                    //                    let postDataFolder = NSKeyedArchiver.archivedData(withRootObject: postData)
//                    //                    Constants.kUserDefaults.set(postDataFolder, forKey: appConstants.post)
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//        }
//    }
//    
//    
//    //MARK: Create Post
//    func createFeedback(postDetials: Question , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        
//        postRemoteReplicator.createFeedback(postDetials: postDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject> ) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    //                    let postData = responseData![APIConstants.post.rawValue] as! Dictionary<String, AnyObject>
//                    //                    let postDataFolder = NSKeyedArchiver.archivedData(withRootObject: postData)
//                    //                    Constants.kUserDefaults.set(postDataFolder, forKey: appConstants.post)
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//        }
//    }
//    
//    
//    //MARK: Create Post
//    func createReminder(postDetials: Reminder , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        
//        postRemoteReplicator.createReminder(postDetials: postDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject> ) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    //                    let postData = responseData![APIConstants.post.rawValue] as! Dictionary<String, AnyObject>
//                    //                    let postDataFolder = NSKeyedArchiver.archivedData(withRootObject: postData)
//                    //                    Constants.kUserDefaults.set(postDataFolder, forKey: appConstants.post)
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//            
//        }
//        
//    }
//    
//    
//    
//    
//    //MARK: Create Post
//    func createDoctor(postDetials: Doctor , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        postRemoteReplicator.createDoctor(postDetials: postDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject> ) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    //                    let postData = responseData![APIConstants.post.rawValue] as! Dictionary<String, AnyObject>
//                    //                    let postDataFolder = NSKeyedArchiver.archivedData(withRootObject: postData)
//                    //                    Constants.kUserDefaults.set(postDataFolder, forKey: appConstants.post)
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//            
//        }
//        
//    }
//  
//  
  
//  //MARK: Update Post
//  func updateRepairs(repDetials: Repairs ,postID:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//
//    postRemoteReplicator.updateRepair(postDetials: repDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>, postID: postID) { (responseData, error) -> Void in
//      if responseData != nil {
//        if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//          callback(true,responseData,nil)
//        }else{
//          callback(false,responseData,responseData!["error"] as? String)
//        }
//      }
//    }
//  }

//    //MARK: Update Post
//    func updateOrder(ordDetials: Order ,postID:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        postRemoteReplicator.updateOrder(postDetials: ordDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>, postID: postID) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//        }
//    }

    
//    
//    //MARK: Update Post
//    func updateDoctor(medDetials: Doctor ,postID:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        postRemoteReplicator.updateDoctor(postDetials: medDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>, postID: postID) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//        }
//    }
//    
//    //MARK: Update Post
//    func updatePrescription(preDetials: Prescription ,postID:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        postRemoteReplicator.updatePrescription(postDetials: preDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>, postID: postID) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//        }
//    }
//    
//    //MARK: Update Post
//    func updateAnalysis(anaDetials: Analysis ,postID:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//        
//        postRemoteReplicator.updateAnalysis(postDetials: anaDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>, postID: postID) { (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    callback(true,responseData,nil)
//                }else{
//                    callback(false,responseData,responseData!["error"] as? String)
//                }
//            }
//        }
//    }

    
    
    
    //MARK: Update Medicine Timing
    func updateMedicineTiming(info: Dictionary<String, AnyObject> ,medID:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
        
        
        postRemoteReplicator.updateMedicineTiming(info: info , medID: medID) { (responseData, error) -> Void in
            if responseData != nil {
                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    callback(true,responseData,nil)
                }else{
                    callback(false,responseData,responseData!["error"] as? String)
                }
            }
        }
    }
    
    
    
    //MARK: Update Medicine Timing
    func updateReminderVisited(info: Dictionary<String, AnyObject> ,remID:String, callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
        
        
        postRemoteReplicator.updateReminderTiming(info: info , remID: remID) { (responseData, error) -> Void in
            if responseData != nil {
                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    callback(true,responseData,nil)
                }else{
                    callback(false,responseData,responseData!["error"] as? String)
                }
            }
        }
    }
    
//    // MARK: deleteTaskAll
//    func deleteDoctor(postDetials: Doctor, callback:@escaping (_ isSuccess:Bool , _ error: String? ) -> Void)   {
//        postRemoteReplicator.deletePost(PostID: postDetials.dictionaryRepresentation()as! Dictionary<String, AnyObject>){ (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    callback(true,nil)
//                }else{
//                    callback(false,responseData!["error"] as? String)
//                }
//            }
//
//        }
//
//    }
    
    //MARK: Delete Post
    func deleteRepair(Del: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.deleteRepair(repairID: Del){ (Data, error) -> Void in
            if Data != nil {
                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    callback(true,Data,nil)
                }else{
                    callback(false,Data,Data!["error"] as? String)
                }
            }
            
        }
        
    }
    
    
    
//    //MARK: Delete Post
//    func deleteDoctor(postID: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
//        postRemoteReplicator.deletePost(PostID: postID){ (Data, error) -> Void in
//            if Data != nil {
//                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
//
//                    callback(true,Data,nil)
//                }else{
//                    callback(false,Data,Data!["error"] as? String)
//                }
//            }
//
//        }
//
//    }
    
    //MARK: Delete Post
    func deleteLike(postID: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.deleteLike(PostID: postID){ (Data, error) -> Void in
            if Data != nil {
                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    callback(true,Data,nil)
                }else{
                    callback(false,Data,Data!["error"] as? String)
                }
            }
            
        }
        
    }
    
    
    //MARK: Delete Post
    func deleteAnalysis(postID: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.deleteAnalysis(PostID: postID){ (Data, error) -> Void in
            if Data != nil {
                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    callback(true,Data,nil)
                }else{
                    callback(false,Data,Data!["error"] as? String)
                }
            }
            
        }
        
    }
    
    
    //MARK: Delete Post
    func deletePrescription(postID: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.deletePrescription(PostID: postID){ (Data, error) -> Void in
            if Data != nil {
                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    callback(true,Data,nil)
                }else{
                    callback(false,Data,Data!["error"] as? String)
                }
            }
            
        }
        
    }
    
    
    //MARK: Delete Post
    func deleteMedicine(postID: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.deleterMedicine(PostID: postID){ (Data, error) -> Void in
            if Data != nil {
                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    callback(true,Data,nil)
                }else{
                    callback(false,Data,Data!["error"] as? String)
                }
            }
            
        }
        
    }

    
    
    //MARK: Delete Post
    func deleteReminder(postID: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.deleterReminder(PostID: postID){ (Data, error) -> Void in
            if Data != nil {
                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    callback(true,Data,nil)
                }else{
                    callback(false,Data,Data!["error"] as? String)
                }
            }
            
        }
        
    }


    // MARK:-- GetUserDetals
    func getProviderDetails(userId:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getProviderDetails(query: userId,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getAllIdea(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllIdea(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }

    //MARK:-- Get All Categories
    func getAllCategories(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllCategories(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- Get All Categories
    func getPromotion(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getPromotion(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getInviteCategory(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getInviteCategory(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    func getInvitees(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getInvitees(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getCommittees(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getCommittees(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                callback(Data! , nil)
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getLive(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getLive(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                callback(Data! , nil)
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getSchedules(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getSchedules(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getEvent(query:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getEvent(query: query,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getAllNotification(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllNotification(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getAllServices(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllServices(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getRepairs(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getRepairs(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getOrderHistory(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getOrderHistory(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getInvoiceHistory(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getInvoiceHistory(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }

    
    //MARK:-- Get All Categories
    func getChat(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getChat(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }

    //MARK:-- Get All Categories
    func getNotification(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllNotifications(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- Get All Categories
    func getAllBodyPart(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllBodyPart(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- get Repair For Order
    func getRepairForOrder(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getRepairForOrder(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    
    //MARK:-- Get All Categories
    func getAllQuestion(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllQuestion(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- Get All Categories
    func getAllArticle(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllArticle(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    //MARK:-- Get All Categories
    func getAllReminder(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllReminder(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- Get All Prescription
    func getAllPrescription(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllPrescription(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- Get All Prescription
    func getAllAnalysis(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllAnalysis(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
    
    
    
    //MARK:-- Get All Posts
    func getAllMedicines(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllMedicines(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                 callback(Data! , "error")
                print("Getting Error")
                
            }
            
        }
    }
    
    
    //MARK:-- Get All Posts
    func getUpdateMedicine(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getUpdateMedicine(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                callback(Data! , "error")
                print("Getting Error")
                
            }
            
        }
    }
    
    
    
    //MARK:-- Get All Posts
    func getAllReports(name:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getAllReport(query: name,pageNo: pageNo) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                callback(Data! , "error")
                print("Getting Error")
                
            }
            
        }
    }
    

    
    
//    //MARK:-- Get Post By Id From Remote
    func getPostDetailsByID(postId:String, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
    {
        postRemoteReplicator.getPostDetailsByID(query: postId) { (Data, error) in
            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
                callback(Data! , nil)
            }
            else{
                print("Getting Error")
                
            }
            
        }
    }
//
//    
//    
//    
//    //MARK: Create Comment
//    func createComment(postID: String ,commentDetials: Comment, callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
//        postRemoteReplicator.createComment(postID: postID,commentDetials:commentDetials.dictionaryRepresentation() as! Dictionary<String, AnyObject>){ (Data, error) -> Void in
//            if Data != nil {
//                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    
//                    
//                    
//                    callback(true,Data,nil)
//                }else{
//                    callback(false,Data,Data!["error"] as? String)
//                }
//            }
//            
//        }
//        
//    }
//    
//    
//    
    //MARK: Delete Comment
    func deleteLike(commentID: String , callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.deleteLike(PostID: commentID){ (Data, error) -> Void in
            if Data != nil {
                if (Data![APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    callback(true,Data,nil)
                }else{
                    callback(false,Data,Data!["error"] as? String)
                }
            }
            
        }
        
    }
//
//    
//    
//    //MARK:-- Get Post comments By Id From Remote
//    func getPostCommentsByID(postId:String, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
//    {
//        postRemoteReplicator.getPostCommentsByID(postId: postId) { (Data, error) in
//            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
//                callback(Data! , nil)
//            }
//            else{
//                print("Getting Error")
//                
//            }
//            
//        }
//    }
//    
//    
//    
     //MARK: LikePost
    func likePost(postID: String ,postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ isSuccess:Bool,_ responseData:Dictionary<String,AnyObject>? , _ error: String? ) -> Void)   {
        postRemoteReplicator.likePost(postID: postID,postDetials:postDetials){ (responseData, error) -> Void in
          if responseData != nil {
            if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
    
    
    
              callback(true,responseData,nil)
            }else{
              callback(false,responseData,responseData!["error"] as? String)
            }
          }
    
        }
    
      }

    
    //MARK: DisLikePost
    func dislikePost(postID: String , callback:@escaping (_ isSuccess:Bool , _ error: String? ) -> Void)   {
        postRemoteReplicator.dislikePost(postID: postID){ (responseData, error) -> Void in
            if responseData != nil {
                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
                    
                    
                    
                    callback(true,nil)
                    
                }else{
                    callback(false,responseData!["error"] as? String)
                }
            }
            
        }
        
    }
//    
//    
    //MARK: CreateSaved
    func requestIdentity(postID: String , callback:@escaping (_ isSuccess:Bool , _ error: String? ) -> Void)   {
        postRemoteReplicator.requestIdentity(postID: postID){ (responseData, error) -> Void in
            if responseData != nil {
                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
                  
                  
                  
                    callback(true,nil)
                }else{
                    callback(false,responseData!["error"] as? String)
                }
            }
          
        }
      
    }
  
  
  //MARK:-- Get Notifications
  func getAllNotifications(callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
  {
    postRemoteReplicator.getAllNotifications() { (Data, error) in
      if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
        callback(Data! , nil)
      }
      else{
        print("Getting Error")
        
      }
      
    }
  }
}
  
//
//    
//    
//    //MARK: CreateUnSaved
//    func createUnSaved(postID: String , callback:@escaping (_ isSuccess:Bool , _ error: String? ) -> Void)   {
//        postRemoteReplicator.createUnSaved(postID: postID){ (responseData, error) -> Void in
//            if responseData != nil {
//                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//                    
//                    callback(true,nil)
//                }else{
//                    callback(false,responseData!["error"] as? String)
//                }
//            }
//            
//        }
//        
//    }
//
//    
//    
//    //MARK:-- Get Post By Id From Remote
//    func getReactedUsersByID(postId:String, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
//    {
//        postRemoteReplicator.getReactedUsersByID(query: postId) { (Data, error) in
//            if Data![APIConstants.isSuccess.rawValue] as! Bool == true {
//                callback(Data! , nil)
//            }
//            else{
//                print("Getting Error")
//                
//            }
//            
//        }
//    }
//    
//    
  
  
//  //MARK:-- Get get Comments Censored Words
//  func getCommentsCensored(callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
//  {
//    postRemoteReplicator.getCommentsCensored() { (Data, error) in
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
//
//  //MARK:-- Get Post By Id From Remote
//  func getPostByID(Id:String, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
//  {
//    postRemoteReplicator.getPostByID(query: Id) { (Data, error) in
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
  
//
//  //MARK:-- Get Posts From Remote
//  func getAllCommentsForPost(id:String,pageNo:Int, callback:@escaping (_ responseData:Dictionary<String,AnyObject>,_ error:String?) -> Void )
//  {
//    postRemoteReplicator.getAllCommentsForPost(query: id,pageNo: pageNo) { (Data, error) in
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
  
  
//  // MARK: Add Comment
//  func postComment(commentDetials: [String:String] , callback:@escaping (_ isSuccess:Bool , _ responseData:  Comment? , _ error: String? ) -> Void)   {
//    postRemoteReplicator.createCommentInPost(commentDetials: commentDetials){ (responseData, error) -> Void in
//      if responseData != nil {
//        if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//          let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
//
//          let comment = Comment.init(dictionary: data as NSDictionary)
//          callback(true,comment,nil)
//        }else{
//          callback(false,nil,responseData!["error"] as? String)
//        }
//      }
//
//    }
//
//  }
//
//
//  // MARK: likeUnlikePost
//  func likeDislikepost(postDetials: [String:String] , callback:@escaping (_ isSuccess:Bool , _ error: String? ) -> Void)   {
//    postRemoteReplicator.likeDislikepost(commentDetials: postDetials){ (responseData, error) -> Void in
//      if responseData != nil {
//        if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//          let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
//
//
//          callback(true,nil)
//        }else{
//          callback(false,responseData!["error"] as? String)
//        }
//      }
//
//    }
//
//  }
//
//  // MARK: dislikePost
//  func dislikepost(postID: String , callback:@escaping (_ isSuccess:Bool , _ error: String? ) -> Void)   {
//    postRemoteReplicator.dislikepost(postID: postID){ (responseData, error) -> Void in
//      if responseData != nil {
//        if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//
//
//
//          callback(true,nil)
//        }else{
//          callback(false,responseData!["error"] as? String)
//        }
//      }
//
//    }
//
//  }
//
//
//  // MARK: RATINGPost
//  func ratingpost(postDetials: [String:String] , callback:@escaping (_ isSuccess:Bool , _ error: String? ) -> Void)   {
//    postRemoteReplicator.ratingpost(commentDetials: postDetials){ (responseData, error) -> Void in
//      if responseData != nil {
//        if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//          let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
//          callback(true,nil)
//        }else{
//          callback(false,responseData!["error"] as? String)
//        }
//      }
//
//    }
//
//  }
  
  
  
//
//  // MARK: SignIn
//  func userSignIn(userDetials: Dictionary<String, AnyObject> , callback:@escaping (_ isSuccess:Bool , _ responseData:  Dictionary<String, AnyObject>? , _ error: String? ) -> Void)   {
//    userRemoteReplicator.userSignIn(userDetials: userDetials){ (responseData, error) -> Void in
//      if responseData != nil {
//        if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
//          let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
//          Constants.kUserDefaults.set(data[appConstants.id] , forKey: appConstants.id)
//          Constants.kUserDefaults.set(data[appConstants.token] , forKey: appConstants.token)
//          let dataProfile = NSKeyedArchiver.archivedData(withRootObject: data)
//          Constants.kUserDefaults.set(dataProfile, forKey: appConstants.profile)
//          Constants.kUserDefaults.set(data[UserAttributes.status.rawValue], forKey: UserAttributes.status.rawValue)
//
//
//
//          callback(true,responseData,nil)
//        }else{
//          callback(false,responseData,responseData!["error"] as? String)
//        }
//      }
//
//    }
//
//  }
//
  
  //    // MARK: Create User
  //    func userSignUp(userDetials: Dictionary<String, AnyObject> , callback:@escaping ( _ successResponse: Bool, _ error: String? ) -> Void)   {
  //
  //        userRemoteReplicator.userSignUp(userDetials: userDetials){ (responseData, error) -> Void in
  //            if responseData != nil{
  //                if (responseData?[APIConstants.isSuccess.rawValue] as? Bool)! == true{
  //
  //                    if let data = responseData?[APIConstants.data.rawValue]! as? Dictionary<String, AnyObject>!{
  //                        Constants.kUserDefaults.setValue(data["id"], forKey: appConstants.id)
  //                    }
  //                    callback(true,nil)
  //                }else{
  //                    print(responseData!["error"]!)
  //                    callback(false,responseData!["error"] as? String)
  //                }
  //            }else{
  //                callback(false,responseData!["error"] as? String)
  //            }
  //
  //        }
  //
  //    }
  //
  //    // MARK: ValidatePin
  //    func userValidatePin(employeeId:NSNumber,userDetials: Dictionary<String, String> , callback:@escaping (_ successResponse: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
  //
  //        userRemoteReplicator.userVarificationCode(employeeId: employeeId,userDetials:userDetials as Dictionary<String, AnyObject>){ (responseData, error) -> Void in
  //
  //            if responseData != nil{
  //                if  responseData![APIConstants.isSuccess.rawValue] as! Bool == true{
  //                    let data = responseData![APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
  //                    Constants.kUserDefaults.set(data["id"], forKey: appConstants.id)
  //                    Constants.kUserDefaults.set(data["token"], forKey: appConstants.token)
  //                   // self.userLocalReplicator.saveUserProfile(userProfileDict: data)
  //                    callback(responseData,nil)
  //                }else{
  //                    callback(responseData,responseData!["error"] as? String)
  //                }
  //            }else{
  //                callback([:],responseData!["error"] as? String)
  //            }
  //        }
  //
  //    }
  //
  //
  //    //MARK:- Resend Code
  //    func resendVarificationCode(userDetials: Dictionary<String, String>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void) {
  //        userRemoteReplicator.resendVarificationCode(userDetials: userDetials) { (responseData, error) in
  //            if responseData != nil{
  //                if responseData![APIConstants.isSuccess.rawValue] as! Bool == true {
  //                    let data = responseData?[APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
  //                    Constants.kUserDefaults.set(data["id"]!,forKey: appConstants.id)
  //                    print(Constants.kUserDefaults.value(forKey: "id")!)
  //                    callback(responseData , nil)
  //                }
  //                else{
  //                    callback(responseData, responseData!["error"] as? String)
  //                }
  //            }
  //        }
  //    }
  //
  //
  //
  //    //MARK:- Update User Password
  //
  //    func updateUserPassword(employeeId:NSNumber,userDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
  //        userRemoteReplicator.updateUserPassword(employeeId: employeeId, userDetials: userDetials) { (responseData, error) in
  //            if responseData != nil{
  //                if responseData![APIConstants.isSuccess.rawValue] as! Bool == true {
  //                   // let data = responseData?[APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
  //
  //                    callback(responseData , nil)
  //                }
  //                else{
  //                    callback(responseData, responseData!["error"] as? String)
  //                }
  //            }
  //
  //        }
  //    }
  //    //MARK:- Report a bug
  //
  //    func reportBug(detail:Dictionary<String,AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
  //        userRemoteReplicator.reportBug(detail:detail) { (responseData, error) in
  //            if responseData != nil{
  //                if responseData![APIConstants.isSuccess.rawValue] as! Bool == true {
  //                    // let data = responseData?[APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
  //
  //                    callback(responseData , nil)
  //                }
  //                else{
  //                    callback(responseData, responseData!["error"] as? String)
  //                }
  //            }
  //
  //        }
  //
  //    }
  //
  //
  //  //MARK:- UserManualCheckIn/CheckOut
  //  func userManualAttendence(detail:Dictionary<String,Any>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
  //    userRemoteReplicator.manualCheckInCheckOut(details:detail) { (responseData, error) in
  //      if responseData != nil{
  //        if responseData![APIConstants.isSuccess.rawValue] as! Bool == true {
  //          // let data = responseData?[APIConstants.data.rawValue] as! Dictionary<String, AnyObject>
  //          callback(responseData , nil)
  //        }
  //        else{
  //          callback(responseData, responseData!["error"] as? String)
  //        }
  //      }
  //
  //    }
  //
  //  }
  //
  //
  //
  //    //MARK:- Getting External token for AMS
  //
  //    func getExternalToken(callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
  //        userRemoteReplicator.getExternalToken { (responseData, error ) in
  //            if responseData != nil{
  //                if responseData![APIConstants.isSuccess.rawValue] as! Bool == true {
  //                    let data = responseData?["data"]
  //                    Constants.kUserDefaults.set(data?["token"]!, forKey: appConstants.token)
  //                    Constants.kUserDefaults.set(data?["id"]!, forKey: appConstants.id)
  //                    Constants.kUserDefaults.setValue(true, forKey: appConstants.alreadyLoggedIn)
  //                    let empty = NSNull()
  //                    if let name = data?["name"] as? String, !name.isEqual(empty), name != ""  {
  //                        Constants.kUserDefaults.set(name , forKey: "name")
  //
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "name")
  //
  //                    }
  //                    if let designation = data?["designation"] as? String, !designation.isEqual(empty) , designation != "" {
  //                        Constants.kUserDefaults.set(designation , forKey: "designation")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "designation")
  //
  //                    }
  //                    if let picUrls = data?["picUrls"] as? String, !picUrls.isEqual(empty), picUrls != ""  {
  //                        Constants.kUserDefaults.set(picUrls as String, forKey: "picUrls")
  //                    }
  //                    if let email = data?["email"] as? String, !email.isEqual(empty) , email != "" {
  //                        Constants.kUserDefaults.set(email as String, forKey: "email")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "email")
  //
  //                    }
  //                    if let phone = data?["phone"] as? String, !phone.isEqual(empty) , phone != "" {
  //                        Constants.kUserDefaults.set(phone as String, forKey: "phone")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "phone")
  //
  //                    }
  //                    if let code = data?["code"] as? String, !code.isEqual(empty) , code != "" {
  //                        Constants.kUserDefaults.set(code as String, forKey: "code")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "code")
  //
  //                    }
  //
  //
  //                    callback(responseData , nil)
  //                }
  //                else{
  //                    callback(responseData, responseData!["error"] as? String)
  //                }
  //            }
  //
  //        }
  //
  //    }
  //
  //    //MARK:- Sign in with tunnel
  //    func signInWithTunnel(callback:@escaping(_ responsedata: Dictionary<String,AnyObject>?, _ error: String?) -> Void){
  //        let tokenValue = Constants.kUserDefaults.value(forKey: appConstants.orgToken)
  //        Constants.kUserDefaults.set(tokenValue, forKey: appConstants.loggedInExternalOrgToken)
  //        Constants.kUserDefaults.set(tokenValue, forKey: appConstants.token)
  //        userRemoteReplicator.signInWithTunnel { (responseData, error ) in
  //            if responseData != nil{
  //                if responseData![APIConstants.isSuccess.rawValue] as! Bool == true {
  //                    let data = responseData?["data"]
  //                    Constants.kUserDefaults.set(data?["token"]!, forKey: appConstants.token)
  //                    Constants.kUserDefaults.set(data?["id"]!, forKey: appConstants.id)
  //                    Constants.kUserDefaults.setValue(true, forKey: appConstants.alreadyLoggedIn)
  //                    let empty = NSNull()
  //                    if let name = data?["name"] as? String, !name.isEqual(empty), name != ""  {
  //                        Constants.kUserDefaults.set(name , forKey: "name")
  //
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "name")
  //
  //                    }
  //                    if let designation = data?["designation"] as? String, !designation.isEqual(empty) , designation != "" {
  //                        Constants.kUserDefaults.set(designation , forKey: "designation")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "designation")
  //
  //                    }
  //                    if let picUrls = data?["picUrls"] as? String, !picUrls.isEqual(empty), picUrls != ""  {
  //                        Constants.kUserDefaults.set(picUrls as String, forKey: "picUrls")
  //                    }
  //                    if let email = data?["email"] as? String, !email.isEqual(empty) , email != "" {
  //                        Constants.kUserDefaults.set(email as String, forKey: "email")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "email")
  //
  //                    }
  //                    if let phone = data?["phone"] as? String, !phone.isEqual(empty) , phone != "" {
  //                        Constants.kUserDefaults.set(phone as String, forKey: "phone")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "phone")
  //
  //                    }
  //                    if let code = data?["code"] as? String, !code.isEqual(empty) , code != "" {
  //                        Constants.kUserDefaults.set(code as String, forKey: "code")
  //                    }else{
  //                        Constants.kUserDefaults.set("" , forKey: "code")
  //
  //                    }
  //
  //
  //                    callback(responseData , nil)
  //                }
  //                else{
  //                    callback(responseData, responseData!["error"] as? String)
  //                }
  //            }
  //
  //        }
  //
  //    }
  
  
  
  // MARK: Create userProfile
  
  /**
   Create user profile, and persist it to Datastore via Worker(minion),
   that synchronizes with Main context.
   
   - Parameter userProfileDetails: <Dictionary<String, AnyObject> A single Profile to be persisted to the Datastore.
   - Returns: Void
   */
  
  
  
  
  
  


