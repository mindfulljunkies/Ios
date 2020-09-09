//
//  UserLicenessVerifyVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 30/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class UserLicenessVerifyVC: BaseVC {
    @IBOutlet var firstNameTxt: UITextField!
    @IBOutlet var lastnameTxt: UITextField!
    @IBOutlet var dateofBirthTxt: UITextField!
    @IBOutlet var dateofinsurenceTxt: UITextField!
    @IBOutlet var stateTxt: UITextField!
    @IBOutlet var licnessnmberTxt: UITextField!
     var picker = UIPickerView()
     var date = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        self.stateAPI()
        picker.delegate = self
        picker.dataSource = self
        stateTxt.delegate = self
        stateTxt.isUserInteractionEnabled = true
        dateofBirthTxt.delegate = self
        dateofinsurenceTxt.delegate = self
        licnessnmberTxt.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sendBtnActn(_ sender: Any) {
        drivingLicence()
        
    }
    
    @IBAction func stateBtn(_ sender: Any) {
    }
   
    func statePickerView(){
          
           let toolbar = UIToolbar()
           toolbar.sizeToFit()
           picker.backgroundColor = .black
           toolbar.backgroundColor = .black
           stateTxt.inputAccessoryView = toolbar
           stateTxt.inputView = self.picker
           self.picker.setValue(UIColor.white, forKeyPath: "textColor")

        
           let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
           cancelBtn.tintColor = .white
           let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.insuranceDoneAction(sender:)))
           doneBtn.tintColor = .white
           let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

           toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
        picker.reloadAllComponents()
       }
    
    func insurancePickerView(){
        self.date.datePickerMode = .date
        self.date.backgroundColor = .black
        self.date.setValue(UIColor.white, forKeyPath: "textColor")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .black
        dateofinsurenceTxt.inputAccessoryView = toolbar
        dateofinsurenceTxt.inputView = self.date

               
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
        cancelBtn.tintColor = .white
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.insuranceDoneAction(sender:)))
        doneBtn.tintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
    }
    func datePickerView(){
        self.date.datePickerMode = .date
        self.date.backgroundColor = .black
        self.date.setValue(UIColor.white, forKeyPath: "textColor")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .black
        dateofBirthTxt.inputAccessoryView = toolbar
        dateofBirthTxt.inputView = self.date

               
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
        cancelBtn.tintColor = .white
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneAction(sender:)))
        doneBtn.tintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
    }
    @objc func doneAction(sender: UITextField)  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        dateofBirthTxt.text = "\(formatter.string(from: date.date))"
        self.view.endEditing(true)
    }
    @objc func insuranceDoneAction(sender: UITextField)  {
           let formatter = DateFormatter()
           formatter.dateFormat = "MMM dd,yyyy"
           dateofinsurenceTxt.text = "\(formatter.string(from: date.date))"
           self.view.endEditing(true)
       }
    @objc func cancelBtn(){
        self.view.endEditing(true)
    }
//    @objc func finddoneAction()  {
//          let formatter = DateFormatter()
//          formatter.dateFormat = "MM-dd-yyyy"
//          dateofBirthTxt.text = "\(formatter.string(from: date.date))"
//          self.dateofBirthTxt.endEditing(true)
//      }
}
extension UserLicenessVerifyVC : UITextFieldDelegate
{
     func textFieldDidBeginEditing(_ textField: UITextField) {
                if textField == dateofBirthTxt{
                    self.datePickerView()
            }
        
   else if textField == dateofinsurenceTxt{
                    self.insurancePickerView()
        }
        else if textField == stateTxt{
                  self.statePickerView()
//                    self.insurancePickerView()
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == licnessnmberTxt)
        {
        let maxLength = 14
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
        }
        return false
    }
    func drivingLicence(){
         Indicator.sharedInstance.showIndicator()
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

         UserVM.sheard.VerifyLicence(user_id: userID , first_name: self.firstNameTxt.text ?? "" , last_name: self.lastnameTxt.text ?? "" , state: stateTxt.text ?? "", doi: self.dateofinsurenceTxt.text ?? "", dob: self.dateofBirthTxt.text ?? "", license_number: self.licnessnmberTxt.text ?? "") { (success, message, error) in
             if error == nil{
                 Indicator.sharedInstance.hideIndicator()
                 if success{
                     
                     self.showAlert(message: message)
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

//MRK:- Picker View Methid


extension UserLicenessVerifyVC{
func stateAPI() {
    Indicator.sharedInstance.showIndicator()
    UserVM.sheard.stateDetails.removeAll()
    UserVM.sheard.state { (success, message, error) in
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
//MARK:- pickerView
extension UserLicenessVerifyVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return UserVM.sheard.stateDetails.count

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UserVM.sheard.stateDetails[row].sName

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateTxt.text = UserVM.sheard.stateDetails[row].sName
    
}
}
