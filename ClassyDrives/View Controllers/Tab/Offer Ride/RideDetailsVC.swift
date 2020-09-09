//
//  RideDetailsVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 15/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class RideDetailsVC: BaseVC, UITextViewDelegate, UITextFieldDelegate{
    @IBOutlet var seatsView: UIView!
    @IBOutlet var ammountView: UIView!
    @IBOutlet var carView: UIView!
    @IBOutlet var commentView: UIView!
    
    @IBOutlet weak var mConstantBankTop: NSLayoutConstraint!
    @IBOutlet weak var mConstantBankHgt: NSLayoutConstraint!
    @IBOutlet var selectCarTF: UITextField!
    
    @IBOutlet weak var mAutoAppImage: UIImageView!
    @IBOutlet weak var mAutoApprovalView: UIView!
    @IBOutlet var sPlusBtn: UIButton!
    @IBOutlet var sMinusBtn: UIButton!
    @IBOutlet var seatsLbl: UILabel!
    
    @IBOutlet var aPlusBtn: UIButton!
    @IBOutlet var aMinusBtn: UIButton!
//    @IBOutlet var aPriceLbl: UILabel!
     @IBOutlet var aPriceLbl: UITextField!
    
    @IBOutlet var carNameLbl: UILabel!
    @IBOutlet var sideImg: UIImageView!
    
    @IBOutlet var commentTView: UITextView!
    @IBOutlet var doneBtn: UIButton!
    
    @IBOutlet var bankView: UIView!
    @IBOutlet var bankTF: UITextField!
    
    @IBOutlet var detourView: UIView!
    @IBOutlet var detourImg: UIImageView!
    
    var seatCount = 0
    var priceCount = 0
    
    var rideFromAdd = String()
    var rideFromLat = String()
    var rideFromLong = String()
    
    var rideToAdd = String()
    var rideToLat = String()
    var rideToLong = String()
    
    var address2 = String()
    var rideLat2 = String()
    var rideLong2 = String()
    
    var address3 = String()
    var rideLat3 = String()
    var rideLong3 = String()
    
    var ridedate = String()
    var rideTime = String()
    var currentTime = String()

    var carPicker = UIPickerView()
    var carId = String()
    
    var detour = false
    var autoApproval : Bool = false

    var detourValue = Int()
    var pickerValue = 0
    var bankId = String()
    
    var rideDetaiDict : OfferRideDetailModel?
    var CarDetailArray : [CarDetail]?
    var mileArray = ["0-5","5-10","10-15","15-20","20-25","25-30","30-35","35-40","40-45"]
    var isAutoApproved : Int = 0
    var bookDetail : RideDetail?
    var is_local_ride = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        detourValue = 1
        
        seatsView.setShadow()
        ammountView.setShadow()
        carView.setShadow()
        commentView.setShadow()
        bankView.setShadow()
        mAutoApprovalView.setShadow()
        detourView.setShadow()
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
        bankTF.text = "Select Miles"
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
        let addCarBtn = UIBarButtonItem.init(title: "Add Car", style: .done, target: self, action: #selector(addCarBtn(sender:)))
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
        
        detourImg.layer.cornerRadius = 5
        detourImg.layer.shadowColor = UIColor.gray.cgColor
        detourImg.layer.shadowOpacity = 0.5
        detourImg.layer.shadowOffset = CGSize.zero
        detourImg.layer.shadowRadius = 5
        mAutoAppImage.layer.cornerRadius = 5
        mAutoAppImage.layer.shadowColor = UIColor.gray.cgColor
        mAutoAppImage.layer.shadowOpacity = 0.5
        mAutoAppImage.layer.shadowOffset = CGSize.zero
        mAutoAppImage.layer.shadowRadius = 5
        UIView.animate(withDuration: 0.4) {
            self.bankView.isHidden = true
            self.mConstantBankHgt.constant = 0
            self.mConstantBankTop.constant = 0
            self.view.layoutIfNeeded()
        }
        details()
    }
    override func viewWillAppear(_ animated: Bool) {
                carDetail()
        super.viewWillAppear(animated)
    }
    func getCurrenttime()
       {
           
                 let formatters = DateFormatter()
                 formatters.dateFormat = "hh:mm a"
                currentTime = "\(formatters.string(from: Date()))"
        
       }
    @IBAction func detourBtnAtn(_ sender: Any) {
        if detour == true{
            detourImg.image = #imageLiteral(resourceName: "switch (2)")
            detourValue = 0
            detour = false
            UIView.animate(withDuration: 0.4) {
                self.bankView.isHidden = true
                self.mConstantBankHgt.constant = 0
                self.mConstantBankTop.constant = 0
                self.view.layoutIfNeeded()
            }
           
        }else{
            detourImg.image = #imageLiteral(resourceName: "switch (3)")
            detourValue = 1
            detour = true
            UIView.animate(withDuration: 0.4) {
                self.bankView.isHidden = false
                self.mConstantBankHgt.constant = 40
                self.mConstantBankTop.constant = 30
                self.view.layoutIfNeeded()
            }
        }
        
        print(detourValue)
    }
    
    @IBAction func mAutoApprovalBtnAct(_ sender: Any) {
      
        if autoApproval == true{
          mAutoAppImage.image = #imageLiteral(resourceName: "switch (2)")
            autoApproval = false
            isAutoApproved = 1
        }else
        {
            mAutoAppImage.image = #imageLiteral(resourceName: "switch (3)")
            autoApproval = true
            isAutoApproved = 0

        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == selectCarTF{
            pickerValue = 0
           // carDetail()
        }else if textField == bankTF{
            pickerValue = 1
           // wallet()
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
        getCurrenttime()

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
extension RideDetailsVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerValue == 0{
            if (self.CarDetailArray?.count == 0)
            {
                return 1
            }
            return self.CarDetailArray?.count  ?? 0
        }else{
            if mileArray.count != 0{
                return mileArray.count
            }else{
                return 0
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerValue == 0{
            if (self.CarDetailArray?.count == 0)
            {
                return NSAttributedString(string: "No Car Available", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])

            }
            return NSAttributedString(string: self.CarDetailArray?[row].car_name ?? "", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        }else{
            return NSAttributedString(string: mileArray[row], attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerValue == 0
        {
            
            if (self.CarDetailArray?.count == 0)
            {
             selectCarTF.text = ""
             carId = ""
            return
            }
        
        }
        selectCarTF.text = self.CarDetailArray?[row].car_name ?? ""
        carId = self.CarDetailArray?[row].car_id ?? ""
            // check  Thread 1: Fatal error: Index out of range
            if mileArray.count > 0{
            bankTF.text = "\(mileArray[row])"
          
            }
        
    }
    
}

//
//MARK:- API Method
extension RideDetailsVC{
    func carDetail() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.carDetails.removeAll()
        UserVM.sheard.carDetails(car_user: userID) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    print(response)
                    self.CarDetailArray = [CarDetail]()
                    self.CarDetailArray = CarDetail.modelsFromDictionaryArray(array: response!["data"] as! NSArray)
                    self.carPicker.reloadAllComponents()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func details() {
       
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.getRideDetails(user_id : userID,from_lat : rideFromLat,from_long : rideFromLong,to_lat : rideToLat, to_long : rideToLong) { (success, response,message, error)  in
            if error == nil{
                print(response)
                if response != nil{
                self.rideDetaiDict = OfferRideDetailModel.init(dictionary: response! as NSDictionary)
                let amount = self.rideDetaiDict?.get_distance?.amount ?? 0
                self.priceCount = amount
                self.aPriceLbl.text = "\(amount)"
                Indicator.sharedInstance.hideIndicator()
                
                }else{
                    self.showAlert(message: message)
                    
                }
                if success{
                 //   self.aPriceLbl.text = ""
                    
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func wallet(){
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.wallet(user_id: userID) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    print(response)
                    self.carPicker.reloadAllComponents()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    //MAR:- Other Ride Book Api
    func offerRideApi() {
        Indicator.sharedInstance.showIndicator()
        var local_ride = String()
        if is_local_ride == true{
            local_ride = "1"
        }else{
            local_ride = "0"
        }
        print("ridedate--\(ridedate)")
        let dateString = ridedate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        
        

        let dateObj = dateFormatter.date(from: dateString) ?? Date()

        dateFormatter.dateFormat = "MM-dd-yyyy"
    
        let   date = "\(dateFormatter.string(from: dateObj))"
    
        UserVM.sheard.createRide(ride_user: userID, ride_from_address: rideFromAdd, ride_to_address: rideToAdd, ride_from_lat: rideFromLat, ride_from_long: rideFromLong, ride_to_lat: rideToLat, ride_to_long: rideToLong, ride_from_address2: address2, ride_from_lat2: rideLat2, ride_from_long2: rideLong2, ride_from_address3: address3, ride_from_lat3: rideLat3, ride_from_long3: rideLong3, ride_date: date, ride_time: rideTime, ride_amount: aPriceLbl.text!, ride_seat: seatsLbl.text!, ride_about: commentTView.text!, car_id: carId, detour: "0", is_local_ride: local_ride, current_time: self.currentTime, is_autoapproval: "\(isAutoApproved)") { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    print(response)
                  
                    let rideId = response!["ride_id"]as? String
                    let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createRidePopUp") as! createRidePopUp
                    //popOverVC.bookDetail =
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
