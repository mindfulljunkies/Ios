//
//  selectFindRideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 18/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView

class selectFindRideVC: UIViewController {
   
    @IBOutlet weak var mTimeLbl: UILabel!
    @IBOutlet weak var mCarColorLbl: UILabel!
    @IBOutlet weak var mMinilbl4: UILabel!
    @IBOutlet weak var mMinilbl3: UILabel!
    @IBOutlet weak var mMinibl1: UILabel!
    @IBOutlet weak var mMinilbl2: UILabel!
    @IBOutlet weak var mAddressLbl1: UILabel!
    @IBOutlet weak var mAddressLbl2: UILabel!
    @IBOutlet weak var mAddressLbl3: UILabel!
    @IBOutlet weak var mAddressLbl4: UILabel!
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var picLbl: UILabel!
    @IBOutlet var dropLbl: UILabel!
    @IBOutlet var seatsLbl: UILabel!
    @IBOutlet var carTypeLbl: UILabel!
    @IBOutlet var chatBtn: UIButton!
    @IBOutlet var continueBtn: UIButton!
    @IBOutlet var ratingView: FloatRatingView!
    @IBOutlet var carDataSet: UILabel!
    @IBOutlet weak var round2: UILabel!
    @IBOutlet weak var round3: UILabel!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    var indexValue = Int()
    var seatAbility = ""
 
    var rideFromAdd = String()
    var rideFromLat = String()
    var rideFromLong = String()
    var rideToAdd = String()
    var rideToLat = String()
    var rideToLong = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userImg.layer.cornerRadius = userImg.frame.height/2
        userImg.clipsToBounds = true
      //  chatBtn.setButtonBorder()
        continueBtn.setButtonBorder()
        
        if UserVM.sheard.allRideDetails[indexValue].is_already_booked == 1{
            continueBtn.isHidden = true
        }else{
             continueBtn.isHidden = false
        }
        
        let url = UserVM.sheard.allRideDetails[indexValue].pic
        userImg.sd_setImage(with: URL(string: url!), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
        userName.text = UserVM.sheard.allRideDetails[indexValue].firstname
        dateLbl.text = UserVM.sheard.allRideDetails[indexValue].ride_date
        
        priceLbl.text = "$ \(UserVM.sheard.allRideDetails[indexValue].ride_amount ?? 0)"
      //  picLbl.text = UserVM.sheard.allRideDetails[indexValue].ride_from_address
      //  dropLbl.text = UserVM.sheard.allRideDetails[indexValue].ride_to_address
        seatsLbl.text = String(UserVM.sheard.allRideDetails[indexValue].ride_seat!)
        //carTypeLbl.text = UserVM.sheard.allRideDetails[indexValue].carmaker
        
        ratingView.rating = Double(UserVM.sheard.allRideDetails[indexValue].rating) ?? 0.0
        if UserVM.sheard.allRideDetails[indexValue].ride_from_address != ""{
            self.mAddressLbl1.text = UserVM.sheard.allRideDetails[indexValue].ride_from_address!
        }
        if UserVM.sheard.allRideDetails[indexValue].ride_from_address2 != ""{
            self.mAddressLbl2.text = UserVM.sheard.allRideDetails[indexValue].ride_from_address2
            self.lbl2HEight.constant = 14.0
            self.mAddressLbl2.isHidden = false
            self.img1.isHidden = false
            self.lbl2top.constant = 24.0
        }else{
            self.lbl2HEight.constant = 0.0
            self.mAddressLbl2.isHidden = true
            self.img1.isHidden = true
            self.lbl2top.constant = 0.0
        }
        if UserVM.sheard.allRideDetails[indexValue].ride_from_address3 != ""{
            self.mAddressLbl3.text = UserVM.sheard.allRideDetails[indexValue].ride_from_address3!
            self.lbl3Height.constant = 20.0
            self.mAddressLbl3.isHidden = false
            self.img2.isHidden = false
            self.lbl3top.constant = 30.0
        }else{
            self.lbl3Height.constant = 0.0
            self.mAddressLbl3.isHidden = true
            self.img2.isHidden = true
            self.lbl3top.constant = 0.0
        }
        if UserVM.sheard.allRideDetails[indexValue].ride_to_address != ""{
            self.mAddressLbl4.text = UserVM.sheard.allRideDetails[indexValue].ride_to_address
        }
        
        if UserVM.sheard.allRideDetails[indexValue].pickup_distance != ""{
            self.mMinibl1.text = "\(UserVM.sheard.allRideDetails[indexValue].pickup_distance ?? "") Miles from your departure"         }
        if UserVM.sheard.allRideDetails[indexValue].dropup_distance != ""{
            self.mMinilbl4.text = "\(UserVM.sheard.allRideDetails[indexValue].dropup_distance ?? "") Miles from your arrival"
        }
//        if UserVM.sheard.allRideDetails[indexValue].ride_date != ""{
//            self.dateLbl.text = UserVM.sheard.allRideDetails[indexValue].ride_date.getCurrentShortDate()
//        }
        if UserVM.sheard.allRideDetails[indexValue].ride_time != ""{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            
            let date = dateFormatter.date(from: UserVM.sheard.allRideDetails[indexValue].ride_time!)
            dateFormatter.dateFormat = "h:mm a"
            let Date12 = dateFormatter.string(from: date!)
            self.mTimeLbl.text = "\(Date12 ?? "")"
        }
        if UserVM.sheard.allRideDetails[indexValue].ride_seat != nil{
            self.seatsLbl.text = "\(UserVM.sheard.allRideDetails[indexValue].ride_seat ?? 0)"
        }
      
        if UserVM.sheard.allRideDetails[indexValue].car_color != nil{
            self.mCarColorLbl.text = UserVM.sheard.allRideDetails[indexValue].car_color
        }
        if UserVM.sheard.allRideDetails[indexValue].car_type != nil{
            self.carTypeLbl.text = "\(UserVM.sheard.allRideDetails[indexValue].car_name ?? "") - \(UserVM.sheard.allRideDetails[indexValue].car_model ?? "")"
        }
    }
    @IBOutlet weak var lbl2HEight: NSLayoutConstraint!
    @IBOutlet weak var lbl3Height: NSLayoutConstraint!
    @IBOutlet weak var lbl2top: NSLayoutConstraint!
    @IBOutlet weak var lbl3top: NSLayoutConstraint!
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func chatBtnAtn(_ sender: Any) {
    }
    @IBAction func continueBtnAtn(_ sender: Any) {
        
        if  UserVM.sheard.allRideDetails[indexValue].is_seats_available == 0{
            let alert = UIAlertController(title: "", message: "No seat available", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            let story = self.storyboard?.instantiateViewController(withIdentifier: "bookRideVC") as! bookRideVC
                   story.seats = UserVM.sheard.allRideDetails[indexValue].ride_seat!
                   story.index = indexValue
            
            story.rideFromAdd = rideFromAdd
            story.rideFromLat = rideFromLat
            
            story.rideFromLong = rideFromLong
            story.rideToAdd = rideToAdd
            story.rideToLat = rideToLat
            story.rideToLong = rideToLong
                   story.avilableSeatCount = String(UserVM.sheard.allRideDetails[indexValue].ride_seat!)
                   
                   
                   print(UserVM.sheard.allRideDetails[indexValue])
                   self.navigationController?.pushViewController(story, animated: true)
        }
       
    }
    @IBAction func contectBtnAtn(_ sender: Any) {
    }
    
}
