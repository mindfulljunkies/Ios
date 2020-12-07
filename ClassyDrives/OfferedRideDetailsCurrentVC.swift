//
//  OfferedRideDetailsCurrentVC.swift
//  ClassyDrives
//
//  Created by Developer on 15/11/20.
//  Copyright © 2020 Safal Bhatia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FloatRatingView
import GoogleMaps
class OfferedRideDetailsCurrentVC:BaseVC {
    
    
   
    @IBOutlet weak var pickLocation: UIView!
    @IBOutlet weak var dropLocation: UIView!
    @IBOutlet weak var stop1Location: UIView!
    @IBOutlet weak var stop2Location: UIView!
    
    
    @IBOutlet weak var amountLbl: UILabel!
   
    
   
    @IBOutlet weak var mRatingVw: FloatRatingView!
   
    
    @IBOutlet weak var mUserLbl2: UILabel!
    @IBOutlet weak var mUserNameLbl: UILabel!
    
    
    @IBOutlet weak var mUserProfileImage: UIImageView!
    
    @IBOutlet weak var mCstntLocVwHgt: NSLayoutConstraint!
    
    @IBOutlet weak var mImgLocYellow2: UIImageView!
    @IBOutlet weak var mImgLocYellow: UIImageView!
    @IBOutlet weak var mLocationLbl3: UILabel!
    
    @IBOutlet weak var mLoctionLbl2: UILabel!
    @IBOutlet weak var mProfileVw: UIView!
    @IBOutlet weak var mCstntTblHgt: NSLayoutConstraint!
    @IBOutlet weak var mCnstntProfileVwHgt: NSLayoutConstraint!
    @IBOutlet weak var mCstntScrolVwHgt: NSLayoutConstraint!
    
    @IBOutlet weak var mCstntDetourHgt: NSLayoutConstraint!
    @IBOutlet weak var mCstntAutoHgt: NSLayoutConstraint!
    @IBOutlet weak var mTableVw: UITableView!
    @IBOutlet weak var mFirstLocationLbl: UILabel!
    
    @IBOutlet weak var mSecLoctionLbl: UILabel!
    @IBOutlet weak var mPriceLbl: UILabel!
    
    @IBOutlet weak var mDateLbl: UILabel!
    @IBOutlet weak var mTimeLbl: UILabel!
    @IBOutlet weak var mSeatLbl: UILabel!
    @IBOutlet weak var mCarNameLbl: UILabel!
    @IBOutlet weak var mDetourLbl: UILabel!
    @IBOutlet weak var mAutolbl: UILabel!
    @IBOutlet weak var mDetourVw: UIView!
    @IBOutlet weak var mAutoVw: UIView!
    
    @IBOutlet weak var loc2img: UIImageView!
    @IBOutlet weak var loc3img: UIImageView!
    var rideDetailDict : RideDetail?
    var bookid = String()
    var islocal = ""
    var rideId = String()
    var selectIndex = Int()
//    var bookDetail : RideDetail?
    var isFromView : Bool = false
    var isFromRide : Bool = false
    var bookDict : bookDetailData!
    var ref: DatabaseReference!
    var isReceived : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("isReceived--\(isReceived)")
        print(rideId)
        print(bookid)

     
    }
    
    @IBAction func getDirection(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier:"DirectionMapVC") as! DirectionMapVC
        
        let lat = Double(rideDetailDict?.ride_from_lat ?? "")
        let long = Double(rideDetailDict?.ride_from_long ?? "")
        
        let lat2 = Double( rideDetailDict?.ride_from_lat2 ?? "")
        let long2 = Double(rideDetailDict?.ride_from_long2  ?? "" )
       
        let lat3 = Double(rideDetailDict?.ride_from_lat3 ?? "")
        let long3 = Double(rideDetailDict?.ride_from_long3 ?? "")
       
        let lat4 = Double(rideDetailDict?.ride_to_lat  ?? "")
        let long4 = Double(rideDetailDict?.ride_to_long  ?? "")
        
        let coordinates = [
            CLLocationCoordinate2D(latitude: lat ?? 0.0, longitude: long ?? 0.0 ),
            CLLocationCoordinate2D(latitude: lat2 ?? 0.0, longitude: long2 ?? 0.0),
            CLLocationCoordinate2D(latitude: lat3 ?? 0.0, longitude: long3 ?? 0.0),
            CLLocationCoordinate2D(latitude: lat4 ?? 0.0, longitude: long4 ?? 0.0)
        ]
        story.cooridnates = coordinates

        self.navigationController?.pushViewController(story, animated: true)
    }
    func putData(){
       mFirstLocationLbl.text = rideDetailDict?.ride_from_address ?? ""
       mUserLbl2.text = rideDetailDict?.bio ?? ""
       mSecLoctionLbl.text = rideDetailDict?.ride_to_address ?? ""
       mPriceLbl.text = "$ \(rideDetailDict?.book_amount ?? "")"
//        if (self.isReceived == false)
//                           {
        self.mCarNameLbl.text = "\(rideDetailDict?.car_name ?? "") - \(rideDetailDict?.car_model ?? "")"
//        }
        let rideDate = rideDetailDict?.ride_date
        mDateLbl.text = convertDateFormater(rideDate ?? "")
        let rideTime = rideDetailDict?.ride_time
        mTimeLbl.text = timeConversion12(time24: rideTime ?? "")
        if (isReceived == true)
        {
            mSeatLbl.text = "\(rideDetailDict?.book_seat ?? "") Seat Booked"
            amountLbl.text = "Total amount"
        }
        else
        {
        mSeatLbl.text = "\(rideDetailDict?.ride_seat ?? 0) Seat Available"
        }
//            mTableVw.reloadData()
     //   mCnstntProfileVwHgt.constant = 0
        view.layoutIfNeeded()
        if rideDetailDict?.detour == "1"{
            mCstntDetourHgt.constant = 0
            mDetourLbl.text = "Detour: \(rideDetailDict?.detour_miles ?? "") miles"
            mDetourVw.isHidden = false
            view.layoutIfNeeded()
        }
        if rideDetailDict?.is_autoapproval == "1"{
            mCstntAutoHgt.constant = 60
            mAutoVw.isHidden = false
             view.layoutIfNeeded()
        }
        
        if rideDetailDict?.ride_from_address2 != ""{
            mLoctionLbl2.text = rideDetailDict?.ride_from_address2 ?? ""
            stop1Location.isHidden = false
        }else{
       
            stop1Location.isHidden = true
       
            view.layoutIfNeeded()
        }
        if rideDetailDict?.ride_from_address3 != ""{
            mLocationLbl3.text = rideDetailDict?.ride_from_address3 ?? ""
             stop2Location.isHidden = false
            
        }else{
          stop2Location.isHidden = true
        
            //MY
            //  mCstntLocVwHgt.constant = 95
            
            
            view.layoutIfNeeded()

        }
        if isReceived == false{
            mCnstntProfileVwHgt.constant = 0
            mProfileVw.isHidden = true
           
            
        }
    }
    
    func fromApiData(){
        if UserVM.sheard.bookRideDetails.count != 0{
            mFirstLocationLbl.text = UserVM.sheard.bookRideDetails[0].ride.ride_from_address
            mSecLoctionLbl.text = UserVM.sheard.bookRideDetails[0].ride.ride_to_address
            mPriceLbl.text = "$\(UserVM.sheard.bookRideDetails[0].ride.ride_amount ?? "" )"
            
//            mCarNameLbl.text =      UserVM.sheard.bookRideDetails[0].ride.car_model

             let rideDate = UserVM.sheard.bookRideDetails[0].ride.ride_date
            mDateLbl.text = convertDateFormater(rideDate ?? "")
            let rideTime = UserVM.sheard.bookRideDetails[0].ride.ride_time
             mTimeLbl.text = timeConversion12(time24: rideTime ?? "")
            mSeatLbl.text = "\(String(describing: UserVM.sheard.bookRideDetails[0].ride.ride_seat!)) Seat Available"
            if rideDetailDict?.detour == "1"{
                mCstntDetourHgt.constant = 0
                mDetourLbl.text = "Detour: \(rideDetailDict?.detour_miles ?? "") miles"
                mDetourVw.isHidden = false
                view.layoutIfNeeded()
            }
            if rideDetailDict?.is_autoapproval == "1"{
                mCstntAutoHgt.constant = 60
                mAutoVw.isHidden = false
                view.layoutIfNeeded()
            }
            else{
                if isFromView == true{
                    if self.rideDetailDict?.detour  == "1"{
                        mCstntDetourHgt.constant = 0
                        mDetourLbl.text = "Detour: \(rideDetailDict?.detour_miles ?? "") miles"
                        mDetourVw.isHidden = false
                        view.layoutIfNeeded()
                    }
                    if self.rideDetailDict?.is_autoapproval == "1"{
                        mCstntAutoHgt.constant = 60
                        mAutoVw.isHidden = false
                        view.layoutIfNeeded()
                    }
                    
                    if self.rideDetailDict?.ride_from_address2 != ""{
                        mLoctionLbl2.text = rideDetailDict?.ride_from_address2 ?? ""
                        stop1Location.isHidden = false
                    }else{
                      stop1Location.isHidden = true
                        view.layoutIfNeeded()
                    }
                    if self.rideDetailDict?.ride_from_address3 != ""{
                        mLocationLbl3.text = rideDetailDict?.ride_from_address3 ?? ""
                      stop2Location.isHidden = false
                        
                    }else{
                       stop2Location.isHidden = true
                        
                    }
                    if isReceived == false{
                        mCnstntProfileVwHgt.constant = 0
                        mProfileVw.isHidden = true
                       
                    }
                    
                }
            }
            
        }else{
            if isFromView == true{
                if self.rideDetailDict?.detour  == "1"{
                    mCstntDetourHgt.constant = 0
                    mDetourLbl.text = "Detour: \(rideDetailDict?.detour_miles ?? "") miles"
                    mDetourVw.isHidden = false
                    view.layoutIfNeeded()
                }
                if self.rideDetailDict?.is_autoapproval == "1"{
                    mCstntAutoHgt.constant = 60
                    mAutoVw.isHidden = false
                    view.layoutIfNeeded()
                }
                
                if self.rideDetailDict?.ride_from_address2 != ""{
                    mLoctionLbl2.text = rideDetailDict?.ride_from_address2 ?? ""
                    stop1Location.isHidden = false
                }else{
                   stop1Location.isHidden = true
                }
                if self.rideDetailDict?.ride_from_address3 != ""{
                    mLocationLbl3.text = rideDetailDict?.ride_from_address3 ?? ""
                   stop2Location.isHidden = false
                    
                }else{
                    //  cell.mCstntLoc2.constant = 0
                  stop2Location.isHidden = true
                    
                }
                if isReceived == false{
                    mCnstntProfileVwHgt.constant = 0
                    mProfileVw.isHidden = true
                   
                }
                
            }
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    
self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.isHidden = false
        rideDetails()
        fromApiData()
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = true
       
    }
    

    
    
    
    
    @IBAction func mBackBtnAct(_ sender: Any) {
        if isFromView == true{
//            for controller in self.navigationController!.viewControllers as [UIViewController] {
//                if controller is MainTabVC {
//                    self.navigationController!.popToViewController(controller, animated: true)
//                    break
//                }
//            }
            let story = self.storyboard?.instantiateViewController(withIdentifier:"MainTabVC") as! MainTabVC
            self.navigationController?.pushViewController(story, animated: true)
        }else{
        navigationController?.popViewController(animated: true)
        }
    }

    
    @IBAction func mViewProfileBtnAct(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DriverProfile", bundle: nil)
       if let destinationvc = storyboard.instantiateViewController(withIdentifier: "DriverVC") as? DriverVC
        
       {
        destinationvc.userId = rideDetailDict?.ride_user ?? ""
        self.navigationController?.pushViewController(destinationvc, animated: true)
        }
    }
    
    func rideDetails() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.bookRideDetails.removeAll()
        UserVM.sheard.bookRideDetailData(user_id: userID, ride_id: rideId, book_id: bookid) { (success, response,message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    print(response)
                    let res = response?["ride_detail"] as? Dictionary<String,Any>
                    print(res)
                    if (self.isReceived == true || self.isFromView == true)
                    {
                        self.mCarNameLbl.text = "\(String(describing: res?["car_name"] as? String ?? "") ) - \(String(describing: res?["car_model"] as? String ?? "") ?? "")"
                    }
                    
                    
                    self.rideDetailDict = RideDetail.init(dictionary: res as! NSDictionary)
                    
                    if self.isReceived == false{
                    if UserVM.sheard.bookRideDetails.count != 0{
                        if UserVM.sheard.bookRideDetails[0].book.count != 0{
                            // tableHgt 145
                           let count = UserVM.sheard.bookRideDetails[0].book.count
                           let tableHgt = count * 195
                            if self.isFromView == false{
                            
                                 self.fromApiData()
                            }else{
                          
                                 self.fromApiData()
                            }
                          
                            self.view.layoutIfNeeded()
                        }else{
                            self.fromApiData()
                        }
                    }else{
                        self.fromApiData()
                        }
                    }else{
                        
                         let userDetail = UserVM.sheard.bookRideDetails[0]
                        print(userDetail)
                        self.mUserNameLbl.text = userDetail.ride.firstname ?? ""
                        self.mRatingVw.rating = Double(userDetail.ride.rating!) as! Double ?? 0.0
                      //  self.mUserProfileImage.sd_setImage(with: URL.init(string: (userDetail.ride.pic)), placeholderImage:  #imageLiteral(resourceName: "default"))
                        let url = userDetail.ride.pic
                        self.mUserProfileImage.sd_setImage(with: URL(string: url!), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
                    }
                }else{
//                    self.showAlert(message: message)
                }
            }else{
//                self.showAlert(message: error?.domain)
            }
        }
    }
}
