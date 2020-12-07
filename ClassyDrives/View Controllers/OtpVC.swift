//
//  OtpVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class OtpVC: BaseVC {
    
    @IBOutlet var otpView: UIView!
    @IBOutlet var otpTF: UITextField!
    @IBOutlet var nextBtn: UIButton!
    
    var firstName = String()
    var lastName = String()
    var dob = String()
    var city = String()
    var state = String()
    var zip = String()
    var email = String()
    var password = String()
    var mobile = String()
    var apple_id = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpView.setShadow()
        nextBtn.setButtonBorder()
    }
    @IBAction func resendOTPBtn(_ sender: Any) {
        resentOTP()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextBtnAtn(_ sender: Any) {
        Indicator.sharedInstance.showIndicator()
        verifyOTP()
    }
}

//MARK:- Api Methos
extension OtpVC {
    func OtpAPI() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.registorUser(firstname: firstName, lastname: lastName, email: email, password: password, device_type: "?", device_token: instanceToken, dob: dob, city: city, state: state, zip: zip, bio: "test", mobile: mobile ,apple_id : apple_id) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func resentOTP() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.resendOtp(mobile: mobile) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func verifyOTP() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count);                   UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
                   UserDefaults.standard.synchronize()
        UserVM.sheard.otpVarify(otp: otpTF.text ?? "" , mobile: "\(mobile)") { (success, message, error) in

            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
 UserDefaults.standard.set(message, forKey: "LoginUser")
                    
                    
                    let story = self.storyboard?.instantiateViewController(withIdentifier:"UserLicenessVerifyVC1") as! UserLicenessVerifyVC1
                                  self.navigationController?.pushViewController(story, animated: true)
                    
                    
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
}
