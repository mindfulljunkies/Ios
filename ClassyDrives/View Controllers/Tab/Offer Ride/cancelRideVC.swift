//
//  cancelRideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 28/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class cancelRideVC: BaseVC {
    
    @IBOutlet weak var refundView: UIView!
    @IBOutlet weak var topConst: NSLayoutConstraint!
    @IBOutlet weak var price: UILabel!
    @IBOutlet var reasonView: UIView!
    @IBOutlet var reasonTf: UITextField!
    @IBOutlet var detailView: UITextView!
    @IBOutlet var sendBtn: UIButton!
    @IBOutlet var detail: UIView!
    @IBOutlet var reasonTblView: UITableView!
    var cancelRide : Bool = false
    var id = ""
    var name = ""
    var reason = ""
    var bookid = ""
    var rideId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reasonsApi()
        detailView.delegate = self
         reasonView.setShadow()
        sendBtn.setButtonBorder()
        detail.setShadow()
       
        if (reason == "usercancel")
        {
              self.refundView.isHidden = false
            self.topConst.constant = 58
                                        
                                    let value = UserDefaults.standard.value(forKey: "RefundedAmount") as? String
                                    self.price.text = "$" + (value ?? "")

        }
        else
        {
            self.refundView.isHidden = true
            topConst.constant = 10

        }
    }
   @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func dropDownBtn(_ sender: Any) {
        reasonTblView.isHidden = false
    }
    
    @IBAction func sendBtnAtn(_ sender: Any) {
        if reason == "usercancel"{
           cancelRideApiApi(action: "2")
        }
        else{
             deleteRideApiApi()
        }
  
    }
}


extension cancelRideVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        detailView.text = ""
        detailView.textColor = .black
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if detailView.text! == ""{
            detailView.textColor = .lightGray
            detailView.text = "More Details"
        }
    }
    
}

//MARK:- Tablview Methods Methods

extension  cancelRideVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserVM.sheard.reasonDetailsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = UserVM.sheard.reasonDetailsArr[indexPath.row].reason_name
         return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = UserVM.sheard.reasonDetailsArr[indexPath.row].reason_id!
        name = UserVM.sheard.reasonDetailsArr[indexPath.row].reason_name!
        reasonTf.text! = name
        reasonTblView.isHidden = true
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}



//MARK:- Api Methods

extension cancelRideVC {
    func currentTime() -> String
    {
        let dateString = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssxxxxx"

         let dateFromString = formatter.string(from: dateString)
            formatter.dateFormat = "dd-MM-yyyy hh:mm:ss" //which format is needed
        let stringFromDate = formatter.date(from: dateFromString) ?? Date()
       let finalDate = formatter.string(from: stringFromDate)
       
        return finalDate
        
        
    }
    func reasonsApi(){
        let bookID =  UserDefaults.standard.value(forKey: "bookID") as? String

        UserVM.sheard.reasonDetailsArr.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.cancelReasions(user_id: userID, reason_type: reason, currentTime: self.currentTime(), book_id: bookID ?? "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                   
                    self.reasonTblView.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }    }
      }

    func cancelRideApiApi(action : String ){
       Indicator.sharedInstance.showIndicator()
        UserVM.sheard.cancelRide(user_id: userID, ride_id: rideId, book_id: bookid, action: action, book_reason_text: detailView.text!, comment: id, currentTime: self.currentTime()) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.navigationController?.popToRootViewController(animated: true)

                self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }    }
    }

    func deleteRideApiApi(){
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.deleteRide(user_id : userID,ride_id : rideId,action : "4",cancel_reason : detailView.text,comment : id , book_id : "" , book_code : "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.navigationController?.popToRootViewController(animated: true)
                    self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }    }
    }

}//


