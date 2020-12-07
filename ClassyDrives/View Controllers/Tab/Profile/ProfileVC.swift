//
//  ProfileVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import CoreLocation
class ProfileVC: BaseVC, DataEnteredDelegate{
    @IBOutlet var backView: UIView!
    @IBOutlet var personalBtn: UIButton!
    @IBOutlet weak var currentRideBtn: UIButton!
       @IBOutlet weak var sosBtn: UIButton!

    @IBOutlet var carBtn: UIButton!
    @IBOutlet var profileCollection: UICollectionView!
    @IBOutlet var addCarBtn: UIButton!
    @IBOutlet var carTableView: UITableView!
         var currentLocation = CLLocation()
        var locationManager = CLLocationManager()
        var myLocationLat:String?
        var myLocationLng:String?
    fileprivate var new_value:String = ""
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
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addCarBtn.setShadow()
        addCarBtn.isHidden = true
        backView.setShadow()
        backView.layer.cornerRadius = backView.frame.height/2
        
        personalBtn.backgroundColor = .black
        personalBtn.setTitleColor(.white, for: .normal)
        personalBtn.layer.cornerRadius = personalBtn.frame.height/2
        carBtn.layer.cornerRadius = carBtn.frame.height/2
        personalBtn.clipsToBounds = true
        carBtn.clipsToBounds = true
     }
    override func viewWillAppear(_ animated: Bool) {
        let rideId =   UserDefaults.standard.value(forKey: "rideID") as? String
        let bookID =  UserDefaults.standard.value(forKey: "bookID") as? String
        
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
        
//        if (rideId == nil && bookID == nil)
//        {
//            self.currentRideBtn.isHidden = true
//            self.sosBtn.isHidden = true
//        }
//        else
//        {
//            self.currentRideBtn.isHidden = false
//            self.sosBtn.isHidden = false
//        }
        profileAllData()
        
        profileCollection.reloadData()
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
                      
                      //if am_i_booked == "1"{
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
    
    
    @IBAction func personalBtnAtn(_ sender: Any) {
        personalBtn.backgroundColor = .black
        personalBtn.setTitleColor(.white, for: .normal)
        carBtn.backgroundColor = .white
        carBtn.setTitleColor(.black, for: .normal)
        addCarBtn.isHidden = true
        self.profileCollection.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: false)
    }
    
    @IBAction func carBtnAtn(_ sender: Any) {
        personalBtn.backgroundColor = .white
        personalBtn.setTitleColor(.black, for: .normal)
        carBtn.backgroundColor = .black
        carBtn.setTitleColor(.white, for: .normal)
        addCarBtn.isHidden = false
        self.profileCollection.scrollToItem(at: NSIndexPath(item: 1, section: 0) as IndexPath, at: .right, animated: false)
    }
    @IBAction func addCarBtnAtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "carDetailVC") as! carDetailVC
        story.delegate = self
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    func selectedData(name: String, Id: String, txtValue: Int){
        profileAllData()
        profileCollection.reloadData()
    }
    
}

//MARK: Collection Methods
extension ProfileVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0{
            collectionView.register(UINib.init(nibName: "personalCell", bundle: nil), forCellWithReuseIdentifier: "personalCell")
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "personalCell", for: indexPath) as! personalCell
            
            if UserVM.sheard.profileDetails.count != 0{
                let url = UserVM.sheard.profileDetails[0].profiledata[0].pic
                item.userImg.sd_setImage(with: URL(string: url!))
                item.userName.text = UserVM.sheard.profileDetails[0].profiledata[0].fname
                item.lbl1.text = UserVM.sheard.profileDetails[0].profiledata[0].email
                item.lbl2.text = UserVM.sheard.profileDetails[0].profiledata[0].mobile
                item.bioLbl.text = UserVM.sheard.profileDetails[0].profiledata[0].bio
                item.stateLbl.text = UserVM.sheard.profileDetails[0].profiledata[0].state
                item.cityLbl.text = UserVM.sheard.profileDetails[0].profiledata[0].city
                item.starView.rating = Double(UserVM.sheard.profileDetails[0].profiledata[0].rating) ?? 0.0
            }
            
            item.paymentAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "WalletVC") as! WalletVC
                self.navigationController?.pushViewController(story, animated: true)
            }
            item.editAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "updateProfileVC") as! updateProfileVC
                self.navigationController?.pushViewController(story, animated: true)
            }
            return item
        }else{
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "carCollectionFile", for: indexPath) as! carCollectionFile
            item.carTable.delegate = self
            item.carTable.dataSource = self
            item.carTable.reloadData()
            return item
        }
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: profileCollection.frame.width, height: profileCollection.frame.height)
    }
    
    @objc func plusbtnAtn(){
        let story = storyboard?.instantiateViewController(withIdentifier: "carDetailVC") as! carDetailVC
        navigationController?.pushViewController(story, animated: true)
    }
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserVM.sheard.profileDetails.count != 0{
            return UserVM.sheard.profileDetails[0].carData.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib.init(nibName: "carTableCell", bundle: nil), forCellReuseIdentifier: "carTableCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "carTableCell") as! carTableCell
        cell.modelLbl.text = UserVM.sheard.profileDetails[0].carData[indexPath.row].model
        cell.makeLbl.text = UserVM.sheard.profileDetails[0].carData[indexPath.row].name
        cell.yearLbl.text = UserVM.sheard.profileDetails[0].carData[indexPath.row].year
        cell.deleteBtn = { (action) in
                self.deleteCar(car_id: UserVM.sheard.profileDetails[0].carData[indexPath.row].id)
        }
        return cell
    }
    
    
}


//MARK: - API Methods
extension ProfileVC{
    func profileAllData(){
        let userID1 = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

        UserVM.sheard.profileDetails.removeAll()
        Indicator.sharedInstance.showIndicator()

        UserVM.sheard.userProfile(userid: userID1) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.profileCollection.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    
    func deleteCar(car_id: String) {
        Indicator.sharedInstance.showIndicator()
        let userID1 = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

        UserVM.sheard.carDelete(user_id: userID1, car_id: car_id) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.profileAllData()
                    self.profileCollection.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
}
