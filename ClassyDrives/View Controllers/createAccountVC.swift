//
//  createAccountVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class createAccountVC: BaseVC {
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passTF: UITextField!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passView: UIView!
    @IBOutlet var sendBtn: UIButton!
    var isFromSocialLogin:Bool = false
    var emailFromSocialLogin:String = ""
    var firstName = String()
    var lastName = String()
    var dob = String()
    var city = String()
    var state = String()
    var zip = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.setShadow()
        passView.setShadow()
        sendBtn.setButtonBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if isFromSocialLogin{
            
            if emailFromSocialLogin == ""{
                emailTF.isUserInteractionEnabled = true
            }else{
                emailTF.isUserInteractionEnabled = false
                emailTF.text = emailFromSocialLogin
            }
            passView.isHidden = true
        }else{
            passView.isHidden = false
        }
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendBtnAtn(_ sender: Any) {
        if isFromSocialLogin{
            if emailTF.text!.isEmpty {
                showAlert(message: "Please enter email.")
                return
            }else{
                let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MobileVC") as! MobileVC
                
                story.email = emailTF.text ?? ""
               
                story.isFromSocailLogin = true
                navigationController?.pushViewController(story, animated: true)
            }
        }else{

                    if emailTF.text!.isEmpty {
                        showAlert(message: "Please enter email.")
                        return
                    }
                    if !isValidEmail(testStr: emailTF.text!) {
                        showAlert(message: "Please enter valid email id.")
                        return
                    }
                    
                    if passTF.text!.isEmpty {
                        showAlert(message: "Please enter password.")
                        return
                    }
                    
                    if !emailTF.text!.isEmpty && !passTF.text!.isEmpty {
            //            UserDefaults.standard.set(emailTF.text!, forKey: "email")
            //            UserDefaults.standard.set(passTF.text!, forKey: "pass")
                        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MobileVC") as! MobileVC
                        story.firstName = firstName
                        story.lastName = lastName
                        story.dob = dob
                        story.state = state
                        story.city = city
                        story.zip = zip
                        story.email = emailTF.text ?? ""
                        story.password = passTF.text ?? ""
                        
                        UserDefaults.standard.set("1", forKey: "otp_status")
                        print(firstName, lastName, dob, state, city, zip)
                        navigationController?.pushViewController(story, animated: true)
                     }
        }
    }
    
}
