//
//  ChatVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 09/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import CoreLocation
class ChatVC: BaseVC {

    @IBOutlet weak var currentRideView: UIView!
    @IBOutlet weak var currentRideBtn: UIButton!
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet var chatTable: UITableView!
    var ref: DatabaseReference!
       var userID = String()
    var chatList = [Chat]()
         var currentLocation = CLLocation()
        var locationManager = CLLocationManager()
        var myLocationLat:String?
        var myLocationLng:String?
      func sosCall()
      {
      if CLLocationManager.locationServicesEnabled()
                  && CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse
      {
               if let location = locationManager.location
                     {
                         currentLocation = location
                     }
              let latii = String(format: "%.8f", currentLocation.coordinate.latitude)
              let longi = String(format: "%.8f", currentLocation.coordinate.longitude)
              print(latii,longi)
              
             let rideId = UserDefaults.standard.value(forKey: "rideID") as? String ?? ""
             let userId = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
             Indicator.sharedInstance.showIndicator()
                    UserVM.sheard.panicApi(user_id: userId , ride_id: rideId, lattitude: latii, longitude: longi) { (success, message, error) in
                        if error == nil{
                            Indicator.sharedInstance.hideIndicator()
                            if success{
    //                            self.showAlert(message: message)

    //                            let story = self.storyboard?.instantiateViewController(withIdentifier:"MainTabVC") as! MainTabVC
    //                            DataManager.isLogin = true
    //                            self.navigationController?.pushViewController(story, animated: true)
                            }else{
    //                            self.showAlert(message: message)
                            }
                        }else{
    //                        self.showAlert(message: error?.domain)
                        }
                    }
        if let url = URL(string: "tel://911"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
      }
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.rideOnlineStatus { (status) in
            if status{
                self.currentRideBtn.isHidden = false
                self.sosBtn.isHidden = false
            }else{
                self.currentRideBtn.isHidden = true
                self.sosBtn.isHidden = true
            }
        }
//        let status =  self.rideOnlineStatus()
//        //        let rideId =   UserDefaults.standard.value(forKey: "rideID") as? String
//        //        let bookID =  UserDefaults.standard.value(forKey: "bookID") as? String
//                if (status == true)
//                {
//                    self.currentRideView.isHidden = false
//                    self.sosBtn.isHidden = false
//                }
//                else
//                {
//                    self.currentRideView.isHidden = true
//                    self.sosBtn.isHidden = true
//                }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

       getChatHistory()
    }
    
        @IBAction func currentRideBtnAction(_ sender: Any) {
            self.curentRide()
        }
        @IBAction func sosBtnAction(_ sender: Any) {
            self.sosCall()
        }
       func curentRide()
       {
                     let story = self.storyboard?.instantiateViewController(withIdentifier: "OfferedRideDetailsVCID") as! OfferedRideDetailsVC
                  let rideId =   UserDefaults.standard.value(forKey: "rideID") as? String
                  let bookID =  UserDefaults.standard.value(forKey: "bookID") as? String
        story.isFromView = true

    //                 story.islocal = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].is_local_ride ?? ""
                     story.rideId = rideId ?? ""
                     story.bookid = bookID ?? ""
    //                 story.isReceived = true
         //            story.cancelReason = "usercancel"
                     self.navigationController?.pushViewController(story, animated: true)
        }
    func getChatHistory(){
      
        //SVProgressHUD.show(withStatus: "Loading Chat")
        self.ref = Database.database().reference()
        self.ref.child("ChatHistory").observe(.value) { (snapShot) in
            print(snapShot)
                        if snapShot.value! is NSNull{
                        //    SVProgressHUD.dismiss()
            
                        }else{
                            let values = snapShot.value as? NSDictionary
                            print(values!)
                            self.chatList = [Chat]()
                       //     self.chatobjectarray.removeAllObjects()
                          
                            for sort in snapShot.children{
                                print(sort)
                                let snap = sort as! DataSnapshot
                                print(snap.key)
                                let valueofKey = snap.value as! NSDictionary
                                print(valueofKey)
                                let occupId = valueofKey["occupant_id"] as? String
                                let convertToArray = occupId?.components(separatedBy: ",")
                                if (convertToArray?.contains(self.userID))!{
                                    print("yes")
                                   let chatDict = Chat.init(dictionary: valueofKey)
                                    self.chatList.append(chatDict!)
                                }
                             //   let idOccu = valueofKey
                               // self.chatobjectarray.add(snap.value!)
                            }
            
                       self.chatTable.reloadData()
                        }
    }
    
   }
}
//MARK: Table Methods
extension ChatVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if chatList.count > 0{
        return chatList.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        let chatListArray = chatList[indexPath.row]
        for i in 0..<chatListArray.user_data!.count{
            if chatListArray.user_data![i].userid! != userID{
            let ArrayUser = chatListArray.user_data![i]
            cell.userName.text = ArrayUser.user_name
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       let chatListArray = chatList[indexPath.row]
        
        for i in 0..<chatListArray.user_data!.count{
            
            if chatListArray.user_data![i].userid! != userID{
                let ArrayUser = chatListArray.user_data![i]
                let destinationvc = self.storyboard?.instantiateViewController(withIdentifier: "ChatingVCID") as! ChatingVC
                destinationvc.otherUserId = ArrayUser.userid!
                destinationvc.otherUserName = ArrayUser.user_name!
                destinationvc.otherUserImage = ArrayUser.user_image!
                destinationvc.messageNode = chatListArray.id ?? ""
                self.navigationController?.pushViewController(destinationvc, animated: true)
                break
            }else{
                
            }
        }
        
        
       
    }
    
}
extension Dictionary where Value: Equatable {
    func containsValue(value : Value) -> Bool {
        return self.contains { $0.1 == value }
    }
}



