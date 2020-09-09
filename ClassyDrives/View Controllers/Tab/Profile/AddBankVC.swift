//
//  AddBankVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 18/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class AddBankVC: BaseVC {
    @IBOutlet var routNoView: UIView!
    @IBOutlet var accountNoView: UIView!
    @IBOutlet var routTF: UITextField!
    @IBOutlet var accoutTF: UITextField!
    @IBOutlet var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        routNoView.setShadow()
        accountNoView.setShadow()
        addBtn.setButtonBorder()
    }
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addBtnAtn(_ sender: Any) {
        addBankData()
    }
}

//MARK: - API Methods
extension AddBankVC{
    func addBankData(){
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.addBank(user_id: userID, routing_number: routTF.text!, account_number: accoutTF.text!) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    //                    self.showAlert(message: message)
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

