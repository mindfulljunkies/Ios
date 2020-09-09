//
//  MyProfileVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 25/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import CoreLocation
class MyProfileVC: BaseVC {
    @IBOutlet var profileContainerView: UIView!
     @IBOutlet var personalBtn: UIButton!
    @IBOutlet var carBtn: UIButton!
    @IBOutlet var backView: UIView!
    @IBOutlet weak var currentRideBtn: UIButton!
       @IBOutlet weak var sosBtn: UIButton!
    var currentLocation = CLLocation()
        var locationManager = CLLocationManager()
        var myLocationLat:String?
        var myLocationLng:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
//                    self.currentRideBtn.isHidden = false
//                    self.sosBtn.isHidden = false
//                }
//                else
//                {
//                    self.currentRideBtn.isHidden = true
//                    self.sosBtn.isHidden = true
//                }
               backView.setShadow()
               backView.layer.cornerRadius = backView.frame.height/2
               
               personalBtn.backgroundColor = .black
               personalBtn.setTitleColor(.white, for: .normal)
               personalBtn.layer.cornerRadius = personalBtn.frame.height/2
               carBtn.layer.cornerRadius = carBtn.frame.height/2
               personalBtn.clipsToBounds = true
               carBtn.clipsToBounds = true
               carBtn.backgroundColor = .white
               carBtn.setTitleColor(.black, for: .normal)
           let userProfileVC =  self.storyboard?.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
               self.addChild(userProfileVC)
               userProfileVC.view.frame = CGRect(x: 0, y: 0, width: self.profileContainerView.frame.width, height: self.profileContainerView.frame.height)
               self.profileContainerView.addSubview(userProfileVC.view)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
       
    }
  
    @IBAction func carBtnActn(_ sender: Any) {
        
        personalBtn.backgroundColor = .white
        personalBtn.setTitleColor(.black, for: .normal)
        carBtn.backgroundColor = .black
        carBtn.setTitleColor(.white, for: .normal)
     
        for sView in self.profileContainerView.subviews {
            sView.removeFromSuperview()
        }
        let userProfileVC =  self.storyboard?.instantiateViewController(withIdentifier: "CarListVC") as! CarListVC
        self.view.backgroundColor = .white
        
        self.addChild(userProfileVC)
        userProfileVC.view.frame = CGRect(x: 0, y: 0, width: self.profileContainerView.frame.width, height: self.profileContainerView.frame.height)
        self.profileContainerView.addSubview(userProfileVC.view)
        
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
//                 story.islocal = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].is_local_ride ?? ""
    story.isFromView = true

                 story.rideId = rideId ?? ""
                 story.bookid = bookID ?? ""
//                 story.isReceived = true
     //            story.cancelReason = "usercancel"
                 self.navigationController?.pushViewController(story, animated: true)
    }
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
            }}
    @IBAction func personalBtnActn(_ sender: Any) {
        personalBtn.backgroundColor = .black
        personalBtn.setTitleColor(.white, for: .normal)
        carBtn.backgroundColor = .white
        carBtn.setTitleColor(.black, for: .normal)
        
        for sView in self.profileContainerView.subviews {
            sView.removeFromSuperview()
        }
        let userProfileVC =  self.storyboard?.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        self.addChild(userProfileVC)
        userProfileVC.view.frame = CGRect(x: 0, y: 0, width: self.profileContainerView.frame.width, height: self.profileContainerView.frame.height)
        self.profileContainerView.addSubview(userProfileVC.view)
       
    }
}
