//
//  SelectLocalRideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 14/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView

class SelectLocalRideVC: BaseVC {
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userNameLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var picAddress: UILabel!
    @IBOutlet var dropAddress: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var seatLbl: UILabel!
    @IBOutlet var startBtn: UIButton!
    @IBOutlet var cancelRideBtn: UIButton!
    @IBOutlet var backView: UIView!
    @IBOutlet var ratingView: FloatRatingView!
    @IBOutlet var headerTxt: UILabel!
    @IBOutlet var rideApproveTXtLbl: UILabel!
    
    var selectIndex = Int()
    var rideid = String()
    var bookid = String()
    var cancelReason = ""
    var islocal = ""
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        if islocal == "1"{
            headerTxt.text = "Local Ride Details"
        }
        else {
            headerTxt.text = " Ride Details"
        }
        
      userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
       backView.setShadow()
        startBtn.layer.cornerRadius = startBtn.frame.height/2
        startBtn.clipsToBounds = true
        
        cancelRideBtn.setButtonBorder()
        
        backView.layer.cornerRadius = 12
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize.zero
        backView.layer.shadowRadius = 5
        
        
        if UserVM.sheard.allRidesDetails.count != 0{
            let url = UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].pic
            userImage.sd_setImage(with: URL(string: url!), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
            userNameLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].firstname
            picAddress.text = UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].ride_from_address
            dropAddress.text = UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].ride_to_address
            dateLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].ride_date
            timeLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].ride_time
            seatLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].ride_seat!
            priceLbl.text = "$\(UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].ride_amount!)"
            ratingView.rating = Double(UserVM.sheard.allRidesDetails[0].bookedRide[selectIndex].rating) ?? 0.0
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        allRides()
        if bookid == "1"{
            if UserVM.sheard.allRidesDetails.count != 0{
                if UserVM.sheard.allRidesDetails[0].bookedRide.count != 0{
                    selectIndex = UserVM.sheard.allRidesDetails[0].bookedRide.count - 1
                }else{
                    selectIndex = 0
                }
            }
         }
    }
    
    @IBAction func startRideBtnAtn(_ sender: Any) {
    }
    
    @IBAction func cancelRideBtnAtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "cancelRideVC") as! cancelRideVC
        let book_id = UserVM.sheard.allRidesDetails.first?.bookedRide[selectIndex].book_id
        let ride_id =  UserVM.sheard.allRidesDetails.first?.bookedRide[selectIndex].ride_id
        story.bookid = book_id ?? ""
        story.rideId = ride_id ?? ""
        story.reason = cancelReason
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - API Methods
extension SelectLocalRideVC{
    
    func rideDetails() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.bookRideDetailData(user_id: userID, ride_id: rideid, book_id: bookid) { (success, response,message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.viewDidLoad()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
        }
  
        func allRides(){
            UserVM.sheard.allRidesDetails.removeAll()
            Indicator.sharedInstance.showIndicator()
            UserVM.sheard.manageRide(userid: userID) { (success,response, message, error) in
                if error == nil{
                    Indicator.sharedInstance.hideIndicator()
                    if success{
                        self.viewDidLoad()
                    }else{
                        self.showAlert(message: message)
                    }
                }else{
                    self.showAlert(message: error?.domain)
                }
            }
        }

  }
