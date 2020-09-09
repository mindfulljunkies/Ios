//
//  UserssnVerficationVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 30/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class UserssnVerficationVC: BaseVC {
    @IBOutlet var ssnTxt: VSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    ssnTxt.setFormatting("###-##-####", replacementChar: "#")

        // Do any additional setup after loading the view.
    }
    @IBAction func sendBtnActn(_ sender: Any) {
        if ssnTxt.text == ""{
            self.showAlert(message: "Please enter SSN number")
            return
        }
         ssnVerifyApi()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// this code add in coment

extension UserssnVerficationVC {
    func ssnVerifyApi(){
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.verifySSN(user_id : userID,snn : ssnTxt.text ?? "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    
                    self.showAlert(message: "We will verify your background information for security purposes.")
                    self.navigationController?.popViewController(animated: true)

                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}
