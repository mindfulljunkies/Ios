//
//  exploreOfferRideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 29/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class exploreOfferRideVC: BaseVC, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet var seatsView: UIView!
    @IBOutlet var ammountView: UIView!
    @IBOutlet var carView: UIView!
    @IBOutlet var bankView: UIView!
    @IBOutlet var commentView: UIView!
    
    @IBOutlet var selectCarTF: UITextField!
    
    @IBOutlet var sPlusBtn: UIButton!
    @IBOutlet var sMinusBtn: UIButton!
    @IBOutlet var seatsLbl: UILabel!
    
    @IBOutlet var aPlusBtn: UIButton!
    @IBOutlet var aMinusBtn: UIButton!
    @IBOutlet var aPriceLbl: UILabel!
    
    //@IBOutlet var carNameLbl: UILabel!
    //@IBOutlet var sideImg: UIImageView!
    
    @IBOutlet var commentTView: UITextView!
    @IBOutlet var doneBtn: UIButton!
    
    
    @IBOutlet var bankTF: UITextField!
    
    
    var seatCount = 0
    var priceCount = 0
    var currentTime = String()
    var currentDate = String()
    
    var rideFromAdd = String()
    var rideFromLat = String()
    var rideFromLong = String()
    
    var rideToAdd = String()
    var rideToLat = String()
    var rideToLong = String()
    
    var ridedate = String()
    var rideTime = String()
    
    var carPicker = UIPickerView()
    var carId = String()
    
    var pickerValue = 0
    var bankId = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(rideFromAdd)\n\(rideToAdd))")
        
        seatsView.setShadow()
        ammountView.setShadow()
        carView.setShadow()
        commentView.setShadow()
        bankView.setShadow()
        doneBtn.setButtonBorder()
        
        sPlusBtn.setBodderLine(lineWidth: 1)
        sMinusBtn.setBodderLine(lineWidth: 1)
        
        aPlusBtn.setBodderLine(lineWidth: 1)
        aMinusBtn.setBodderLine(lineWidth: 1)
        
        aPriceLbl.layer.borderColor = UIColor.black.cgColor
        aPriceLbl.layer.borderWidth = 1
        
        seatsLbl.layer.borderColor = UIColor.black.cgColor
        seatsLbl.layer.borderWidth = 1
        
        selectCarTF.text = "Select Car"
        bankTF.text = "Select Bank"
        commentTView.delegate = self
        selectCarTF.delegate = self
        bankTF.delegate = self
        
        selectCarTF.inputAccessoryView = carPicker
        carPicker.backgroundColor = .black
        self.carPicker.setValue(UIColor.white, forKeyPath: "textColor")
        carPicker.setValue(UIColor.yellow, forKeyPath: "textColor")
        carPicker.delegate = self
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.gray
        let addCarBtn = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addCarBtn(sender:)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed))
        toolBar.setItems([addCarBtn,flexSpace,doneButton], animated: true)
        selectCarTF.inputAccessoryView = toolBar
        selectCarTF.inputView = carPicker
        
        bankTF.inputAccessoryView = carPicker
        let toolBar1 = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar1.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar1.barStyle = UIBarStyle.blackTranslucent
        toolBar1.tintColor = UIColor.white
        toolBar1.backgroundColor = UIColor.gray
        let doneButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed1))
        let flexSpace1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let addBankBtn = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addBankBtn(sender:)))
        toolBar1.setItems([addBankBtn, flexSpace1, doneButton1], animated: true)
        bankTF.inputAccessoryView = toolBar1
        bankTF.inputView = carPicker
        curretTime()
        curntDate()
        

    }

    func curretTime(){
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        currentTime = dateString
    }
    
    func curntDate() -> String {
        let dateFormatter : DateFormatter = DateFormatter()
     //   dateFormatter.dateFormat = "yyyy-mmm-dd"
        //dateFormatter.dateFormat = "mm-dd-yyy"
         dateFormatter.dateFormat = "MM-dd-yyyy"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
//        currentDate = dateString
        return dateString
    }
    
    @IBAction func approvalBtn(_ sender: Any) {
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == selectCarTF{
            pickerValue = 0
            carDetail()
        }else if textField == bankTF{
            pickerValue = 1
            wallet()
        }
    }
    
    @objc func donePressed(sender: UIBarButtonItem) {
        selectCarTF.resignFirstResponder()
    }
    @objc func donePressed1(sender: UIBarButtonItem) {
        bankTF.resignFirstResponder()
    }
    @objc func addCarBtn(sender: UIBarButtonItem){
        let story = self.storyboard?.instantiateViewController(withIdentifier: "carDetailVC") as! carDetailVC
        self.navigationController?.pushViewController(story, animated: true)
    }
    @objc func addBankBtn(sender: UIBarButtonItem){
        let story = self.storyboard?.instantiateViewController(withIdentifier: "AddBankVC") as! AddBankVC
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func seatPlusBtnAtn(_ sender: Any) {
        if seatCount <= 4{
            seatCount = seatCount + 1
            seatsLbl.text = "\(seatCount)"
        }
    }
    
    @IBAction func seatMinusBtnAtn(_ sender: Any) {
        if seatCount >= 1{
            seatCount = seatCount - 1
            seatsLbl.text = "\(seatCount)"
        }
    }
    
    @IBAction func amountPlusBtnAtn(_ sender: Any) {
        priceCount = priceCount + 1
        aPriceLbl.text = "\(priceCount)"
    }
    @IBAction func ammountMinusBtnAtn(_ sender: Any) {
        if priceCount >= 1{
            priceCount = priceCount - 1
            aPriceLbl.text = "\(priceCount)"
        }
    }
    
    @IBAction func doneBtnAtn(_ sender: Any) {
        
        
        offerRideApi()
    }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == commentTView{
            commentTView.text = ""
        }
    }
    

}

//MARK:- pickerView
extension exploreOfferRideVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerValue == 0{
            return UserVM.sheard.carDetails.count
        }else{
            if UserVM.sheard.walletDetails.count != 0{
                return UserVM.sheard.walletDetails[0].bank.count
            }else{
                return 0
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerValue == 0{
            return NSAttributedString(string: UserVM.sheard.carDetails[row].car_name, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        }else{
            return NSAttributedString(string: UserVM.sheard.walletDetails[0].bank[row].digits, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerValue == 0{
            selectCarTF.text = UserVM.sheard.carDetails[row].car_name
            carId = UserVM.sheard.carDetails[row].car_id
        }else{
            bankTF.text = "XXXXXXXXXXXX\(UserVM.sheard.walletDetails[0].bank[row].digits!)"
            bankId = UserVM.sheard.walletDetails[0].bank[row].id
        }
    }
    
}


//MARK:- API Method
extension exploreOfferRideVC{
    func carDetail() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.carDetails.removeAll()
        UserVM.sheard.carDetails(car_user: userID) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.carPicker.reloadAllComponents()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func wallet() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.wallet(user_id: userID) { (success, response,message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.carPicker.reloadAllComponents()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    
    func offerRideApi() {
        //ridedate
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.createRide(ride_user: userID, ride_from_address: rideFromAdd, ride_to_address: rideToAdd, ride_from_lat: rideFromLat, ride_from_long: rideFromLong, ride_to_lat: rideToLat, ride_to_long: rideToLong, ride_from_address2: "", ride_from_lat2: "", ride_from_long2: "", ride_from_address3: "", ride_from_lat3: "", ride_from_long3: "", ride_date: self.curntDate(), ride_time: rideTime, ride_amount: aPriceLbl.text!, ride_seat: seatsLbl.text!, ride_about: commentTView.text!, car_id: carId, detour: "0", is_local_ride: "1",current_time: currentTime, is_autoapproval: "1") { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createRidePopUp") as! createRidePopUp
                    self.addChild(popOverVC)
                    self.view.addSubview(popOverVC.view)
                    popOverVC.didMove(toParent: self)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
}
