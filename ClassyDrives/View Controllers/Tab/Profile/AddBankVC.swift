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
    @IBOutlet var dobView: UIView!
    @IBOutlet var ssnView: UIView!
    @IBOutlet var line1View: UIView!
    @IBOutlet var line2View: UIView!
   fileprivate var stateDetails = [states]()
    @IBOutlet var cityView: UIView!
    @IBOutlet var stateView: UIView!
    @IBOutlet var postalView: UIView!
    @IBOutlet var routTF: UITextField!
    @IBOutlet var accoutTF: UITextField!
    @IBOutlet var dobTF: UITextField!
    @IBOutlet var ssnTF: UITextField!
    @IBOutlet var line1TF: UITextField!
    @IBOutlet var line2TF: UITextField!
    @IBOutlet var cityTF: UITextField!
    @IBOutlet var stateTF: UITextField!
    @IBOutlet var postalTF: UITextField!
    @IBOutlet var addBtn: UIButton!
    var date = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        routNoView.setShadow()
        accountNoView.setShadow()
       dobView.setShadow()
        ssnView.setShadow()
       line1View.setShadow()
       line2View.setShadow()
        cityView.setShadow()
        stateView.setShadow()
        postalView.setShadow()
        addBtn.setButtonBorder()
        dobTF.delegate = self
        stateAPI()
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
        UserVM.sheard.addBank(user_id: userID, routing_number: routTF.text!, account_number: accoutTF.text!,line1: line1TF.text ?? "",line2: line2TF.text ?? "",ssn: "",ssn_last_4: ssnTF.text ?? "",city: cityTF.text ?? "",state: stateTF.text ?? "",postal_code: postalTF.text ?? "",dob: dobTF.text ?? "") { (success, message, error) in
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
    
   fileprivate func stateAPI() {
        Indicator.sharedInstance.showIndicator()
        stateDetails.removeAll()
        UserVM.sheard.state1 { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
    //                self.picker.reloadAllComponents()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
        }
}


extension AddBankVC:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
               if textField == dobTF{
                   self.datePickerView()
           }
    }
    
    
    
    func datePickerView(){
        self.date.datePickerMode = .date
        self.date.backgroundColor = .black
        self.date.setValue(UIColor.white, forKeyPath: "textColor")
        if #available(iOS 14.0, *) {
            self.date.preferredDatePickerStyle = .wheels
            
        } else {
            // Fallback on earlier versions
        }
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .black
        dobTF.inputAccessoryView = toolbar
        dobTF.inputView = self.date

               
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
        cancelBtn.tintColor = .white
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneAction(sender:)))
        doneBtn.tintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
    }
    
    @objc func doneAction(sender: UITextField)  {
        let formatter = DateFormatter()
        formatter.dateFormat = "DD-MM-YYYY"
        dobTF.text = "\(formatter.string(from: date.date))"
        self.view.endEditing(true)
    }
    
    @objc func cancelBtn(){
        self.view.endEditing(true)
    }
}
