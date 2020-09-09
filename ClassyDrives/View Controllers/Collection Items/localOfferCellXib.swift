//
//  localOfferCellXib.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 28/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class localOfferCellXib: UICollectionViewCell, UITextFieldDelegate{

    
    @IBOutlet var picView: UIView!
    @IBOutlet var dropView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var timeView: UIView!
    @IBOutlet var doneBtn: UIButton!
    
    @IBOutlet var picTF: UITextField!
    @IBOutlet var dropTF: UITextField!
    @IBOutlet var dateTF: UITextField!
    @IBOutlet var timeTF: UITextField!
    
    var picAtn: ((localOfferCellXib)-> Void)?
    var dropAtn: ((localOfferCellXib)-> Void)?
    var doneAtn: ((localOfferCellXib)-> Void)?
    
    var date = UIDatePicker()
    var date1 = UIDatePicker()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        picView.setShadow()
        dropView.setShadow()
        dateView.setShadow()
        timeView.setShadow()
        doneBtn.setButtonBorder()
        
        dateTF.delegate = self
        timeTF.delegate = self
    }

    @IBAction func picBtnAtn(_ sender: Any) {
        picAtn?(self)
    }
    @IBAction func dropBtnAtn(_ sender: Any) {
        dropAtn?(self)
    }
    @IBAction func doneBtnAtn(_ sender: Any) {
        doneAtn?(self)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateTF{
            self.date.datePickerMode = .date
            self.date.minimumDate = Date()
            self.date.backgroundColor = .black
            self.date.setValue(UIColor.white, forKeyPath: "textColor")
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            toolbar.backgroundColor = .black
            dateTF.inputAccessoryView = toolbar
            dateTF.inputView = self.date
            let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
            cancelBtn.tintColor = .white
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.finddoneAction))
            doneBtn.tintColor = .white
            toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
        }
        else if textField === timeTF{
            self.date1.datePickerMode = .time
           // self.date1.minimumDate = Date()
            self.date1.backgroundColor = .black
            self.date1.setValue(UIColor.white, forKeyPath: "textColor")
            let toolbar1 = UIToolbar()
            toolbar1.sizeToFit()
            toolbar1.backgroundColor = .black
            timeTF.inputAccessoryView = toolbar1
            timeTF.inputView = self.date1
            let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            let cancelBtn1 = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
            cancelBtn1.tintColor = .white
            let doneBtn1 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneActionTime))
            doneBtn1.tintColor = .white
            toolbar1.setItems([cancelBtn1,flexSpace,doneBtn1], animated: true)
        }
    }
    
    @objc func cancelBtn(){
        self.dateTF.endEditing(true)
    }
    @objc func finddoneAction()  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateTF.text = "\(formatter.string(from: date.date))"
        self.dateTF.endEditing(true)
    }
    @objc func doneActionTime(sender: UITextField){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        timeTF.text = "\(formatter.string(from: date1.date))"
        self.timeTF.endEditing(true)
        let formatters = DateFormatter()
        formatters.dateFormat = "dd-MM-yyyy"
        dateTF.text = "\(formatters.string(from: Date()))"
        
        
    }
}
