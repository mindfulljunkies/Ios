//
//  MobileVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class MobileVC: BaseVC {

    @IBOutlet weak var mTermsCheckBtnout: UIButton!
    @IBOutlet var phoneView: UIView!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet weak var mPrivacyCheckBtnOut: UIButton!
    var isFromSocailLogin:Bool = false
    var socialLoginEmail:String = ""
    var firstName = String()
    var lastName = String()
    var dob = String()
    var city = String()
    var state = String()
    var zip = String()
    var email = String()
    var password = String()
    var apple_id = String()

    var checkTermBool : Bool = true
    var checkPrivacyBool : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        phoneView.setShadow()
        nextBtn.setButtonBorder()
        print(firstName,lastName, email, password, dob, city, state , zip,apple_id)
        
//        firstName = UserDefaults.standard.value(forKey: "FName")
//        lastName = UserDefaults.standard.value(forKey: "FName")
//        dob = UserDefaults.standard.value(forKey: "FName")
//        city = UserDefaults.standard.value(forKey: "FName")
//        state = UserDefaults.standard.value(forKey: "FName")
//        firstName = UserDefaults.standard.value(forKey: "FName")
//        firstName = UserDefaults.standard.value(forKey: "FName")
        
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func nextBtnAtn(_ sender: Any) {
        if isFromSocailLogin{
            if checkTermBool == true {
                NotificationAlert().NotificationAlert(titles: "Please Accept Terms & Conditions")
                return
            }
            if checkPrivacyBool == true {
                NotificationAlert().NotificationAlert(titles: "Please Accept Privacy Policies")
                return
            }
            OTPApi(email: email)
        }
        else{
            
            let otp = UserDefaults.standard.value(forKey: "otp_status") as? String
            if  otp ==  "0"
            {
                OTPApi(email: "")
                return
            }
            registorAPI()
        }
    }
    
    
    @IBAction func mCheckPrivacyBtnAct(_ sender: Any) {
        if checkPrivacyBool == true{
            mPrivacyCheckBtnOut.setImage(#imageLiteral(resourceName: "iconfinder_check-box_326563"), for: .normal)
            checkPrivacyBool = false
        }else{
            mPrivacyCheckBtnOut.setImage(#imageLiteral(resourceName: "checkunfill"), for: .normal)
          checkPrivacyBool = true
        }
        
    }
    
    @IBAction func mCheckTermsBtnAct(_ sender: Any) {
        if checkTermBool == true{
            mTermsCheckBtnout.setImage(#imageLiteral(resourceName: "iconfinder_check-box_326563"), for: .normal)
            checkTermBool = false
        }else{
            mTermsCheckBtnout.setImage(#imageLiteral(resourceName: "checkunfill"), for: .normal)
            checkTermBool = true

        }
    }
    
    @IBAction func mTermsCondicationBtnAct(_ sender: Any) {
        
    }
    
    @IBAction func mPrivacyBtnAct(_ sender: Any) {
        
    }
    func removeSpecialCharsFromString(_ str: String) -> String {
        struct Constants {
            static let validChars = Set("1234567890- ()")
        }
        return String(str.characters.filter { Constants.validChars.contains($0) })
    }
    
}


//MARK:- Api Methos
extension MobileVC {
    func registorAPI() {
        Indicator.sharedInstance.showIndicator()
        let mobSepwhiteSpace = phoneTF.text?.replacingOccurrences(of: " ", with: "")
        let removeBracesL = mobSepwhiteSpace?.replacingOccurrences(of: "(", with: "")
        let removeBracesR = removeBracesL?.replacingOccurrences(of: ")", with: "")
        var hifn = removeBracesR?.replacingOccurrences(of: "", with: "")
        hifn = self.removeSpecialCharsFromString(removeBracesR ?? "")
        print("hifn----\(hifn)")

        UserVM.sheard.registorUser(firstname: firstName, lastname: lastName, email: email, password: password, device_type: "?", device_token: "?", dob: dob, city: city, state: state, zip: zip, bio: "test", mobile: "1\(hifn!.replacingOccurrences(of: "-", with: ""))", apple_id : apple_id) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    let story = self.storyboard?.instantiateViewController(withIdentifier:"OtpVC") as! OtpVC
                    story.firstName = self.firstName
                    story.lastName = self.lastName
                    story.dob = self.dob
                    story.state = self.state
                    story.city = self.city
                    story.zip = self.zip
                    story.email = self.email
                    story.password = self.password
                    story.mobile =  "1\(hifn?.replacingOccurrences(of: "-", with: "") ?? "")"
                    story.apple_id = self.apple_id
                    
                    story.applicationFinishedRestoringState()
                    self.navigationController?.pushViewController(story, animated: true)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    func OTPApi(email:String) {
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

        let string = "1" + (self.phoneTF.text?.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())!
        UserVM.sheard.sendNumber(phone: string, userid: userID,email:email ,response: { (success, message, error) in
                   if error == nil{
                       Indicator.sharedInstance.hideIndicator()
                       if success{
                           let story = self.storyboard?.instantiateViewController(withIdentifier:"OtpVC") as! OtpVC
//                           story.firstName = self.firstName
//                           story.lastName = self.lastName
//                           story.dob = self.dob
//                           story.state = self.state
//                           story.city = self.city
//                           story.zip = self.zip
//                           story.email = self.email
//                           story.password = self.password
                           story.mobile = string
                           self.navigationController?.pushViewController(story, animated: true)
                       }else{
                           self.showAlert(message: message)
                       }
                   }else{
                       self.showAlert(message: error?.domain)
                   }
               }
    )
}
}
extension MobileVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let length = Int(getLength(mobileNumber: textField.text!))
        
        if length == 10 {
            if range.length == 0 {
                return false
            }
        }
        
        if length == 3 {
            
            let num = self.formatNumber(mobileNumber: textField.text!)
            
            textField.text = NSString(format:"(%@)",num) as String
            
            if range.length > 0{
                let index: String.Index = num.index(num.startIndex, offsetBy: 3)
                textField.text = NSString(format:"%@",num.substring(to: index)) as String
            }
            
        }else if length == 6 {
            let num = self.formatNumber(mobileNumber: textField.text!)
            let index: String.Index = num.index(num.startIndex, offsetBy: 3)
            
            textField.text = NSString(format:"(%@) %@-",num.substring(to: index), num.substring(from: index)) as String
            if range.length > 0{
                textField.text = NSString(format:"(%@) %@",num.substring(to: index), num.substring(from: index)) as String
            }
        }
        
        return true
    }
    
    func formatNumber(mobileNumber: String) -> String {
        var number = mobileNumber
        number = number.replacingOccurrences(of: "(", with: "")
        number = number.replacingOccurrences(of: ")", with: "")
        number = number.replacingOccurrences(of: " ", with: "")
        number = number.replacingOccurrences(of: "-", with: "")
        number = number.replacingOccurrences(of: "+", with: "")
        
        let length = Int(number.characters.count)
        
        if length > 15 {
            let index = number.index(number.startIndex, offsetBy: 15)
            
            number = number.substring(to: index)
        }
        
        return number
    }
    
    func getLength(mobileNumber: String) -> Int {
        
        var number = mobileNumber
        number = number.replacingOccurrences(of: "(", with: "")
        number = number.replacingOccurrences(of: ")", with: "")
        number = number.replacingOccurrences(of: " ", with: "")
        number = number.replacingOccurrences(of: "-", with: "")
        number = number.replacingOccurrences(of: "+", with: "")
        
        let length = Int(number.characters.count)
        return length
        
    }
    
}
