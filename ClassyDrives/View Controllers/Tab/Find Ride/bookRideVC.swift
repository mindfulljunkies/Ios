//
//  bookRideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 25/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class bookRideVC: BaseVC, UITextFieldDelegate{
    var ManageRideDict : ManageRides?
    var bookRideViewModel:BookRideViewModel?
    var arrayResponseModel:ArrayResponseModel?
    @IBOutlet var seatView: UIView!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var subtractBtn: UIButton!
    @IBOutlet var seatsLbl: UILabel!
    @IBOutlet var cardView: UIView!
    @IBOutlet var cardTF: UITextField!
    @IBOutlet var bookRideBtn: UIButton!
    @IBOutlet weak var mSeatLbl: UILabel!
    @IBOutlet weak var mTSeatLbl: UILabel!
    @IBOutlet weak var mWalletLbl: UILabel!
    @IBOutlet weak var mEnterCodeTxt: UITextField!
    @IBOutlet weak var mTotalSeatVw: UIView!
    @IBOutlet weak var mWalletVw: UIView!
    var rideAmount : Int?
    var applied_id : String?
    @IBOutlet weak var mCodeVw: UIView!
    
    
    var seats = Int()
    var cardPicker = UIPickerView()
    var seatCount = 0
    var cardId = String()
    var index = Int()
    var avilableSeatCount  = ""
    var fixSeatCount = Int()
    var changeCount = Int()
    var rideId = String()
    var seat = String()
    var fromAddress = String()
    var fromLat = String()
    var fromlong = String()
    var toAddress = String()
    var toLat = String()
    var toLong = String()
    var amount = String()
    var distance = String()
    var etime = String()
    
    var pickup = String()
    var dropDistance = String()
    var discount = String()
    var applied = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        fixSeatCount = Int(seatsLbl.text!)!
        changeCount = Int(seatsLbl.text!)!
        seatsLbl.text = "0"
        mSeatLbl.text = "$ \(UserVM.sheard.allRideDetails[index].ride_amount ?? 0)"
        
        fixSeatCount = UserVM.sheard.allRideDetails[index].ride_seat ?? 0
        rideId = UserVM.sheard.allRideDetails[index].rideid
        fromAddress = UserVM.sheard.allRideDetails[index].ride_from_address
        fromLat = UserVM.sheard.allRideDetails[index].ride_from_lat
        fromlong = UserVM.sheard.allRideDetails[index].ride_from_long
        
        toAddress = UserVM.sheard.allRideDetails[index].ride_to_address
        toLat = UserVM.sheard.allRideDetails[index].ride_to_lat
        toLong = UserVM.sheard.allRideDetails[index].ride_to_long
        
        amount = String(UserVM.sheard.allRideDetails[index].ride_amount)
        distance = String(UserVM.sheard.allRideDetails[index].ride_distance!)
        etime = UserVM.sheard.allRideDetails[index].ride_duration ?? ""
       
        pickup = String(UserVM.sheard.allRideDetails[index].pickup_distance)
        dropDistance = String(UserVM.sheard.allRideDetails[index].dropup_distance!)
        discount = String(UserVM.sheard.allRideDetails[index].discountAmount)
        applied = String(UserVM.sheard.allRideDetails[index].applied_id!)

        seatView.setShadow()
        cardView.setShadow()
        mTotalSeatVw.setShadow()
        mWalletVw.setShadow()
        mCodeVw.setShadow()
        
        addBtn.setBodderLine(lineWidth: 1)
        subtractBtn.setBodderLine(lineWidth: 1)
        seatsLbl.layer.borderColor = UIColor.black.cgColor
        seatsLbl.layer.borderWidth = 1
        
        bookRideBtn.setButtonBorder()
//        cardTF.delegate = self
//
//        cardTF.inputAccessoryView = cardPicker
//        cardPicker.backgroundColor = .black
//        self.cardPicker.setValue(UIColor.white, forKeyPath: "textColor")
//        cardPicker.setValue(UIColor.yellow, forKeyPath: "textColor")
//        cardPicker.delegate = self
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        toolBar.barStyle = UIBarStyle.blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.gray
        let addCardBtn = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addCardBtn(sender:)))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(donePressed))
        toolBar.setItems([addCardBtn,flexSpace,doneButton], animated: true)
//        cardTF.inputAccessoryView = toolBar
//        cardTF.inputView = cardPicker
    }
    override func viewWillAppear(_ animated: Bool) {
         wallet()
    }
    @objc func addCardBtn(sender: UIBarButtonItem){
        let story = self.storyboard?.instantiateViewController(withIdentifier: "AddCardVC") as! AddCardVC
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//                self.allRides()

    }
    @objc func donePressed(sender: UIBarButtonItem) {
        cardTF.resignFirstResponder()
    }
    
    @IBAction func bookRideBtnAtn(_ sender: Any) {
        if seatsLbl.text == "0"{
          showAlert(message: "Please select seat")
            return
        }
        
        let wallets = UserVM.sheard.walletDetails[0].wallet
        if wallets == ""{
            let addBankVC = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyVCID") as! AddMoneyVC
            self.navigationController?.pushViewController(addBankVC, animated: true)
            return
        }
        bookRide()
//        navigationController?.popToRootViewController(animated: true)
    }
    
 
    
    @IBAction func mApplyBtnAct(_ sender: Any) {
        applyCoupun()
    }
    func applyCoupun()
    {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.discountAmount(userid: userID, ride_id: rideId, book_amount: String(UserVM.sheard.allRideDetails[index].ride_amount), coupon_code: self.mEnterCodeTxt.text ?? "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.mSeatLbl.text = "$ \(UserVM.sheard.discountAmount)"
                    self.amount = UserVM.sheard.discountAmount
                    self.applied_id = UserVM.sheard.applied_id

                    let totalAm = self.changeCount * (self.amount as NSString ).integerValue
                    self.mTSeatLbl.text! = "$ \(totalAm)"
                    
//                    self.bookRide()
//                    UserDefaults.standard.removeObject(forKey: "rideID")
//                    UserDefaults.standard.removeObject(forKey: "bookID")
//                    self.navigationController?.popViewController(animated: true)
                self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }    }
    }
    
    
    @IBAction func subtractBtn(_ sender: Any) {
        if changeCount > 0 {
            changeCount = changeCount - 1
            seatsLbl.text = String(changeCount)
            let totalAm = changeCount * (amount as NSString).integerValue
            self.mTSeatLbl.text! = "$ \(totalAm)"
        }
        
    }
    
     @IBAction func addBtnAtn(_ sender: Any) {
          if fixSeatCount != changeCount {
              changeCount = changeCount + 1
              seatsLbl.text = String(changeCount)
              let totalAm = changeCount * (amount as NSString).integerValue
              self.mTSeatLbl.text! = "$ \(totalAm)"
          }
          
    

      }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}


//MARK:- pickerView
extension bookRideVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if UserVM.sheard.walletDetails.count != 0{
                return UserVM.sheard.walletDetails[0].card.count
            }else{
                return 0
            }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
            return NSAttributedString(string: UserVM.sheard.walletDetails[0].card[row].digits, attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            cardTF.text = "XXXXXXXXXXXX\(UserVM.sheard.walletDetails[0].card[row].digits!)"
            cardId = UserVM.sheard.walletDetails[0].card[row].id
    }
}

//MARK:- API Method
extension bookRideVC{
    func wallet() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.wallet(user_id: userID) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    let wallets = UserVM.sheard.walletDetails[0].wallet
                    if wallets != ""{
                        self.mWalletLbl!.text = "$\(wallets ?? "0")"
                    }else{
                        self.mWalletLbl!.text = "$0"
                    }
                  self.allRides()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    
    }
    
    
    
    func bookRide() {
        Indicator.sharedInstance.showIndicator()
        let curDate = Date().dateToUTCString
        let dateFormat = convertDateFormater(curDate)
        
        UserVM.sheard.bookRideData(user_id: userID, book_ride: rideId, seat: seatsLbl.text!, ride_from_address: fromAddress, ride_from_lat: fromLat, ride_from_long: fromlong, ride_to_address: toAddress, ride_to_lat: toLat, ride_to_long: toLong, book_amount: self.mTSeatLbl.text!.replacingOccurrences(of: "$", with:""), book_distance: distance, book_elapsedtime: etime, book_card_id: cardId, is_local_ride: "", pickup_distance: pickup, dropup_distance: dropDistance, discountAmount:UserVM.sheard.discountAmount  , applied_id: applied_id ?? "", book_create: dateFormat) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    
                    self.getProductsList( sender: self, onSuccess: {
                    print(self.arrayResponseModel?.booked_ride ?? [])
                    
                    
                    if self.arrayResponseModel?.booked_ride?.count ?? 0 > 0{
                        let manageDict = self.arrayResponseModel?.booked_ride?[0]
                        
                        let story = self.storyboard?.instantiateViewController(withIdentifier: "OfferedRideDetailsVCID2") as! OfferedRideDetailsVC2
                        //                                story.selectIndex = 0
                            story.rideId = UserVM.sheard.rideID
                            story.bookid = UserVM.sheard.bookID
                            story.rideDetailDict = manageDict
                            story.isFromView = true
                            story.isFromRide = true
                            story.isReceived = true
                            //            story.cancelReason = "usercancel"
                            self.navigationController?.pushViewController(story, animated: true)
                    }
                    
                    }, onFailure: {

                    })
                    
                    
                    
                   
                   
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm:ss"
        return  dateFormatter.string(from: date!)
        
    }
}
//MARK: - API Methods
extension bookRideVC{
    func allRides(){
        UserVM.sheard.allRidesDetails.removeAll()
        //Indicator.sharedInstance.showIndicator()
//       getProductsList( sender: self, onSuccess: {
//        print(self.arrayResponseModel?.booked_ride ?? [])
//
//
//
//        }, onFailure: {
//
//        })
        

//        UserVM.sheard.manageRide(userid: userID) { (success, response,message, error) in
//            if error == nil{
//                Indicator.sharedInstance.hideIndicator()
//                if success{
//
//                    self.ManageRideDict = ManageRides.init(dictionary: response! as NSDictionary)
//                    print("THE RIDE DATA IS---->",self.ManageRideDict! ?? [])
//
//                }else{
//                    self.showAlert(message: message)
//                }
//            }else{
//                self.showAlert(message: error?.domain)
//            }
//        }
    }
    

       func getProductsList(sender:UIViewController,onSuccess:@escaping()->Void,onFailure:@escaping()->Void) {
    
               
               let params:[String:Any] = [APIKeys.kuser_id:userID]
               var tokenHeaders:[String:String]! = [:]
               
//                 if let token = Constants.kUserDefaults.string(forKey: appConstants.token){
//
//                      tokenHeaders = ["x-access-token":token,]
//                 }
               ServerManager.shared.httpPost(request:  BASE_URL.appending("manageRides"), params: params,headers: nil, successHandler: { (responseData:Data) in
                   DispatchQueue.main.async {
                       Indicator.sharedInstance.hideIndicator()
                       guard let response = responseData.decoder(ArrayResponseModel.self) else{return}
                       guard let status = response.status else{return}
                       switch status{
                       case 1:
                           
                          
                        self.arrayResponseModel = response
                           onSuccess()
                           break
                       default:
                           

                           onFailure()
                           break
                       }
                   }
               }, failureHandler: { (error) in
                   DispatchQueue.main.async {
                       
                       
                       onFailure()
                   }
               })
                      
                       

           }
}




class  BookRideViewModel: NSObject {
    
}
