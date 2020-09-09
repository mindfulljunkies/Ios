//
//  bookedRideDetailVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 26/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView

class bookedRideDetailVC: BaseVC {
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var picLbl: UILabel!
    @IBOutlet var dropLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var seatLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var backView: UIView!
    @IBOutlet var ratingView: FloatRatingView!
    
    
    var rideid = String()
    var bookid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImg.layer.cornerRadius = userImg.frame.height/2
        userImg.clipsToBounds = true
        backView.setShadow()
        cancelBtn.setButtonBorder()
        backView.layer.cornerRadius = 12
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize.zero
        backView.layer.shadowRadius = 5
     }
    override func viewDidAppear(_ animated: Bool) {
        rideDetails()
    }
   
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelRideBtnAtn(_ sender: Any) {
    }
}

//MARK: - API Methods
extension bookedRideDetailVC{
    func rideDetails() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.bookRideDetails.removeAll()
        UserVM.sheard.bookRideDetailData(user_id: userID, ride_id: rideid, book_id: bookid) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    if   UserVM.sheard.bookRideDetails.count != 0 {
                        let url = UserVM.sheard.bookRideDetails[0].book[0].pic
                        if url != nil {
                            self.userImg.sd_setImage(with: URL(string: url!), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
                        }
                        let fullName = UserVM.sheard.bookRideDetails[0].book[0].book_date!
                        let dateValue = fullName.components(separatedBy: " ")
                        print(dateValue)
                        self.userName.text = UserVM.sheard.bookRideDetails[0].book[0].firstname
                        self.picLbl.text = UserVM.sheard.bookRideDetails[0].book[0].book_from_address
                        self.dropLbl.text = UserVM.sheard.bookRideDetails[0].book[0].book_to_address
                        self.dateLbl.text = UserVM.sheard.bookRideDetails[0].book[0].book_date
                        //            timeLbl.text = UserVM.sheard.bookRideDetails[0].book[0].
                        self.seatLbl.text = UserVM.sheard.bookRideDetails[0].book[0].book_seat
                        self.priceLbl.text = "$\(UserVM.sheard.bookRideDetails[0].book[0].book_amount!)"
                        self.ratingView.rating = Double(UserVM.sheard.bookRideDetails[0].book[0].rating) ?? 0.0
                    }
                  
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}
