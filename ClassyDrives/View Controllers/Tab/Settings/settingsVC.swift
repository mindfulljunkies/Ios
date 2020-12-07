//
//  settingsVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import CoreLocation

class settingsVC: BaseVC {
    @IBOutlet weak var currentRideBtn: UIButton!
       @IBOutlet weak var sosBtn: UIButton!

    @IBOutlet weak var currentRideView: UIView!
    @IBOutlet var settingsTable: UITableView!
    var image = [#imageLiteral(resourceName: "password"),#imageLiteral(resourceName: "name"),#imageLiteral(resourceName: "delete-bin"),#imageLiteral(resourceName: "logout")]
//    "Privacy Policy","Terms","About",
    var name = ["Ride History","Help Center","Delete My Account","Logout"]
    var new_value:String = ""
    var naviArr = ["PrivacyVC","PrivacyVC","PrivacyVC","TermVC","AboutVC","AboutVC","AboutVC"]
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
                UserVM.sheard.panicApi(user_id: userId , ride_id: new_value, lattitude: latii, longitude: longi) { (success, message, error) in
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
        self.rideOnlineStatus { (status,ride_id,m_booked) in
            if status{
                self.new_value = ride_id
                self.currentRideBtn.isHidden = false
                self.sosBtn.isHidden = false
            }else{
                self.currentRideBtn.isHidden = true
                self.sosBtn.isHidden = true
            }
        }
//       let status =  self.rideOnlineStatus()
//        //        let rideId =   UserDefaults.standard.value(forKey: "rideID") as? String
//        //        let bookID =  UserDefaults.standard.value(forKey: "bookID") as? String
//                if (status == true)
//                {
//                    self.currentRideBtn.isHidden = false
//                    self.sosBtn.isHidden = false
//                }
//                else
//                {
//                    self.currentRideBtn.isHidden = true
//                    self.sosBtn.isHidden = true
//                }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
  
        @IBAction func currentRideBtnAction(_ sender: Any) {
            self.curentRide()
        }
        @IBAction func sosBtnAction(_ sender: Any) {
            self.sosCall()
        }
       func curentRide()
       {
                     
                  let rideId =   UserDefaults.standard.value(forKey: "rideID") as? String
                  let bookID =  UserDefaults.standard.value(forKey: "bookID") as? String

     let story = self.storyboard?.instantiateViewController(withIdentifier: "OfferedRideDetailsCurrentVC") as! OfferedRideDetailsCurrentVC
                             //   let rideId =   UserDefaults.standard.value(forKey: "rideID") as? String
              //                  let bookID =  UserDefaults.standard.value(forKey: "bookID") as? String
                      story.isFromView = true
                  //                 story.islocal = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].is_local_ride ?? ""
                      
                     // if am_i_booked == "1"{
                          story.bookid = ""
                          //story.isFromCurrentRide = true
                          story.rideId = new_value
//                      }else{
//                          story.rideId = new_value
//                          //story.isFromCurrentRide = true
//                          story.bookid  = ""
//                      }
                      
                                 //  story.rideId = newRide
                                   
                  //                 story.isReceived = true
                       //            story.cancelReason = "usercancel"
                                   self.navigationController?.pushViewController(story, animated: true)
                      
        }
    
    
}
extension settingsVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            tableView.register(UINib.init(nibName: "settingsCellFile", bundle: nil), forCellReuseIdentifier: "settingsCellFile")
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCellFile") as! settingsCellFile
            cell.lblText.text = name[indexPath.row]
            cell.cellImg.image = image[indexPath.row]
            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if indexPath.row == 3{
            let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogoutPopupVC") as! LogoutPopupVC
            self.addChild(popOverVC)
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        }
        else if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RideHistoryVC") as! RideHistoryVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeleteUserVC") as! DeleteUserVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HelpCenterVC") as! HelpCenterVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
