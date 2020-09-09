//
//  HomeVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import CoreLocation

protocol OfferRideDelegate {
    func getLocation(_ lat: CLLocationDegrees, _ long:CLLocationDegrees, _ str:String, _ index:Int)
}

class HomeVC: BaseVC, UITextFieldDelegate, OfferRideDelegate{
    fileprivate var newStatus:Bool = false
    @IBOutlet weak var sosBtn: UIButton!
    @IBOutlet var mainImg: UIImageView!
    @IBOutlet var exploreBtn: UIButton!
    @IBOutlet var offerRideView: UIView!
    @IBOutlet var offerRideHeight: NSLayoutConstraint!
    @IBOutlet var offerRideTable: UITableView!
    
    @IBOutlet var findRideView: UIView!
    @IBOutlet var FindRideHeight: NSLayoutConstraint!
    
    @IBOutlet var findPicTF: UITextField!
    @IBOutlet var findDropTF: UITextField!
    @IBOutlet var dateTF: UITextField!
    @IBOutlet var findNextBtn: UIButton!
    
    @IBOutlet weak var currentRideBtn: UIButton!
    @IBOutlet var findPicView: UIView!
    @IBOutlet var dropPicView: UIView!
    @IBOutlet var dateView: UIView!
    
    @IBOutlet var heightOfferRideTFView: NSLayoutConstraint!
    
    @IBOutlet var offerDropTF: UITextField!
    @IBOutlet var offerDateTF: UITextField!
    @IBOutlet var offerTimeTF: UITextField!
    @IBOutlet var offerNextBtn: UIButton!
    
    @IBOutlet var offerPickupView: UIView!
    @IBOutlet var offerdateView: UIView!
    @IBOutlet var offerTimeView: UIView!
    
    var lat = String()
    var lat1 = String()
    var lat2 = String()
    var lat3 = String()
    
    var lat4 = String()
    var lat5 = String()
    
   
    
    var long = String()
    var long1 = String()
    var long2 = String()
    var long3 = String()
    var long4 = String()
    var long5 = String()
    
    var address = String()
    var address1 = String()
    var address2 = String()
    var address3 = String()
    var address4 = String()
    var address5 = String()
    
    var addArr = [String]()
    var addLat = [String]()
    
    var offerDropLat = String()
    var offerDropLong = String()
    
    var findPicLat = String()
    var findPicLong = String()
    var findDropLat = String()
    var findDropLong = String()
    
    
    var text = ["Pickup Location"]
    //    var images = [#imageLiteral(resourceName: "pickup_location"),#imageLiteral(resourceName: "where_u_go")]
    
    var text1 = ["Pickup Location","Drop Location","Date"]
    var image1 = [#imageLiteral(resourceName: "pickup_location"),#imageLiteral(resourceName: "where_u_go"),#imageLiteral(resourceName: "date")]
    var offerValue = false
    var findValue = false
    var offerHeight = 500
    var indexValue = 1
    
    var offerDate = String()
    var offerTime = String()
    var dropLocation = String()
    
    var date = UIDatePicker()
    var date1 = UIDatePicker()
    var newOfferTime:String = ""
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
    
    @IBAction func notificationsBtn(_ sender: Any) {
        
        let story = self.storyboard?.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        
        self.navigationController?.pushViewController(story, animated: true)
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

       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBarController?.hidesBottomBarWhenPushed = false
        offerRideTable.isScrollEnabled = false
        self.offerRideHeight.constant = 190
        self.FindRideHeight.constant = 130
        self.heightOfferRideTFView.constant = 0
       
        
     
        
      //  exploreBtn.setButtonBorder()
        exploreBtn.layer.cornerRadius = exploreBtn.frame.height/2
        exploreBtn.layer.borderColor = UIColor.white.cgColor
        exploreBtn.layer.borderWidth = 2
        exploreBtn.alpha = 0.8
        exploreBtn.clipsToBounds = true
        offerRideView.setShadow()
        offerRideView.layer.cornerRadius = 40
        offerRideView.layer.borderColor = UIColor.white.cgColor
        offerRideView.layer.borderWidth = 1
        
        offerPickupView.setShadow()
        offerdateView.setShadow()
        offerTimeView.setShadow()
        offerNextBtn.setButtonBorder()
        offerDateTF.delegate = self
        offerTimeTF.delegate = self
        
        findRideView.setShadow()
        findRideView.layer.cornerRadius = 40
        findRideView.layer.borderColor = UIColor.white.cgColor
        findRideView.layer.borderWidth = 1
        
        findNextBtn.setButtonBorder()
        findPicView.setShadow()
        dropPicView.setShadow()
        dateView.setShadow()
        dateTF.placeholder = "Date"
        dateTF.delegate = self
        //curntDate()
    }
    
    func curntDate()->String {
        let dateFormatter : DateFormatter = DateFormatter()
        //   dateFormatter.dateFormat = "yyyy-mmm-dd"
        //dateFormatter.dateFormat = "mm-dd-yyy"
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
       // currentDate = dateString
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
    @IBAction func currentRideBtnAction(_ sender: Any) {
        self.curentRide()
    }
    
    @IBAction func sosBtnAction(_ sender: Any) {
        self.sosCall()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateTF{
            self.date.datePickerMode = .date
            self.date.minimumDate = Date()
            self.date.backgroundColor = .black
            self.date.setValue(UIColor.white, forKeyPath: "textColor")
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            toolbar.backgroundColor = .black
            dateTF.inputAccessoryView = toolbar
            dateTF.inputView = self.date
            let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
            cancelBtn.tintColor = .white
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.finddoneAction))
            doneBtn.tintColor = .white
            toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
        }
        else if textField == offerDateTF{
            self.date.datePickerMode = .date
            self.date.minimumDate = Date()
            self.date.backgroundColor = .black
            self.date.setValue(UIColor.white, forKeyPath: "textColor")
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            toolbar.backgroundColor = .black
            offerDateTF.inputAccessoryView = toolbar
            offerDateTF.inputView = self.date
            let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
            cancelBtn.tintColor = .white
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneAction))
            doneBtn.tintColor = .white
            toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
        }
        else if textField == offerTimeTF{
          // self.date1.datePickerMode = .time
//            self.date1.minimumDate = Date()
            
            print(Date().toString(format: "MM-dd-yyyy"))
            if offerDateTF.text ?? "" == Date().toString(format: "MM-dd-yyyy"){
                self.date1.minimumDate = Date()
                self.date1.datePickerMode = .time
            }else{
                date1 = UIDatePicker()
                self.date1.datePickerMode = .time
            }
            
            self.date1.backgroundColor = .black
            self.date1.setValue(UIColor.white, forKeyPath: "textColor")
            let toolbar1 = UIToolbar()
            toolbar1.sizeToFit()
            toolbar1.backgroundColor = .black
            offerTimeTF.inputAccessoryView = toolbar1
            offerTimeTF.inputView = self.date1
            let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let cancelBtn1 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
            cancelBtn1.tintColor = .white
            let doneBtn1 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneActionTime))
            doneBtn1.tintColor = .white
            toolbar1.setItems([cancelBtn1,flexSpace,doneBtn1], animated: true)
        }
    }
    
    @objc func finddoneAction()  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        dateTF.text = "\(formatter.string(from: date.date))"
        self.view.endEditing(true)
        offerRideTable.reloadData()
    }
  
    func getLocation(_ lat: CLLocationDegrees, _ long:CLLocationDegrees, _ str:String, _ index:Int) {
        print(str)
        print(lat)
        print(long)
        print(index)
        
        if index <= 2{
            newStatus = true
            text[index] = str
        }
        
        if index == 0{
            self.lat = "\(lat)"
            self.long = "\(long)"
            self.address = str
        }else if index == 1{
            self.lat1 = "\(lat)"
            self.long1 = "\(long)"
            self.address1 = str
        }else if index == 2{
            self.lat2 = "\(lat)"
            self.long2 = "\(long)"
            self.address2 = str
        }else if index == 3{
            self.offerDropLat = "\(lat)"
            self.offerDropLong = "\(long)"
            self.offerDropTF.text = str
        }
        
            
            
        else if index == 4{
            self.findPicLat = "\(lat)"
            self.findPicLong = "\(long)"
            findPicTF.text = str
        }else if index == 5{
            self.findDropLat = "\(lat)"
            self.findDropLong = "\(long)"
            findDropTF.text = str
        }
        offerRideTable.reloadData()
    }
    
    @IBAction func findRideBtnAtn(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            if self.findValue == false && self.offerValue == false{
                self.offerRideHeight.constant = 400
                self.FindRideHeight.constant = 350
                self.heightOfferRideTFView.constant = 0
                self.view.layoutIfNeeded()
                self.findValue = true
                self.offerValue = false
            }
            else if self.offerValue == false && self.findValue == true{
                self.offerRideHeight.constant = 190
                self.FindRideHeight.constant = 130
                self.heightOfferRideTFView.constant = 0
                self.view.layoutIfNeeded()
                self.findValue = false
                self.offerValue = false
            }
            else if self.offerValue == true && self.findValue == false{
                self.offerRideHeight.constant = 400
                self.FindRideHeight.constant = 350
                self.heightOfferRideTFView.constant = 50
                self.view.layoutIfNeeded()
                self.findValue = true
                self.offerValue = false
            }
        }
    }
    @IBAction func findPicLocationBtnAtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        story.index = 4
        story.delegate = self
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func dropLocationBtnAtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        story.index = 5
        story.delegate = self
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func findNextBtnAtn(_ sender: Any) {
        if findPicTF.text!.isEmpty && findDropTF.text!.isEmpty && dateTF.text!.isEmpty{
            showAlert(message: "Please fill the required data.")
        }else{
            findRide(fromAdd: findPicTF.text!, toAdd: findDropTF.text!, fromLat: findPicLat, fromLong: findPicLong, to_lat: findDropLat, to_Long: findDropLong)
        }
    }
    
    @IBAction func exploreBtnAtn(_ sender: Any) {
        let story = storyboard?.instantiateViewController(withIdentifier: "LocalRideVC") as! LocalRideVC
        
        navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func offerRideBtnAtn(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            if self.offerValue == false && self.findValue == false{
                self.offerRideHeight.constant = CGFloat(self.offerHeight)
                self.heightOfferRideTFView.constant = 335
                self.FindRideHeight.constant = 130
                self.offerValue = true
                self.findValue = false
                self.view.layoutIfNeeded()
            }else if self.offerValue == true && self.findValue == false{
                self.offerRideHeight.constant = 190
                self.FindRideHeight.constant = 130
                self.heightOfferRideTFView.constant = 0
                self.offerValue = false
                self.findValue = false
                self.view.layoutIfNeeded()
            }
            else if self.offerValue == false && self.findValue == true{
                self.offerRideHeight.constant = CGFloat(self.offerHeight)
                self.FindRideHeight.constant = 130
                self.heightOfferRideTFView.constant = 335
                self.offerValue = true
                self.findValue = false
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func offerDropBtnAtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        story.index = 3
        story.delegate = self
        self.navigationController?.pushViewController(story, animated: true)
    }

    func covertDate(date : String) -> String
    {
        let dateString = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = Locale.init(identifier: "en_GB")

        let dateObj = dateFormatter.date(from: dateString)

        dateFormatter.dateFormat = "MM-dd-yyyy"
        print("Dateobj: \(dateFormatter.string(from: dateObj ?? Date()))")
        return dateFormatter.string(from: dateObj ?? Date())
    }
    @IBAction func offerNextBtnAtn(_ sender: Any) {
        
        if self.lat == "" && offerDropTF.text!.isEmpty && offerDateTF.text!.isEmpty && offerTimeTF.text!.isEmpty{
            self.showAlert(message: "Please fill all data")
        }else{
            let story = self.storyboard?.instantiateViewController(withIdentifier: "RideDetailsVC") as! RideDetailsVC
            
            story.rideFromAdd = address
            story.rideFromLat = lat
            story.rideFromLong = long
            
            story.address2 = address1
            story.rideLat2 = lat1
            story.rideLong2 = long1
            
            story.address3 = address2
            story.rideLat3 = lat2
            story.rideLong2 = long2
            
            story.rideToAdd = offerDropTF.text!
            story.rideToLat = offerDropLat
            story.rideToLong = offerDropLong
            story.ridedate = self.offerDateTF.text ?? ""
            story.rideTime = self.offerTimeTF.text ?? ""
            self.navigationController?.pushViewController(story, animated: true)
        }
        
        
    }
    
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if text.count < 3 {
            return text.count + 1
        }
        return text.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == text.count {
            print(text)
            tableView.register(UINib.init(nibName: "addStopCellFile", bundle: nil), forCellReuseIdentifier: "addStopCellFile")
            let cell = tableView.dequeueReusableCell(withIdentifier: "addStopCellFile") as! addStopCellFile
            cell.addStpBtn.isHidden = false
            cell.addStopAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
                cell.addStpBtn.isHidden = false
                story.index = indexPath.row
                story.delegate = self
                story.boolPickup = true
                self.navigationController?.pushViewController(story, animated: true)
                self.text.append("")
                self.indexValue = self.indexValue + 1
                if self.text.count < 3 {
                    self.offerHeight = self.offerHeight + 50
                    cell.addStpBtn.isHidden = false
                } else {
                    cell.addStpBtn.isHidden = true
                }
                self.offerRideHeight.constant = CGFloat(self.offerHeight)
                tableView.reloadData()
            }
            return cell
        }else{
            if indexPath.row == 0 {
                tableView.register(UINib.init(nibName: "offerRideCellFile", bundle: nil), forCellReuseIdentifier: "offerRideCellFile")
                let cell = tableView.dequeueReusableCell(withIdentifier:
                    "offerRideCellFile") as! offerRideCellFile
                if newStatus{
                    cell.cellName.text = text[indexPath.row]
                }else{
                    cell.cellName.placeholder = text[indexPath.row]
                }
                
                cell.cellName.textColor = .black
                cell.cellAtn = { (action) in
                    let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
                    story.index = indexPath.row
                    story.delegate = self
                    story.boolPickup = false
                self.navigationController?.pushViewController(story, animated: true)
                }
                return cell
            } else {
                tableView.register(UINib.init(nibName: "offerRidetnCellFile", bundle: nil), forCellReuseIdentifier: "offerRidetnCellFile")
                let cell = tableView.dequeueReusableCell(withIdentifier: "offerRidetnCellFile") as! offerRidetnCellFile
                cell.locationNameTF.text = text[indexPath.row]
                cell.locationNameTF.textColor = .black
                cell.addLocationAtn = { (action) in
                    let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
                    story.index = indexPath.row
                    story.delegate = self
                    story.boolPickup = false
                    self.navigationController?.pushViewController(story, animated: true)
                }
                cell.cellAtn = { (action) in
                    self.text.remove(at: indexPath.row)
                    if self.text.count < 2 {
                       self.offerHeight = self.offerHeight - 50
                    }
                    tableView.reloadData()
                    self.offerRideHeight.constant = CGFloat(self.offerHeight)
                }
                return cell
            }
        }
    }
    
    @objc func doneAction()  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        offerDateTF.text = "\(formatter.string(from: date.date))"
        self.view.endEditing(true)
        offerRideTable.reloadData()
    }
    @objc func doneActionTime(sender: UITextField){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        offerTimeTF.text = "\(formatter.string(from: date1.date))"
        self.view.endEditing(true)
        offerRideTable.reloadData()
    }
    @objc func cancelBtn(){
        self.view.endEditing(true)
    }
}

//MARK: - API Methods
extension HomeVC{
    func findRide(fromAdd: String, toAdd: String, fromLat: String, fromLong: String, to_lat: String, to_Long: String) {
        
        UserVM.sheard.allRideDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.findRide(userid: userID, from_address: fromAdd, to_address: toAdd, from_lat: fromLat, from_long: fromLong, to_lat: to_lat, to_long: to_Long, date: dateTF.text ?? "", price: "ASC", is_local_ride: "0") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    print(UserVM.sheard.allRideDetails)
                    let story = self.storyboard?.instantiateViewController(withIdentifier:"allRides") as! allRides
                    story.topvalue = "\(fromAdd)"
                    story.bottomValue = toAdd
                    story.date = self.dateTF.text!
                    self.navigationController?.pushViewController(story, animated: true)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}


extension Date {

func toString(format: String = "yyyy-MM-dd") -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = format
    return formatter.string(from: self)
}
}
