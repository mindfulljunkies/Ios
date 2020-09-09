//
//  RideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 12/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import CoreLocation
class RideVC: BaseVC {
    
    @IBOutlet weak var currentRideBtn: UIButton!
       @IBOutlet weak var sosBtn: UIButton!

    @IBOutlet weak var mOfferLbl: UILabel!
    
    @IBOutlet weak var mRevLbl: UILabel!
    @IBOutlet var backView: UIView!
    @IBOutlet var givenBtn: UIButton!
    @IBOutlet var receivedBtn: UIButton!
    @IBOutlet var rideTable: UITableView!
    
    var buttonValue = 1
    var ManageRideDict : ManageRides?
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
//                    self.currentRideBtn.isHidden = false
//                    self.sosBtn.isHidden = false
//                }
//                else
//                {
//                    self.currentRideBtn.isHidden = true
//                    self.sosBtn.isHidden = true
//                }
        allRides()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.setShadow()
        backView.layer.cornerRadius = backView.frame.height/2
        
        receivedBtn.backgroundColor = .black
        receivedBtn.setTitleColor(.white, for: .normal)
        receivedBtn.layer.cornerRadius = givenBtn.frame.height/2
        givenBtn.layer.cornerRadius = givenBtn.frame.height/2
        givenBtn.clipsToBounds = true
        givenBtn.clipsToBounds = true
        mRevLbl.textColor = .white
        mOfferLbl.textColor = .black

        buttonValue = 1
        
    }
    
    
    @IBAction func receivedBtnAtn(_ sender: Any) {
        receivedBtn.backgroundColor = .black
        receivedBtn.setTitleColor(.white, for: .normal)
        givenBtn.backgroundColor = .white
        givenBtn.setTitleColor(.black, for: .normal)
        buttonValue = 1
        //        rideTable.scrollsToTop = true
        mRevLbl.textColor = .white
        mOfferLbl.textColor = .black
        rideTable.reloadData()
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
    @IBAction func givenBtnAtn(_ sender: Any) {
        receivedBtn.backgroundColor = .white
        receivedBtn.setTitleColor(.black, for: .normal)
        givenBtn.backgroundColor = .black
        givenBtn.setTitleColor(.white, for: .normal)
        mRevLbl.textColor = .black
        mOfferLbl.textColor = .white
        buttonValue = 2
        //        rideTable.scrollsToTop = true
        rideTable.reloadData()
    }
}

extension RideVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if UserVM.sheard.allRidesDetails.count != 0{
//            if buttonValue == 1{
//                return UserVM.sheard.allRidesDetails[0].bookedRide.count
//            }else{
//                return UserVM.sheard.allRidesDetails[0].offerRide.count
//            }
//        }else{
//            return 0
//        }
        if buttonValue == 1{
            if self.ManageRideDict != nil{
                 if (self.ManageRideDict?.booked_ride!.count)! > 0{
                     return (self.ManageRideDict?.booked_ride!.count)!
                 }else{
                    return 0
                }
            }else{
                return 0
            }
        }else{
            if self.ManageRideDict != nil{
                if (self.ManageRideDict?.current_offer_ride!.count)! > 0{
                     return (self.ManageRideDict?.current_offer_ride!.count)!
                }else{
                    return 0
                }
                
            }else{
                return 0
            }
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if UserVM.sheard.allRidesDetails.count != 0{
            if buttonValue == 1{
                
              //  tableView.register(UINib.init(nibName: "receiveCellFile", bundle: nil), forCellReuseIdentifier: "receiveCellFile")
                let cell = tableView.dequeueReusableCell(withIdentifier: "ManageTableViewCellID") as! ManageTableViewCell
                
                let url = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].pic
                 
                cell.mCntntImgHgt.constant = 55
                cell.mCntntImgWidht.constant = 55
                view.layoutIfNeeded()
                cell.cellImg.sd_setImage(with: URL(string: url!), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
                cell.nameLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].firstname
                cell.picLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_from_address
                cell.dropLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_to_address
                let dates = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_date
                cell.dateLbl.text = convertDateFormater(dates ?? "")
                let times = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_time
                cell.timeLbl.text = timeConversion12(time24: times ?? "")
                cell.priceLbl.text = "$\(UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].book_amount!)"
                
                if UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].detour == "1"{
                   cell.detourImg.isHidden = false
                }
                else{
                   cell.detourImg.isHidden = true
                }
                if ManageRideDict?.booked_ride![indexPath.row].ride_from_address2 != ""{
                  
                    
                   /*
                    cell.fstLbl.isHidden = false
                    cell.mFrstLocImg.isHidden = false
                    
                     cell.mCstntLoc1.constant = 4
                    */
                    
                    cell.stop1Location.isHidden = false
                    cell.mLblExpand.text = ManageRideDict?.booked_ride![indexPath.row].ride_from_address2 ?? ""
                     view.layoutIfNeeded()
                }else{
                    
                    /*
                    cell.mLblExpand.text = ""
                    cell.mCstntLoc1.constant = 0
                    cell.fstLbl.isHidden = true
                    cell.mFrstLocImg.isHidden = true
 */
                     cell.stop1Location.isHidden = true
                    view.layoutIfNeeded()
                }
                if ManageRideDict?.booked_ride![indexPath.row].ride_from_address3 != ""{
                    
                    /*
                    cell.sndLbl.isHidden = false
                     cell.mSecLocImg.isHidden = false
                    cell.mCstntLoc2.constant = 12
 */
                    cell.stop2Location.isHidden = false
                    cell.mExpandLbl2.text = ManageRideDict?.booked_ride![indexPath.row].ride_from_address3 ?? ""
                     view.layoutIfNeeded()
                }else{
                    /*
                     cell.mCstntLoc2.constant = 0
                     cell.sndLbl.isHidden = true
                     cell.mSecLocImg.isHidden = true
                     cell.mExpandLbl2.text = ""
 */
                    cell.stop2Location.isHidden = true
                      view.layoutIfNeeded()
                }
                
                
                
                if ManageRideDict?.booked_ride![indexPath.row].is_local_ride == "1"{
                    cell.bgView.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    cell.bgView.layer.borderWidth = 1
                    cell.mLocalRideLbl.isHidden = false

                }else{
                    cell.bgView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    cell.bgView.layer.borderWidth = 0
                    cell.mLocalRideLbl.isHidden = true

                }
                return cell
            }else{
                if UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].is_local_ride == "0"{
                   // tableView.register(UINib.init(nibName: "givenCellFile", bundle: nil), forCellReuseIdentifier: "givenCellFile")
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ManageTableViewCellID") as! ManageTableViewCell
                    cell.mCntntImgHgt.constant = 0
                    cell.mCntntImgWidht.constant = 0
                    view.layoutIfNeeded()
                    cell.nameLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].firstname
                    cell.picLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_from_address
                    cell.dropLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_to_address
                    let dates = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_date
                    cell.dateLbl.text = convertDateFormater(dates ?? "")
                    let times = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_time
                    cell.timeLbl.text = timeConversion12(time24: times ?? "")
                   
                    cell.priceLbl.text = "$\(UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_amount!)"
                    
                    if ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address2 != ""{
                        cell.mLblExpand.text = ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address2 ?? ""
//                        cell.fstLbl.isHidden = false
//                         cell.mCstntLoc1.constant = 2
                        cell.stop1Location.isHidden = false
                    }else{
//                        cell.mCstntLoc1.constant = 0
//                        cell.fstLbl.isHidden = true
//                        cell.mFrstLocImg.isHidden = true
                        
                        cell.stop1Location.isHidden = true
                        view.layoutIfNeeded()
                    }
                    if ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address3 != ""{
                        cell.mExpandLbl2.text = ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address3 ?? ""
//                        cell.sndLbl.isHidden = false
//                        cell.mCstntLoc2.constant = 10
//                        cell.mSecLocImg.isHidden = false
                        cell.stop2Location.isHidden = false
                    }else{
//                        cell.mCstntLoc2.constant = 0
//                        cell.sndLbl.isHidden = true
//                        cell.mSecLocImg.isHidden = true
                        cell.stop2Location.isHidden = true
                        view.layoutIfNeeded()
                    }
                    if ManageRideDict?.current_offer_ride![indexPath.row].is_local_ride == "1"{
                        cell.bgView.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                        cell.bgView.layer.borderWidth = 1
                        cell.mLocalRideLbl.isHidden = false

                    }else{
                        cell.bgView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                        cell.bgView.layer.borderWidth = 1
                        cell.mLocalRideLbl.isHidden = true

                    }
                    return cell
                }else{
                   // tableView.register(UINib.init(nibName: "offerRedManageTableCell", bundle: nil), forCellReuseIdentifier: "offerRedManageTableCell")
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ManageTableViewCellID") as! ManageTableViewCell
                    cell.mCntntImgHgt.constant = 0
                    cell.mCntntImgWidht.constant = 0
                    view.layoutIfNeeded()
                    cell.nameLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].firstname
                    cell.picLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_from_address
                    cell.dropLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_to_address
                    let dates = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_date
                    cell.dateLbl.text = convertDateFormater(dates ?? "")
                    let times = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_time
                    cell.timeLbl.text = timeConversion12(time24: times ?? "")
                   
                    cell.priceLbl.text = "$\(UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_amount!)"
                    if ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address2 != ""{
                        cell.mLblExpand.text = ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address2 ?? ""
//                        cell.fstLbl.isHidden = false
//                        cell.mCstntLoc1.constant = 12
                        cell.stop1Location.isHidden = false
                    }else{
//                        cell.mCstntLoc1.constant = 0
//                        cell.fstLbl.isHidden = true
                        
                        cell.stop1Location.isHidden = true
                        view.layoutIfNeeded()
                    }
                    if ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address3 != ""{
                        cell.mExpandLbl2.text = ManageRideDict?.current_offer_ride![indexPath.row].ride_from_address3 ?? ""
//                        cell.sndLbl.isHidden = false
//                         cell.mCstntLoc2.constant = 12
                        cell.stop2Location.isHidden = false
                    }else{
//                        cell.mCstntLoc2.constant = 0
//                        cell.sndLbl.isHidden = true
                        cell.stop2Location.isHidden = true
                        view.layoutIfNeeded()
                    }
                    if ManageRideDict?.current_offer_ride![indexPath.row].is_local_ride == "1"{
                        cell.bgView.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                        cell.bgView.layer.borderWidth = 1
                        cell.mLocalRideLbl.isHidden = false
                    }else{
                        cell.bgView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                        cell.bgView.layer.borderWidth = 1
                        cell.mLocalRideLbl.isHidden = true

                    }
                    
                    return cell
                }
             }
        }else{
            tableView.register(UINib.init(nibName: "receiveCellFile", bundle: nil), forCellReuseIdentifier: "receiveCellFile")
            let cell = tableView.dequeueReusableCell(withIdentifier: "receiveCellFile") as! receiveCellFile
            return cell
        }
        
  
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(UserVM.sheard.allRidesDetails)
        if buttonValue == 1{
            
            let manageDict = ManageRideDict?.booked_ride![indexPath.row]
            let story = self.storyboard?.instantiateViewController(withIdentifier: "OfferedRideDetailsVCID1") as! OfferedRideDetailsVC1
            story.selectIndex = indexPath.row
            story.islocal = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].is_local_ride ?? ""
            story.rideDetailDict = manageDict!
            story.rideId = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_id
            story.bookid = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].book_id ?? ""
            story.isReceived = true
//            story.cancelReason = "usercancel"
            self.navigationController?.pushViewController(story, animated: true)
        }else{
            let manageDict = ManageRideDict?.current_offer_ride![indexPath.row]

            let story = self.storyboard?.instantiateViewController(withIdentifier: "OfferedRideDetailsVCID1") as! OfferedRideDetailsVC1
            story.rideDetailDict = manageDict!
            story.selectIndex = indexPath.row
             story.isReceived = false
            story.islocal = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].is_local_ride ?? ""
            story.rideId = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_id
            story.bookid = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].book_id ?? ""
          //  let v =  UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].
            self.navigationController?.pushViewController(story, animated: true)
        }
    }
    func convertDateFormater(_ date: String) -> String
    {
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        return  dateFormatter.string(from: date ?? Date())
        
    }
    func timeConversion12(time24: String) -> String {
        let dateAsString = time24
        let df = DateFormatter()
        df.dateFormat = "HH:mm:ss"
        
        let date = df.date(from: dateAsString)
        df.dateFormat = "hh:mm a"
        
        let time12 = df.string(from: date ?? Date())
        print(time12)
        return time12
    }
}



//MARK: - API Methods
extension RideVC{
    func allRides(){
        UserVM.sheard.allRidesDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.manageRide(userid: userID) { (success, response,message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                   
                    self.ManageRideDict = ManageRides.init(dictionary: response! as NSDictionary)
                    self.mRevLbl.text! = "\(String(describing: self.ManageRideDict!.booked_ride!.count))"
                    self.mOfferLbl.text! = "\(String(describing: self.ManageRideDict!.current_offer_ride!.count))"

                    self.rideTable.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}
