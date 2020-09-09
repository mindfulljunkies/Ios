//
//  DeleteUserVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 06/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class DeleteUserVC: BaseVC {
    @IBOutlet var resonTxtField: UITextField!
    @IBOutlet var commentTxtView: UITextView!
    @IBOutlet var reasonView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet var resonTblView: UITableView!
    var reason : String?
    var picker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTxtView.delegate = self
        resonTxtField.delegate = self
      submitBtn.layer.cornerRadius = 25
      submitBtn.layer.borderWidth = 1
      submitBtn.layer.borderColor = UIColor.black.cgColor
        commentTxtView.layer.cornerRadius = 6
        commentTxtView.layer.borderWidth = 0.5
        commentTxtView.layer.borderColor = UIColor.lightGray.cgColor
        reasonView.layer.cornerRadius = 1
        reasonView.layer.borderWidth = 0.5
        reasonView.layer.borderColor = UIColor.lightGray.cgColor
        resonTxtField.isUserInteractionEnabled = true
        self.reasonsApi()
        picker.delegate = self
        picker.dataSource = self

        // Do any additional setup after loading the view.
    }
    func reasonsApi(){

      UserVM.sheard.reasonDetailsArr.removeAll()
      Indicator.sharedInstance.showIndicator()
        UserVM.sheard.cancelReasions(user_id: userID, reason_type: "deleteaccount", currentTime: "", book_id: "") { (success, message, error) in
          if error == nil{
              Indicator.sharedInstance.hideIndicator()
              if success{
                
//                  self.showAlert(message: message)
              }else{
                  self.showAlert(message: message)
              }
          }else{
              self.showAlert(message: error?.domain)
          }    }
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sumbitBtnActn(_ sender: Any) {
        if self.reason == nil
        {
            self.showAlert(message: "Please select reason first")
            return
        }
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.deleteUser(userid: userID,reason:self.reason ?? "" , comment: self.commentTxtView.text ?? "") { (success, message, error) in
                  if error == nil{
                      Indicator.sharedInstance.hideIndicator()
                      if success{
                        self.navigationController?.popToRootViewController(animated: true)
        //                  self.showAlert(message: message)
                      }else{
                          self.showAlert(message: message)
                      }
                  }else{
                      self.showAlert(message: error?.domain)
                  }    }
    }
    func reasonPickerView(){
       
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        picker.backgroundColor = .black
        toolbar.backgroundColor = .black
        resonTxtField.inputAccessoryView = toolbar
        resonTxtField.inputView = self.picker
        self.picker.setValue(UIColor.white, forKeyPath: "textColor")

     
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
        cancelBtn.tintColor = .white
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneAction(sender:)))
        doneBtn.tintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
     picker.reloadAllComponents()
    }
    @objc func doneAction(sender: UITextField)  {
        
           resonTxtField.text = reason ?? ""
        
           self.view.endEditing(true)
       }
    @objc func cancelBtn(){
        self.view.endEditing(true)
    }
}

extension DeleteUserVC: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        commentTxtView.text = ""
        commentTxtView.textColor = .black
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if commentTxtView.text! == ""{
            commentTxtView.textColor = .lightGray
            commentTxtView.text = "More Details"
        }
    }
    
}
extension DeleteUserVC : UITextFieldDelegate
{
     func textFieldDidBeginEditing(_ textField: UITextField) {
                if textField == resonTxtField{
                    self.reasonPickerView()
            }
}
}
//MARK:- pickerView
extension DeleteUserVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return UserVM.sheard.reasonDetailsArr.count

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return UserVM.sheard.reasonDetailsArr[row].reason_name

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         reason =  UserVM.sheard.reasonDetailsArr[row].reason_name
        
      resonTxtField.text =  UserVM.sheard.reasonDetailsArr[row].reason_name
    
}
}
