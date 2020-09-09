//
//  RideHistoryVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 05/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class RideHistoryVC: BaseVC {
    @IBOutlet var recivedBtn: UIButton!
    @IBOutlet var offeredBtn: UIButton!
    @IBOutlet var historyTblView: UITableView!
    @IBOutlet var switchView: UIView!
    var buttonValue = 1
   
    override func viewDidLoad() {
        super.viewDidLoad()
        switchView.setShadow()
        switchView.layer.cornerRadius = switchView.frame.height/2
        historyLIst()
        recivedBtn.backgroundColor = .black
        recivedBtn.setTitleColor(.white, for: .normal)
        recivedBtn.layer.cornerRadius = offeredBtn.frame.height/2
        offeredBtn.layer.cornerRadius = offeredBtn.frame.height/2
        offeredBtn.clipsToBounds = true
        offeredBtn.clipsToBounds = true
        buttonValue = 1
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func offerBtnActn(_ sender: Any) {
        recivedBtn.backgroundColor = .white
        recivedBtn.setTitleColor(.black, for: .normal)
        offeredBtn.backgroundColor = .black
        offeredBtn.setTitleColor(.white, for: .normal)
        buttonValue = 2
        historyTblView.reloadData()
    }
    @IBAction func recivedBtn(_ sender: Any) {
        recivedBtn.backgroundColor = .black
        recivedBtn.setTitleColor(.white, for: .normal)
        offeredBtn.backgroundColor = .white
        offeredBtn.setTitleColor(.black, for: .normal)
        buttonValue = 1
        historyTblView.reloadData()
    }
    
}

//MARK:- Tableview Methods

extension RideHistoryVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserVM.sheard.allRidesDetails.count != 0{
            if buttonValue == 1{
                return UserVM.sheard.allRidesDetails[0].bookedRide.count
            }else{
                return UserVM.sheard.allRidesDetails[0].offerRide.count
            }
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if UserVM.sheard.allRidesDetails.count != 0{
            if buttonValue == 1{
                tableView.register(UINib.init(nibName: "receiveCellFile", bundle: nil), forCellReuseIdentifier: "receiveCellFile")
                let cell = tableView.dequeueReusableCell(withIdentifier: "receiveCellFile") as! receiveCellFile
                cell.selectionStyle = .none
                let url = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].pic
                cell.cellImg.sd_setImage(with: URL(string: url!), placeholderImage: #imageLiteral(resourceName: "userpaceholder"))
                cell.nameLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].firstname
                cell.picLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_from_address
                cell.dropLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_to_address
                cell.dateLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_date
                cell.timeLbl.text = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_time
                cell.priceLbl.text = "$\(UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].ride_amount!)"
                return cell
            }else{
                
                if UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].detour == "1"{
                    tableView.register(UINib.init(nibName: "givenCellFile", bundle: nil), forCellReuseIdentifier: "givenCellFile")
                    let cell = tableView.dequeueReusableCell(withIdentifier: "givenCellFile") as! givenCellFile
                    cell.selectionStyle = .none

                    cell.nameLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].firstname
                    cell.picLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_from_address
                    cell.dropLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_to_address
                    cell.dateLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_date
                    cell.timeLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_time
                    cell.priceLbl.text = "$\(UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_amount!)"
                    return cell
                }else{
                    tableView.register(UINib.init(nibName: "offerRedManageTableCell", bundle: nil), forCellReuseIdentifier: "offerRedManageTableCell")
                    let cell = tableView.dequeueReusableCell(withIdentifier: "offerRedManageTableCell") as! offerRedManageTableCell
                    
                    cell.selectionStyle = .none
                    cell.nameLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].firstname
                    cell.picLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_from_address
                    if(UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].is_local_ride == "1")
                    {
                        cell.localRideLbl.text = "LOCAL RIDE"

                    }
                    else
                    {
                        cell.localRideLbl.text = ""
                    }
                    cell.dropLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_to_address
                    cell.dateLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_date
                    cell.timeLbl.text = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_time
                    cell.priceLbl.text = "$\(UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_amount!)"
                  
                    
                    return cell
                }
            }
        }else{
            tableView.register(UINib.init(nibName: "receiveCellFile", bundle: nil), forCellReuseIdentifier: "receiveCellFile")
            let cell = tableView.dequeueReusableCell(withIdentifier: "receiveCellFile") as! receiveCellFile
            return cell
        }
        
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if buttonValue == 1{
//            let story = self.storyboard?.instantiateViewController(withIdentifier: "SelectLocalRideVC") as! SelectLocalRideVC
//            story.selectIndex = indexPath.row
//            
//            // let p = UserVM.sheard.allRidesDetails[0].bookedRide[indexPath.row].
//            self.navigationController?.pushViewController(story, animated: true)
//        }else{
//            let story = self.storyboard?.instantiateViewController(withIdentifier: "givenSelectedRideVC") as! givenSelectedRideVC
//            story.selectIndex = indexPath.row
//            story.rideId = UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].ride_id
//            //  let v =  UserVM.sheard.allRidesDetails[0].offerRide[indexPath.row].
//            self.navigationController?.pushViewController(story, animated: true)
//        }
//    }
}

//MARK: - API Methods
extension RideHistoryVC{
    func historyLIst(){
        UserVM.sheard.allRidesDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.rideHistory(user_id: userID) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.historyTblView.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}
