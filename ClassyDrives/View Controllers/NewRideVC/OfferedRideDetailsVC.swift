//
//  OfferedRideDetailsVC.swift
//  ClassyDrives
//
//  Created by apple on 17/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FloatRatingView
import GoogleMaps

class OfferedRideDetailsVC: BaseVC {

    
    
    @IBOutlet weak var pickLocation: UIView!
    @IBOutlet weak var dropLocation: UIView!
    @IBOutlet weak var stop1Location: UIView!
    @IBOutlet weak var stop2Location: UIView!
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var rideStatusView: UIView!
    @IBOutlet weak var amountLbl: UILabel!
    @IBOutlet weak var mBookingReqLbl: UILabel!
    
    @IBOutlet weak var mPendingLbl: UILabel!
    @IBOutlet weak var mRatingVw: FloatRatingView!
    @IBOutlet weak var rideAprrovedLbl: UILabel!
    
    @IBOutlet weak var otpLbl: UILabel!
    @IBOutlet weak var mUserLbl2: UILabel!
    @IBOutlet weak var mUserNameLbl: UILabel!
    
    @IBOutlet weak var otpView: UIView!
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
            mTableVw.isHidden = false
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
                        mTableVw.isHidden = false
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
                    mTableVw.isHidden = false
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
     if  isFromRide  == true
     {
        mTableVw.isHidden = true
        }
        
self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.isHidden = false
        rideDetails()
        fromApiData()
        // Do any additional setup after loading the view.
        if isReceived == false{
            if isFromView == true{
                
                mCstntAutoHgt.constant = 0
            }
            else{
                mTableVw.isHidden = true
                
                mDetourVw.isHidden = true
                mAutoVw.isHidden = true
                mProfileVw.isHidden = true
                mCstntAutoHgt.constant = 0
                mCstntDetourHgt.constant = 0
                mCnstntProfileVwHgt.constant = 114
                putData()
                view.layoutIfNeeded()
            }
            mPendingLbl.isHidden = true
            
        }else{
            mTableVw.isHidden = true
            mPendingLbl.isHidden = false
            mDetourVw.isHidden = true
            mAutoVw.isHidden = true
            mProfileVw.isHidden = false
            mCstntAutoHgt.constant = 0
            mCstntDetourHgt.constant = 0
            mCnstntProfileVwHgt.constant = 114
            putData()
            view.layoutIfNeeded()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = true
       
    }
    
    func cancelRideApiApi(action : String ){
       Indicator.sharedInstance.showIndicator()
        UserVM.sheard.cancelRide(user_id: userID, ride_id: rideId, book_id: bookid, action: action, book_reason_text: "", comment: "", currentTime: "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    
                self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }    }
    }

    func endDrive()
    {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.completeDriver(user_id: userID, ride_id: rideId) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    
                    UserDefaults.standard.removeObject(forKey: "rideID")
                    UserDefaults.standard.removeObject(forKey: "bookID")
                    self.navigationController?.popViewController(animated: true)
                self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }    }
    }
    
    
    @IBAction func mCancelBtnAct(_ sender: UIButton) {
        
        if (sender.titleLabel?.text == "End Ride" && isReceived == true)
        {
            self.cancelRideApiApi(action: "4")
        }
           else if (sender.titleLabel?.text == "End Ride" && isReceived == false)
            {
                self.endDrive()
            }
        else if (sender.titleLabel?.text == "Cancel Ride".uppercased())
        {
            
            let story = self.storyboard?.instantiateViewController(withIdentifier:"cancelRideVC") as! cancelRideVC
            if bookid == ""
            {
                story.reason = "driverdelete"

            }
            else
            {
                story.reason = "usercancel"

            }
            story.rideId = rideId
            story.bookid = bookid
            story.id = userID
            story.cancelRide = true
            self.navigationController?.pushViewController(story, animated: true)

        }
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
                        self.mCarNameLbl.text = "\(String(describing: res?["car_name"] as? String) ) - \(String(describing: res?["car_model"] as? String) ?? ""))"
                    }
                    
                    
                    self.rideDetailDict = RideDetail.init(dictionary: res as! NSDictionary)
                    self.mTableVw.reloadData()
                    if self.isReceived == false{
                    if UserVM.sheard.bookRideDetails.count != 0{
                        if UserVM.sheard.bookRideDetails[0].book.count != 0{
                            // tableHgt 145
                           let count = UserVM.sheard.bookRideDetails[0].book.count
                           let tableHgt = count * 195
                            if self.isFromView == false{
                             self.mCstntScrolVwHgt.constant = CGFloat(tableHgt + 750)
                                 self.fromApiData()
                            }else{
                            self.mCstntScrolVwHgt.constant = CGFloat(tableHgt + 900)
                                 self.fromApiData()
                            }
                            self.mCstntTblHgt.constant = CGFloat(tableHgt) + 50
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
extension OfferedRideDetailsVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserVM.sheard.bookRideDetails.count != 0{
            if UserVM.sheard.bookRideDetails[0].book.count != 0{
                mBookingReqLbl.isHidden = false
                return UserVM.sheard.bookRideDetails[0].book.count
            }else{
                mBookingReqLbl.isHidden = true
                return 0}
        }else{
            mBookingReqLbl.isHidden = true
            return 0
            
        }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     tableView.register(UINib.init(nibName: "offerSelectMangeRideCell", bundle: nil), forCellReuseIdentifier: "offerSelectMangeRideCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "offerSelectMangeRideCell") as! offerSelectMangeRideCell
        let url = UserVM.sheard.bookRideDetails[0].book[indexPath.row].pic
        cell.userImg.sd_setImage(with: URL(string: url!), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
        cell.userName.text = UserVM.sheard.bookRideDetails[0].book[indexPath.row].firstname
        cell.bioLbl.text = UserVM.sheard.bookRideDetails[0].book[indexPath.row].bio
        cell.picAddress.text = UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_from_address
        cell.dropAddress.text = UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_to_address
        cell.seat.text = UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_seat
        cell.priceLbl.text = "$\(UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_amount!)"
        cell.ratingView.rating = Double(UserVM.sheard.bookRideDetails[0].book[indexPath.row].rating) ?? 0.0
        cell.acceptBtn.isHidden = false
            cell.rejactBtn.isHidden = false
           // cell.requestResponseLbl.isHidden = true
        
        
        //   if  UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_s
        
        cell.acceptBtn.tag = indexPath.row //+ 5000
        cell.rejactBtn.tag = indexPath.row // + 6000
        cell.acceptBtn.addTarget(self, action: #selector(self.acceptBtnActn(_:)), for: .touchUpInside)
        cell.rejactBtn.addTarget(self, action: #selector(self.rejectBtnActn(_:)), for: .touchUpInside)
        
        let bookStatus = UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_status
        

        
        if bookStatus  ==  "2" && isReceived == true{
            
            cell.acceptBtn.isHidden = true
            cell.rejactBtn.isHidden = false
            cell.rejactBtn.setTitle("Rejected", for: .normal)
//              cell.requestResponseLbl.isHidden = false
//              cell.requestResponseLbl.text = "Rejected"
//            cell.requestResponseLbl.textColor = .red
        }
            
             if (bookStatus != "4" && self.rideDetailDict?.ride_status == "1" && isReceived == true)
                  {
                      mBookingReqLbl.isHidden = true
                      cancelBtn.setTitle("End Ride", for: .normal)
                      otpView.isHidden = true
                      rideStatusView.isHidden = false
                      
                      mPendingLbl.text = "Your ride has been started"
                  }
                else
             {

                if (bookStatus !=  "4" && isReceived == false && self.rideDetailDict?.ride_status == "1"  )
                {
                    cell.acceptBtn.isHidden = false
                    cell.rejactBtn.isHidden = false
                    cell.acceptBtn.setTitle("Chat Rider", for: .normal)
                    cell.rejactBtn.setTitle("Ride Started", for: .normal)
                    cancelBtn.setTitle("End Ride", for: .normal)

                }
                
               else if (bookStatus  ==  "1" && isReceived == false)
                {
                    cell.acceptBtn.isHidden = false
                    cell.rejactBtn.isHidden = false

                    cell.acceptBtn.setTitle("Chat Rider", for: .normal)
                    cell.rejactBtn.setTitle("Start Ride", for: .normal)
                    
//                                    cell.requestResponseLbl.text = "Accepted"
//                                    cell.requestResponseLbl.textColor = .green
                }
       else  if (bookStatus  ==  "1" && isReceived == true)
         {
            otpView.isHidden = false
mBookingReqLbl.isHidden = true
            cell.requestResponseLbl.isHidden = false
            self.otpLbl.isHidden = false
            self.rideAprrovedLbl.isHidden = false
            self.otpLbl.text =  "OTP:- " + (UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_code ?? "")
            
            cell.requestResponseLbl.text = "Share OTP with driver"

            
        }
      else if (bookStatus  ==  "0" && isReceived == true){
            
          mBookingReqLbl.isHidden = true
          rideStatusView.isHidden = false
      }
            else if (bookStatus == "4" && isReceived == true)
            {
                
                mBookingReqLbl.isHidden = true
                rideStatusView.isHidden = false
                cancelBtn.setTitle("Give Feedback", for: .normal)
                mPendingLbl.text = "Your ride has been completed by you"
            }
        else if( bookStatus  ==  "3" && isReceived == false){
            mPendingLbl.isHidden = false
            mPendingLbl.text = "Your ride is rejected by owner"
              cell.acceptBtn.isHidden = true
              // cell.rejactBtn.isHidden = true
            cell.rejactBtn.isHidden = false
            cell.rejactBtn.setTitle("Rejected", for: .normal)
           // cell.acceptBtn.isHidden = true
//                        cell.requestResponseLbl.isHidden = false
//                        cell.requestResponseLbl.text = "Rejected"
//                        cell.requestResponseLbl.textColor = .red
        }
        }
                
    
        
        return cell
    }
    
    
    @objc func acceptBtnActn(_ sender: UIButton){
        let index = sender.tag
        selectIndex = index
        if  UserVM.sheard.bookRideDetails[0].book[index].book_status == "1"{
           
            var largest : Int
            var smallest : Int
            let rideDetail_id = Int(UserVM.sheard.bookRideDetails[0].book[index].id) ?? 0
            let bookDetail_id = Int(UserVM.sheard.bookRideDetails[0].ride.ride_user) ?? 0
            let booking_id =  Int(UserVM.sheard.bookRideDetails[0].book[index].book_id) ?? 0
            
            largest = rideDetail_id > bookDetail_id ? rideDetail_id : bookDetail_id
                smallest = rideDetail_id < bookDetail_id ? rideDetail_id : bookDetail_id
            let largestString = String(largest)
            let smallestString = String(smallest)
            let bookString = String(booking_id)
            let value = largestString + smallestString + bookString
            print(value)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChatingVCID")as! ChatingVC
            bookDict = UserVM.sheard.bookRideDetails[0].book[index]
            vc.otherUserId = bookDict.id
            vc.messageNode = String(value)
            vc.otherUserName = bookDict.firstname
            vc.otherUserImage = bookDict.pic
           
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            
            acceptRejectRideApi(actionType : "1")

        }
        
//        cell.acceptBtn.isHidden = true
//        cell.rejactBtn.isHidden = true
//        cell.requestResponseLbl.text = "Accepted"
//        cell.requestResponseLbl.textColor = UIColor.green
//        cell.requestResponseLbl.isHidden = false
//       acceptRejectRideApi(actionType : "1")
        
      
        
    }
    
    @objc func rejectBtnActn(_ sender: UIButton){
        let index = sender.tag
        //     let cell = selectRideTable.dequeueReusableCell(withIdentifier: "offerSelectMangeRideCell", for: index) as! offerSelectMangeRideCell
        let cell = self.mTableVw.cellForRow(at: IndexPath(row: index, section: 0)) as! offerSelectMangeRideCell
        selectIndex = index
        let bookStatus = UserVM.sheard.bookRideDetails[0].book[selectIndex].book_status
         if (bookStatus  ==  "1" && isReceived == false){
            cell.acceptBtn.setTitle("Chat Rider", for: .normal)
            cell.rejactBtn.setTitle("Start Ride", for: .normal)
            let bookid = UserVM.sheard.bookRideDetails[0].book[selectIndex].book_id ?? ""
         let story = self.storyboard?.instantiateViewController(withIdentifier:"StartOTPVC") as! StartOTPVC
            story.rideId = rideId
            story.bookId = bookid
            self.navigationController?.pushViewController(story, animated: true)

         }else{
        cell.acceptBtn.isHidden = true
        cell.rejactBtn.isHidden = false
        cell.requestResponseLbl.text = "Rejected"
//        cell.requestResponseLbl.textColor = UIColor.red
//        cell.requestResponseLbl.isHidden = false
        acceptRejectRideApi(actionType : "3")
        //    checkRide(actionType: "1")
        }
    }
    func acceptRejectRideApi(actionType : String){
        Indicator.sharedInstance.showIndicator()
        let bookid = UserVM.sheard.bookRideDetails[0].book[selectIndex].book_id ?? ""
        let rideid = UserVM.sheard.bookRideDetails[0].ride.ride_id ?? ""

        UserVM.sheard.cancelRide(user_id: userID, ride_id: rideId, book_id: bookid, action: actionType, book_reason_text: "", comment: "", currentTime: "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    let bookStatus = UserVM.sheard.bookRideDetails[0].book[self.selectIndex].book_status
                    if (bookStatus  ==  "1"){
                        
                    }
                        else if (bookStatus == "0")
                        {
                            let rideId = rideid
                            let bookId = bookid
                            UserDefaults.standard.set(rideId, forKey: "rideID")
                            UserDefaults.standard.set(bookId, forKey: "bookID")

                        }
                    else if (bookStatus == "4")
                    {
                        let rideId = rideid
                        let bookId = bookid
                        UserDefaults.standard.set(rideId, forKey: "rideID")
                        UserDefaults.standard.set(bookId, forKey: "bookID")

                    }
                        
                    else{
                        
                        self.createRelation()
                  
                    }
                 //   self.showAlert(message: message)
                }else{
                    //self.showAlert(message: message)
                }
            }else{
                //self.showAlert(message: error?.domain)
            }    }
    }
    func checkRide(actionType : String){
        Indicator.sharedInstance.showIndicator()
        let bookid = UserVM.sheard.bookRideDetails[0].book[selectIndex].book_id ?? ""
        let dateCur = Date().dateToUTCString
        let time = dateCur.utcStringToFullDate
        UserVM.sheard.CheckRide(user_id: userID, ride_id: rideId, book_id: bookid, action: actionType, currentTime: time, comment: "", book_code: "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                   
                    //   self.showAlert(message: message)
                }else{
                    NotificationAlert().NotificationAlert(titles: message!)

                }
            }else{
                //self.showAlert(message: error?.domain)
            }    }
    }
    func createRelation(){
        var bothID = [String]()
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
        
        self.ref = Database.database().reference()
       
        bothID.append(userID)
//        bothID.append(bookDict.book_user)
        
        let sortedValues = bothID.sorted { (value1, value2) in
            let order = value1.compare(value2, options: .numeric)
            return order == .orderedDescending
        }
        print(sortedValues)
        let idNodes = sortedValues.joined(separator: "")
        let idWithComma = bothID.joined(separator: ",")
        print(idNodes)
        let chatHistory = self.ref.child("ChatHistory")
        let bothIds = chatHistory.child(idNodes)
        let unreadNode = bothIds.child("unread_message")
        
        let userData = bothIds.child("user_data")
        
        let unreadCountId1: Dictionary<String, Any> = ["unread_message_count":"","userid":userID]
        let unreadCountId2: Dictionary<String, Any> = ["unread_message_count":"","userid":bookDict.book_user ?? ""]
      
        let userData1: Dictionary<String, Any> = ["user_image":"test1","user_name":"user1","userid":userID]
        let userData2: Dictionary<String, Any> = ["user_image":"","user_name":"user2","userid":bookDict.book_user!]
        
        let dict: NSDictionary = ["createTime": "\(ServerValue.timestamp())",
                                             "id": idNodes,
                                             "image":"",
                                             "last_message":"",
                                             "last_message_timeStamp":"\(ServerValue.timestamp())",
                                             "last_message_user_id":userID,
                                             "name": "","occupant_id": idWithComma,"type":""
        ]

        bothIds.setValue(dict)
        var unreadArray = [Dictionary<String, Any>?]()
        unreadArray.append(unreadCountId1)
        unreadArray.append(unreadCountId2)
        unreadNode.setValue(unreadArray)
        
        var userArray = [Dictionary<String, Any>?]()
        userArray.append(userData1)
        userArray.append(userData2)
        userData.setValue(userArray)
    }
    
}
public extension Date{
    
    //MARK:StringToDate Extensions
    var dateToUTCString:String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone.current
        let utcString = dateFormatter.string(from: self)
        return utcString
    }
   
    //MARK:StringfyDate
    var stringfromDateType: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateString = dateFormatter.string(from: self as Date)
        return dateString
    }
    
    var dateToSmartDate:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "d MMMM, yyyy"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
    var dateToDay:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "d"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
    var dateToMonth:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
    var dateToYear:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
    
    
    var dateToSmartTime:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
    
    var dateToHour:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "h"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
    var dateToMinute:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "mm"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
    
    var dateToAmPm:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "a"
        let localDateTimeString = dateFormatter.string(from: self)
        return localDateTimeString
    }
    
  
    
}
public extension String{

    var utcStringToFullDate:String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        print(date!)
        let timeZone = TimeZone.autoupdatingCurrent.identifier as String
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm a"
        let dayName = dateFormatter.string(from: date!)
        
        return(dayName)
        
    }
}
