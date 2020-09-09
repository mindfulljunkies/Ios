//
//  allRides.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 17/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import SDWebImage

class allRides: UIViewController {
    @IBOutlet var topLbl: UILabel!
    @IBOutlet var bottomLbl: UILabel!
    @IBOutlet var datelbl: UILabel!
    @IBOutlet var allRideTable: UITableView!
    
   var rideFromAdd = String()
   var rideFromLat = String()
   var rideFromLong = String()
   var rideToAdd = String()
   var rideToLat = String()
    var rideToLong = String()
   var ridedate = String()
    
    var isFromLocalRide = false
    
    
    var topvalue : String?
    var bottomValue:String?
    var date : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        topLbl.text = topvalue
        bottomLbl.text = bottomValue ?? ""
      datelbl.text =  datelbl.text?.getCurrentShortDate()
        if isFromLocalRide == false{
            
        }else{
            self.findRide()
        }
        
    }
    
    
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension allRides: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(UserVM.sheard.allRideDetails.count)
        return UserVM.sheard.allRideDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView.register(UINib.init(nibName: "givenSelectCellFile", bundle: nil), forCellReuseIdentifier: "givenSelectCellFile")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageTableViewCellID") as! ManageTableViewCell
        let manageDict = UserVM.sheard.allRideDetails[indexPath.row]
        
            cell.nameLbl.text! = manageDict.firstname!
            cell.picLbl.text = manageDict.ride_from_address
            cell.dropLbl.text = manageDict.ride_to_address
        cell.dateLbl.text =  manageDict.ride_date?.convertDateFormatMy(inputDate: manageDict.ride_date ?? "")
            let times = manageDict.ride_time
            cell.timeLbl.text = timeConversion12(time24: times ?? "")
            
            cell.priceLbl.text = "$\(manageDict.ride_amount!)"
        
      //  cell.mRatingVw.rating = Double(manageDict.rating) as? Double ?? 0.0
        if manageDict.ride_from_address2 != ""{
            cell.mLblExpand.text = manageDict.ride_from_address2 ?? ""
            cell.stop1Location.isHidden = false
 
        }else{
          cell.stop1Location.isHidden = true
            view.layoutIfNeeded()
        }
        if manageDict.ride_from_address3 != ""{
            cell.mExpandLbl2.text = manageDict.ride_from_address3 ?? ""
            cell.stop2Location.isHidden = false
        }else{
cell.stop2Location.isHidden = true
            view.layoutIfNeeded()
        }
        
     
        let pic = manageDict.pic ?? ""
        cell.cellImg.sd_setImage(with: URL(string: pic), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "selectFindRideVC") as! selectFindRideVC
        story.indexValue = indexPath.row
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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
extension allRides{
    func findRide() {
        
        UserVM.sheard.allRideDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.findRide(userid: userID, from_address: rideFromAdd, to_address: rideToAdd, from_lat: rideFromLat, from_long: rideFromLong, to_lat: rideToLat, to_long: rideToLong, date: ridedate, price: "ASC", is_local_ride: "1") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    print(UserVM.sheard.allRideDetails)
                    self.allRideTable.reloadData()
//                    let story = self.storyboard?.instantiateViewController(withIdentifier:"allRides") as! allRides
//                    story.topvalue = "\(fromAdd) to \(toAdd)"
//                    story.date = self.dateTF.text!
//                    self.navigationController?.pushViewController(story, animated: true)
                }else{
//                    self.showAlert(message: message)
                }
            }else{
//                self.showAlert(message: error?.domain)
            }
        }
    }
}
