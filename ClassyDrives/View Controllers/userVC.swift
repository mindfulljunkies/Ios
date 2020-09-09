//
//  userVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class userVC: BaseVC, UITextFieldDelegate{
    @IBOutlet var firstTF: UITextField!
    @IBOutlet var lastTF: UITextField!
    @IBOutlet var dobTF: UITextField!
    
    @IBOutlet var firstView: UIView!
    @IBOutlet var lastView: UIView!
    @IBOutlet var dobView: UIView!
    @IBOutlet var nextBtn: UIButton!
    
    var date = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.setShadow()
        lastView.setShadow()
        dobView.setShadow()
        nextBtn.setButtonBorder()
        
        dobTF.delegate = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        date.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy"
        date.maximumDate = Date()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtnAtn(_ sender: Any) {
        if firstTF.text!.isEmpty {
            showAlert(message: "Please enter username.")
            return
        }
        if lastTF.text!.isEmpty {
            showAlert(message: "Please enter password.")
            return
        }
        if dobTF.text!.isEmpty {
            showAlert(message: "Please enter date of birth.")
            return
        }
       
        if !firstTF.text!.isEmpty && !lastTF.text!.isEmpty && !dobTF.text!.isEmpty{
//            UserDefaults.standard.set(firstTF.text!, forKey: "FName")
//            UserDefaults.standard.set(lastTF.text!, forKey: "LName")
//            UserDefaults.standard.set(dobTF.text!, forKey: "dob")
            
            let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"createAccountVC") as! createAccountVC
            story.firstName = firstTF.text!
            story.lastName = lastTF.text!
            story.dob = dobTF.text!
            navigationController?.pushViewController(story, animated: true)
        }
   }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.date.datePickerMode = .date
        self.date.backgroundColor = .black
        self.date.setValue(UIColor.white, forKeyPath: "textColor")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .black
        dobTF.inputAccessoryView = toolbar
       dobTF.inputView = self.date
        
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
        cancelBtn.tintColor = .white
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneAction(sender:)))
        doneBtn.tintColor = .white
        toolbar.setItems([cancelBtn,doneBtn], animated: true)
    }
    
    @objc func doneAction(sender: UITextField)  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        dobTF.text = "\(formatter.string(from: date.date))"
        self.view.endEditing(true)
    }
    @objc func cancelBtn(){
        self.view.endEditing(true)
    }
}
