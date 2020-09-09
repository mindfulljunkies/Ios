//
//  givenSelectedRideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 14/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class givenSelectedRideVC: BaseVC {
    @IBOutlet var bgView: UIView!
    @IBOutlet var UserNameLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var picAddress: UILabel!
    @IBOutlet var dropAddress: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var seatsLbl: UILabel!
    @IBOutlet var startRideBtn: UIButton!
    @IBOutlet var deleteRideBtn: UIButton!
    @IBOutlet var headerTxt: UILabel!
    
    @IBOutlet var selectRideTable: UITableView!
    
    var rideId = String()
    var selectIndex = Int()
    var bookid = ""
    var islocal = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if islocal == "1"{
            headerTxt.text = "Local Ride Details"
        }
        else {
            headerTxt.text = "Ride Details"
        }
        
        
        bgView.layer.cornerRadius = 12
        bgView.layer.shadowColor = UIColor.gray.cgColor
        bgView.layer.shadowOpacity = 0.5
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 5
        startRideBtn.setButtonBorder()
        deleteRideBtn.setButtonBorder()
        
            if UserVM.sheard.bookRideDetails.count != 0{
                UserNameLbl.text = UserVM.sheard.bookRideDetails[0].ride.firstname
                picAddress.text = UserVM.sheard.bookRideDetails[0].ride.ride_from_address
                dropAddress.text = UserVM.sheard.bookRideDetails[0].ride.ride_to_address
                dateLbl.text = UserVM.sheard.bookRideDetails[0].ride.ride_date
                timeLbl.text = UserVM.sheard.bookRideDetails[0].ride.ride_time
                seatsLbl.text = UserVM.sheard.bookRideDetails[0].ride.ride_seat
                priceLbl.text = "$\(UserVM.sheard.bookRideDetails[0].ride.ride_amount! ?? "" )"
            
            }
      
     }
    override func viewWillAppear(_ animated: Bool) {
        if rideId != ""{
            rideDetails()
        }
   }
    @IBAction func startRideBtnAtn(_ sender: Any) {
    }
    
    @IBAction func deleteRideBtAtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "cancelRideVC") as! cancelRideVC
      //  let book_id = UserVM.sheard.allRidesDetails.first?.bookedRide[0].book_id
     //    let ride_id =  UserVM.sheard.allRidesDetails.first?.bookedRide[0].ride_id
        story.rideId = rideId
        story.bookid = bookid
        story.reason = "driverdelete"
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true
        )
    }
}

//MARK: Table Methods
extension givenSelectedRideVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserVM.sheard.bookRideDetails.count != 0{
            if UserVM.sheard.bookRideDetails[0].book.count != 0{
                return UserVM.sheard.bookRideDetails[0].book.count
            }else{return 0}
        }else{return 0}
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
        
        let bookStatus = UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_status
        if bookStatus  ==  "2"{
            cell.acceptBtn.isHidden = true
            cell.rejactBtn.isHidden = true
            cell.rejactBtn.setTitle("Rejected", for: .normal)
          //  cell.requestResponseLbl.isHidden = false
          //  cell.requestResponseLbl.text = "Rejected"
            cell.requestResponseLbl.textColor = .red
      }
        else if (bookStatus  ==  "1"){
           cell.acceptBtn.setTitle("Accepted", for: .normal)
            cell.rejactBtn.setTitle("Start Ride", for: .normal)
               //  cell.acceptBtn.isHidden = true
               // cell.rejactBtn.isHidden = true
             //   cell.requestResponseLbl.isHidden = false
//                cell.requestResponseLbl.text = "Accepted"
//                cell.requestResponseLbl.textColor = .green
      
        }
 
      else if( bookStatus  ==  "3"){
          //  cell.acceptBtn.isHidden = true
         //   cell.rejactBtn.isHidden = true
            cell.rejactBtn.isHidden = false
            cell.rejactBtn.setTitle("Cancel", for: .normal)
            cell.acceptBtn.isHidden = true
//            cell.requestResponseLbl.isHidden = false
//            cell.requestResponseLbl.text = "Rejected"
//            cell.requestResponseLbl.textColor = .red
        }
            
            
       else{
            cell.acceptBtn.isHidden = false
            cell.rejactBtn.isHidden = false
            cell.requestResponseLbl.isHidden = true
        }
        
     //   if  UserVM.sheard.bookRideDetails[0].book[indexPath.row].book_s
        
        cell.acceptBtn.tag = indexPath.row + 5000
        cell.rejactBtn.tag = indexPath.row + 6000
         cell.acceptBtn.addTarget(self, action: #selector(self.acceptBtnActn(_:)), for: .touchUpInside)
        cell.rejactBtn.addTarget(self, action: #selector(self.rejectBtnActn(_:)), for: .touchUpInside)
        
        
        return cell
    }
    
    @objc func acceptBtnActn(_ sender: UIButton){
        let index = sender.tag - 5000
        let cell = self.selectRideTable.cellForRow(at: IndexPath(row: index, section: 0)) as! offerSelectMangeRideCell
         selectIndex = index
        cell.acceptBtn.isHidden = true
        cell.rejactBtn.isHidden = true
        cell.requestResponseLbl.text = "Accepted"
        cell.requestResponseLbl.textColor = UIColor.green
        cell.requestResponseLbl.isHidden = false
        acceptRejectRideApi(actionType : "1")
        print(index)
    }
    
    @objc func rejectBtnActn(_ sender: UIButton){
      let index = sender.tag - 6000
    //     let cell = selectRideTable.dequeueReusableCell(withIdentifier: "offerSelectMangeRideCell", for: index) as! offerSelectMangeRideCell
          let cell = self.selectRideTable.cellForRow(at: IndexPath(row: index, section: 0)) as! offerSelectMangeRideCell
         selectIndex = index
         cell.acceptBtn.isHidden = true
        cell.rejactBtn.isHidden = true
        cell.requestResponseLbl.text = "Rejected"
        cell.requestResponseLbl.textColor = UIColor.red
        cell.requestResponseLbl.isHidden = false
          acceptRejectRideApi(actionType : "3")
        
    }
    
 }


//MARK: API Methods
extension givenSelectedRideVC{
//    func offerRideDetail() {
//        Indicator.sharedInstance.showIndicator()
//        UserVM.sheard.offerRideData(user_id: userID, ride_id: rideId) { (success, message, error) in
//            if error == nil{
//                Indicator.sharedInstance.hideIndicator()
//                if success{
//                    self.UserNameLbl.text = UserVM.sheard.selectRideDetails[0].firstname
//                    self.picAddress.text = UserVM.sheard.selectRideDetails[0].ride_from_address
//                    self.dropAddress.text = UserVM.sheard.selectRideDetails[0].ride_to_address
//                    self.dateLbl.text = UserVM.sheard.selectRideDetails[0].ride_date
//                    self.timeLbl.text = UserVM.sheard.selectRideDetails[0].ride_time
//                    self.seatsLbl.text = UserVM.sheard.selectRideDetails[0].ride_seat
//                    self.priceLbl.text = "$\(UserVM.sheard.selectRideDetails[0].ride_amount!)"
//                }else{
//                    self.showAlert(message: message)
//                }
//            }else{
    //      ,          self.showAlert(message: error?.domain)
//            }
//        }
//    }
    
    

        func rideDetails() {
            Indicator.sharedInstance.showIndicator()
            UserVM.sheard.bookRideDetails.removeAll()
            UserVM.sheard.bookRideDetailData(user_id: userID, ride_id: rideId, book_id: bookid) { (success,response, message, error) in
                if error == nil{
                    Indicator.sharedInstance.hideIndicator()
                    if success{
                        self.viewDidLoad()
                        self.selectRideTable.reloadData()
                    }else{
                        self.showAlert(message: message)
                    }
                }else{
                    self.showAlert(message: error?.domain)
                }
            }
        }
  
    func acceptRejectRideApi(actionType : String){
        Indicator.sharedInstance.showIndicator()
        let bookid = UserVM.sheard.bookRideDetails[0].book[selectIndex].book_id ?? ""
        UserVM.sheard.cancelRide(user_id: userID, ride_id: rideId, book_id: bookid, action: actionType, book_reason_text: "", comment: "", currentTime: "") { (success, message, error) in
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
    
    
    
    
}
