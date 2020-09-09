//
//  localFindCellXib.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 28/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class localFindCellXib: UICollectionViewCell, UITextFieldDelegate {
    @IBOutlet var picView: UIView!
    @IBOutlet var dropView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var doneBtn: UIButton!
    
    @IBOutlet var picTF: UITextField!
    @IBOutlet var dropTF: UITextField!
    @IBOutlet var dateTF: UITextField!
    @IBOutlet var picBtn: UIButton!
    @IBOutlet var dropBtn: UIButton!
    
    var picAtn: ((localFindCellXib)-> Void)?
    var dropAtn: ((localFindCellXib)-> Void)?
    var doneAtn: ((localFindCellXib)-> Void)?
    var date = UIDatePicker()
    override func awakeFromNib() {
        super.awakeFromNib()
        
         picView.setShadow()
        dropView.setShadow()
        dateView.setShadow()
        doneBtn.setButtonBorder()
        dateTF.delegate = self
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
//                self.date.addTarget(self, action: #selector(self.valueChangedPicker(_:)), for: .valueChanged)
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
    }
   
//    @objc func valueChangedPicker(_ sender : UIDatePicker){
//        let date = sender.date
//        self.dateTF.text =
//    }
    @objc func cancelBtn(){
        self.dateTF.endEditing(true)
    }
//    @objc func finddoneAction()  {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM-dd-yyyy"
//        dateTF.text = "\(formatter.string(from: date.date))"
//        self.dateTF.endEditing(true)
//    }
    @objc func finddoneAction()  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        dateTF.text = "\(formatter.string(from: date.date))"
        self.dateTF.endEditing(true)
    }
    @objc func doneActionTime(sender: UITextField){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
//        timeTF.text = "\(formatter.string(from: date1.date))"
//        self.timeTF.endEditing(true)
        let formatters = DateFormatter()
        formatters.dateFormat = "dd-MM-yyyy"
        dateTF.text = "\(formatters.string(from: Date()))"
    }
}
