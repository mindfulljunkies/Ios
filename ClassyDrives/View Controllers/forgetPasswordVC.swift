//
//  forgetPasswordVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 14/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class forgetPasswordVC: BaseVC {
    @IBOutlet var emailView: UIView!
    @IBOutlet var emailTF: UITextField!
    
    @IBOutlet var nextBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.setShadow()
        nextBtn.setButtonBorder()
    }
    @IBAction func nextBtnATn(_ sender: Any) {
        forgetAPI()
    }
    
}

//MARK:- Api Methos
extension forgetPasswordVC {
    func forgetAPI( ) {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.forgetPassword(email: emailTF.text!) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    let alert = UIAlertController(title: "Password Send", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}
