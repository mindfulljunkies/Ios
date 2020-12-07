//
//  BaseVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    
    
    func rideOnlineStatus(onSuccess:@escaping(_ status:Bool,_ value:String,_ m_booked:String)->Void)
    {
        
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.rideOnlineStatus(userid: userID) { (m_booked,ride_id,success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    onSuccess(success, ride_id,m_booked)
                 }
                else{
                    onSuccess(success, ride_id,m_booked)
                }
            }
            
        }
        
    }
   
    //MARK: *************   Show Alert   ***************
    func showAlert(message: String?, title:String = "", otherButtons:[String:((UIAlertAction)-> ())]? = nil, cancelTitle: String = "Okay", cancelAction: ((UIAlertAction)-> ())? = nil) {
        let newTitle = title.capitalized
        let newMessage = message
        let alert = UIAlertController(title: newTitle, message: newMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction))
        
        if otherButtons != nil {
            for key in otherButtons!.keys {
                alert.addAction(UIAlertAction(title: key, style: .default, handler: otherButtons![key]))
            }
        }
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorMessage(error: NSError?, cancelAction: ((UIAlertAction)-> ())? = nil) {
        var title = "Error"
        var message = "Something Went Wrong"
        if error != nil {
            title = error!.domain
            message = error!.userInfo["message"] as? String ?? ""
        }
        let newTitle = title.capitalized
        let newMessage = message.capitalized
        let alert = UIAlertController(title: newTitle, message: newMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: cancelAction))
        present(alert, animated: true, completion: nil)
    }

    
    //    MARK: email Validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
     //    MARK: Phone number Validation
    func isValidPhone(phone: String) -> Bool {
        let PHONE_REGEX = "^09[0-9'@s]{9,9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: phone)
        return result
        
    }
}
