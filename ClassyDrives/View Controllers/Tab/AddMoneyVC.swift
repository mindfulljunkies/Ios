//
//  AddMoneyVC.swift
//  ClassyDrives
//
//  Created by Sukhwinder Singh on 14/11/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class AddMoneyVC: BaseVC,UITextFieldDelegate {

    @IBOutlet weak var surchageLbl: UILabel!
    @IBOutlet weak var mAddMoneyVw: UIView!
    @IBOutlet weak var mAddMTxt: UITextField!
    @IBOutlet weak var mWalletTableView: UITableView!
    var userApi : UserAPI?
    var selectedIndex = Int()
    var selectValue : Bool?
    @IBOutlet weak var payLbl: UILabel!
    var selectedRows:[IndexPath] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        userApi = UserAPI.sharedInstance
        mAddMoneyVw.setShadow()
        mAddMTxt.delegate = self
        mAddMTxt.keyboardType = .numberPad
        mAddMTxt.addTarget(self, action: #selector(textFieldDidChange),  for: UIControl.Event.editingChanged)
surchageLbl.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wallet()
    }
    
    @IBAction func mProccedBtnAct(_ sender: Any) {
        Indicator.sharedInstance.showIndicator()

        if self.mAddMTxt.text != "" && selectValue == true {
        let dict : Dictionary<String, AnyObject> = ["user_id":userID as AnyObject,"card_id":UserVM.sheard.walletDetails[0].card[self.selectedIndex].id as AnyObject,"add_amount": self.mAddMTxt.text as AnyObject]
            self.setMoney(userDict: dict, method: "addMoneytoWallet")
        }else{
            self.showAlert(message: "Please select card or add amount")

        }
        
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
          if textField.text?.isEmpty == true || textField.text?.length == 0 || textField.text == ""
          {
           payLbl.text = ""
            surchageLbl.text = ""
          }
        else
          {
           if textField == mAddMTxt
           {
            
            let amount = NSDecimalNumber(string: textField.text).adding(0.30).dividing(by: 0.971)
            
            let fAmount =   String(format: "%.2f", (amount as? Double)!)
            
            let res =  NSDecimalNumber(string: fAmount).subtracting(NSDecimalNumber(string: textField.text))
            surchageLbl.text = "$ \(res)"
            payLbl.text = "$ \(fAmount)"
            }
        }
    }
    @IBAction func mAddCardBtnAct(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "AddCardDetailsVC") as! AddCardDetailsVC
        self.navigationController?.pushViewController(story, animated: true)
    }
    

    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - Table Methods
extension AddMoneyVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserVM.sheard.walletDetails.count != 0{
           
           return UserVM.sheard.walletDetails[0].card.count
          
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddMoneyTableViewCellID") as! AddMoneyTableViewCell
             cell.mBaseVw.setShadow()
            cell.mLbl.text = "XXXXXXXXXXXX\(UserVM.sheard.walletDetails[0].card[indexPath.row].digits!)"
        cell.mCheckBoxBtn.addTarget(self, action: #selector(checkBtnAct(sender:)), for: .touchUpInside)

       cell.mCheckBoxBtn.tag = indexPath.row
        if selectedRows.contains(indexPath)
        {
            cell.mCheckBoxBtn.setImage(#imageLiteral(resourceName: "iconfinder_check-box_326563"), for: .normal)
          
        }
        else
        {
            cell.mCheckBoxBtn.setImage(#imageLiteral(resourceName: "checkunfill"), for: .normal)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 49
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
    @objc func checkBtnAct(sender:UIButton){
        let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
       
        self.selectedRows.removeAll()
        
        if self.selectedRows.contains(selectedIndexPath)
        {
            
            self.selectedRows.remove(at: self.selectedRows.index(of: selectedIndexPath)!)
            self.selectedIndex = sender.tag
            selectValue = false

        }
        else
        {
            selectValue = true
            self.selectedRows.append(selectedIndexPath)
        }
     

        self.mWalletTableView.reloadData()

    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headder = Bundle.main.loadNibNamed("walletHeader", owner: self, options: nil)?.first as! walletHeader
//        headder.headerLbl.text = headerArr[section]
//        headder.addAtn = { (action) in
//            if section == 0{
//                let story = self.storyboard?.instantiateViewController(withIdentifier: "AddCardVC") as! AddCardVC
//                self.navigationController?.pushViewController(story, animated: true)
//            }else if section == 1{
//                let story = self.storyboard?.instantiateViewController(withIdentifier: "AddBankVC") as! AddBankVC
//                self.navigationController?.pushViewController(story, animated: true)
//            }
//        }
//        return headder
//    }
}
extension AddMoneyVC{
    
}
//MARK: - API Methods
extension AddMoneyVC{
    func wallet() {
        UserVM.sheard.walletDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.wallet(user_id: userID) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.mWalletTableView.reloadData()
                }else{
                    //self.showAlert(message: message)
                }
            }else{
                //self.showAlert(message: error?.domain)
            }
        }
    }
  
    // MARK: User SignIn Function
    func setMoney(userDict:Dictionary<String,AnyObject>,method:String){

        userApi!.allPostRequests(userDetials: userDict, method: method) { (isSuccess, response, error) in
            if isSuccess == true{
                Indicator.sharedInstance.hideIndicator()

                if let data = response!["Error"]as? String{
                
                    self.showAlert(message: data)
                   
                }else{
                   Indicator.sharedInstance.hideIndicator()
self.navigationController?.popViewController(animated: true)
                }
            }else{
                print(userDict)
                
            }
        }
    }
}
