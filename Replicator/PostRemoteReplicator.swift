//
//  PostRemoteReplicator.swift
//  SearchApp
//
//  Created by dEEEP on 14/03/18.
//  Copyright © 2018 vannteqfarm. All rights reserved.
//

import Foundation


class PostRemoteReplicator{
  
  //MARK:- API constants
  private let createProvider = "services"
    private let createPromotion = "promotions"
    private let createAddPlan = "plans"
    private let createFogotPassword = "feedbacks"
    private let createAddRequest = "requests"
    private let createAddDocument = "documents"
    private let createLike = "likes/service"
    private let createAddRating = "ratings/service"
    private let createAddRepairs1 = "repairs"
    private let createAddAnalysis = "analysis"
    private let createFeedback = "feedbacks"
    private let createReminder = "reminders"
    private let createDoctor = "doctors"
    private let getAllMedicines = "getAllMedicine"
    private let getAllPosts = "getAllMedicine"
    private let getAllMedicalInformation = "medicalInformation"
    private let getAllSpecializations = "specializations"
    private let getAllDoctor = "doctors"
    private let getUpdateMedicine = "/medicines/"
    private let getAllReports = "diabetesReadings"
    private let deleteDoctor = "doctors"
    private let deleteLike = "likes/service/"
     private let deleteRepair = "repairs/"
    private let deleteAnalysis = "analysis/"
    private let deletePrescrition = "prescriptions/"
    private let deleteReminder = "reminders/"
    private let deleteMedicine = "medicineTimings/"
    private let createDisLike = "posts/unfavourite"
     private let createComments = "comments"
     private let deleteComment = "comments/"
    private let requestIdentity = "postUsers/identity/request/"
    private let createUnSaved = "posts/unsaved/"
  private let comments = "comments/post"
   private let likes = "favourites/post"
  private let ratings = "ratings/post"
    private let getAllComments = "comments?postId="
    private let getReactedUsers = "posts/likes"
    private let updateMedTiming = "/medicineTimings/"
    private let updateMedicine = "medicines"
    private let updateReminderTiming = "/reminders/"
    private let updateDoctor = "doctors/"
    private let updateRepair = "repairs/"
      private let updateOrder = "orders/"
    private let updatePrescription = "prescriptions/"
    private let updateAnalysis = "analysis/"
   //private let content = "commentContents"
    private let baseUrl1 = remoteConfig.mBaseUrl
  private var remoteRepo:RemoteRepository!
  
  init(){
    self.remoteRepo = RemoteRepository()
  }
  
  
  
    // MARK: create Post
    func createProvider(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createProvider.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
        }
    }
  
    // MARK: create Post
    func createPrmotion(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createPromotion.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
            
        }
    }
    
    // MARK: create Post
    func createForgot(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createFogotPassword.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
        }
    }
    
    // MARK: create Post
    func createAddPlan(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createAddPlan.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
        }
    }
    
    // MARK: create Post
    func createAddRating(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createAddRating.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
        }
    }
    
    // MARK: create Post
    func createAddRequest(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createAddRequest.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
            
        }
    }
    
    // MARK: create Post
    func createAddDocument(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createAddDocument.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
        }
    }
    
    // MARK: create Post
    func createLike(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createLike.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
        }
    }

    // MARK: create Post
    func createAddRepairs1(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createAddRepairs1.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
        }
    }

    
    // MARK: create Post
    func createAddAnalysis(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createAddAnalysis.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
            
        }
    }
    
    // MARK: create Post
    func createFeedback(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createFeedback.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
            
        }
    }

    // MARK: create Post
    func createReminder(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createReminder.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
            
        }
    }
    
    
    
    // MARK: create Post
    func createDoctor(postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createDoctor.html)"
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error )
            
        }
    }
   
    
  // MARK: update Post
  func updateMedicine(postDetials: Dictionary<String, AnyObject>,postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
    let urlString =  "\(baseUrl1)\(updateMedicine.html)" + postID
    remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
      callback(data , error?.description )
    }
  }
    
    // MARK: update Post
    func updateRepair(postDetials: Dictionary<String, AnyObject>,postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(updateRepair.html)" + postID
        remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error?.description )
        }
    }
    
    // MARK: update Post
    func updateOrder(postDetials: Dictionary<String, AnyObject>,postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(updateOrder.html)" + postID
        remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error?.description )
        }
    }
    
    
    
    // MARK: update Post
    func updateDoctor(postDetials: Dictionary<String, AnyObject>,postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(updateDoctor.html)" + postID
        remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error?.description )
        }
    }

    // MARK: update Post
    func updatePrescription(postDetials: Dictionary<String, AnyObject>,postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(updatePrescription.html)" + postID
        remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error?.description )
        }
    }
    
    // MARK: update Post
    func updateAnalysis(postDetials: Dictionary<String, AnyObject>,postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(updateAnalysis.html)" + postID
        remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
            callback(data , error?.description )
        }
    }
    
    
    // MARK: update Medicine Timing
    func updateMedicineTiming(info: Dictionary<String, AnyObject>,medID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(updateMedTiming.html)" + medID
        remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: info) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }
    
    // MARK: update Medicine Timing
    func updateReminderTiming(info: Dictionary<String, AnyObject>,remID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(updateReminderTiming.html)" + remID
        remoteRepo.remotePUTServiceWithParameters(urlString: urlString, params: info) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }
    
    
    func deleteDoctor(commentDetials:Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(getAllDoctor.html)"
        
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: commentDetials as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error )
            
        }
    }

    
    //MARK: Delete Comment
    func deleteRepair(repairID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(deleteRepair.html)" + repairID
        remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }

   
  
    //MARK: Delete Comment
    func deleteLike(PostID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(deleteLike.html)" + PostID
        remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
          
        }
    }
    
    
    //MARK: Delete Comment
    func deleteAnalysis(PostID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(deleteAnalysis.html)" + PostID
        remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }
    
    
    //MARK: Delete Comment
    func deletePrescription(PostID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(deletePrescrition.html)" + PostID
        remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }
    
    //MARK: Delete Comment
    func deleterReminder(PostID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(deleteReminder.html)" + PostID
        remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }
    
    //MARK: Delete Comment
    func deleterMedicine(PostID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(deleteMedicine.html)" + PostID
        remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }
    
    //MARK:- Get User Details
    func getProviderDetails(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "services/" + "\(query)"
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }

   
//    
    //MARK:- Get All Categories
    func getAllIdea(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "ideas"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }

    
    //MARK:- Get All Categories
    func getAllCategories(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "categories/include/subcategory"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    //MARK:- Get All Categories
    func getPromotion(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "promotions" + query
//        if query != ""{
//            url = url + query
//        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    //MARK:- Get All Categories
    func getInviteCategory(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "inviteeCategories" + query
        //        if query != ""{
        //            url = url + query
        //        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    func getInvitees(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "invitees" + query
        //        if query != ""{
        //            url = url + query
        //        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    //MARK:- Get All Categories
    func getCommittees(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "" + query
        //        if query != ""{
        //            url = url + query
        //        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    //MARK:- Get All Categories
    func getLive(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "lives/1" + query
        //        if query != ""{
        //            url = url + query
        //        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }

    //MARK:- Get All Categories
    func getSchedules(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "schedules" + query
        //        if query != ""{
        //            url = url + query
        //        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    func getSingleCart(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "carts" + query
     
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    //MARK:- Get All Categories
    func getEvent(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        let url = "events" + query
        //        if query != ""{
        //            url = url + query
        //        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    //MARK:- Get All Categories
    func getAllNotification(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "notifications"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }

    
    //MARK:- Get All Categories
    func getAllServices(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "services/"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    //MARK:- Get All Categories
    func getRepairs(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "repairs/"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    //MARK:- Get All Categories
    func getAllBodyPart(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "bodyParts/"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    
    //MARK:- Get Repair For Order
    func getRepairForOrder(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "repairs?orderId="
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    func getOrderHistory(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "orders"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    func getInvoiceHistory(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "invoices"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }

    
    func getChat(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "messages"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    func getAllNotifications(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        var url = "notifications"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    //MARK:- Get All Categories
    func getAllQuestion(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        print(query)
        var url = "questions?type=" + query
        
//        if query != ""{
//            url = url + query
//        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    //MARK:- Get All Categories
    func getAllArticle(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "questions?type=" + query
        
//        if query != ""{
//            url = url + query
//        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    //MARK:- Get All Categories
    func getAllReminder(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "reminders"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    
    //MARK:- Get All Prescription
    func getAllPrescription(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "prescriptions/"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    //MARK:- Get All Prescription
    func getAllAnalysis(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "analysis/"
        
        if query != ""{
            url = url + query
        }
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    

    //MARK:- Get All Posts
    func getAllMedicines(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "medicineTimings?date="
        
        if query != ""{
            url = url + query
        }
        
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    
    
    //MARK:- Get All Posts
    func getUpdateMedicine(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "/medicines/"
        
        if query != ""{
            url = url + query
        }
        
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    

    
    //MARK:- Get All Posts
    func getAllMedicalInformation(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "medicineTimings?date="
        
        if query != ""{
            url = url + query
        }
        
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    
    //MARK:- Get All Posts
    func getAllReport(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        
        var url = "diabetesReadings"
        
        if query != ""{
            url = url + query
        }
        
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
    
    
//    //MARK:- Get Post By ID
    func getPostDetailsByID(query:String = "" ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
        let url = getAllMedicines + "/\(query)"
        
        let urlString =  "\(baseUrl1)\(url.html)"
        
        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
            callback(data, error)
        }
    }
    
//
//    //MARK:- Get Post Comments By ID
//    func getPostCommentsByID(postId:String = "" ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
//        let url = getAllComments
//        
//        let urlString =  "\(baseUrl1)\(url.html)" + postId
//        
//        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
//            callback(data, error)
//        }
//    }
//    
//    
//
  
  
 
  
     //MARK: Like post
      func likePost(postID:String,postDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createLike.html)" + postID
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: postDetials) { (data, error) -> Void in
          callback(data , error?.description )
    
        }
      }
  
  
  
    //MARK: Dislke post
    func dislikePost(postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(createDisLike.html)/" + postID
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
          
        }
    }
  
  
  
//
//    //MARK: Create Comment
//    func createComment(postID:String,commentDetials: Dictionary<String, AnyObject>, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
//        let urlString =  "\(baseUrl1)\(createComments.html)"
//        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: commentDetials) { (data, error) -> Void in
//            callback(data , error?.description )
//            
//        }
//    }
//  
//    //MARK: Delete Comment
    func deleteCarts(commentID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\("carts/user".html)" + commentID
        remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
            
        }
    }
//
//    
    //MARK: Create Saved
    func requestIdentity(postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
        let urlString =  "\(baseUrl1)\(requestIdentity.html)" + postID
        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
            callback(data , error?.description )
          
        }
    }
//
//    
//    //MARK: Create UnSaved
//    func createUnSaved(postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
//        let urlString =  "\(baseUrl1)\(createUnSaved.html)" + postID
//        remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
//            callback(data , error?.description )
//            
//        }
//    }
//    
//    
//    
//    
//    
//    //MARK:- Get Reacted Users By ID
//    func getReactedUsersByID(query:String = "" ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
//        let url = getReactedUsers + "/\(query)"
//        let urlString =  "\(baseUrl1)\(url.html)"
//        remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
//            callback(data, error)
//        }
//    }
  
//  //MARK:- Get Post By ID
//  func getPostByID(query:String = "" ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
//    let url = getPost + "/\(query)"
//
//    let urlString =  "\(baseUrl1)\(url.html)"
//
//    remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
//      callback(data, error)
//    }
//  }
//  
//  
//  func getAllCommentsForPost(query:String = "" ,pageNo:Int = 1 ,callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
//    let url = comments + "?entityId=\(query)" + "&pageNo=" + "\(pageNo)"
//    
//    let urlString =  "\(baseUrl1)\(url.html)"
//    
//    remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
//      callback(data, error)
//    }
//  }
//  
//  
//  func getCommentsCensored(callback:@escaping (_ responseData: Dictionary<String, AnyObject>?, _ error: NSError?) -> Void ) {
//    let url = content
//    
//    let urlString =  "\(baseUrl1)\(url.html)"
//    
//    remoteRepo.remoteGETService(urlString: urlString) { (data, error) -> Void in
//      callback(data, error)
//    }
//  }
//  
//  
//  // MARK: Post Comment
//  func createCommentInPost(commentDetials: [String:String], callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
//    let urlString =  "\(baseUrl1)\(comments.html)"
//   
//    remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: commentDetials as Dictionary<String, AnyObject>) { (data, error) -> Void in
//      callback(data , error )
//      
//    }
//  }
//  
//  
//  // MARK: like Dislike post
//  func likeDislikepost(commentDetials: [String:String], callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
//    let urlString =  "\(baseUrl1)\(likes.html)"
//    
//    remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: commentDetials as Dictionary<String, AnyObject>) { (data, error) -> Void in
//      callback(data , error )
//      
//    }
//  }
//  
//  // MARK: dislike post
//  func dislikepost(postID:String, callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
//    let urlString =  "\(baseUrl1)\(likes.html)/" + postID
//    remoteRepo.remoteDELETEServiceWithParameters(urlString: urlString, params: [:] as Dictionary<String, AnyObject>) { (data, error) -> Void in
//      callback(data , error?.description )
//      
//    }
//  }
//  
//  
//  // MARK: rating post
//  func ratingpost(commentDetials: [String:String], callback:@escaping (_ responsedata: Dictionary<String, AnyObject>?, _ error: String? ) -> Void)   {
//    let urlString =  "\(baseUrl1)\(ratings.html)"
//    
//    remoteRepo.remotePOSTServiceWithParameters(urlString: urlString, params: commentDetials as Dictionary<String, AnyObject>) { (data, error) -> Void in
//      callback(data , error )
//      
//    }
//  }
  
  
  
  
  

  
  
  
}

