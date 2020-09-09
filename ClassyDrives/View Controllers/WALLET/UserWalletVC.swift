//
//  UserWalletVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 31/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class UserWalletVC: BaseVC {
    @IBOutlet var cardListTblview: UITableView!
   @IBOutlet var accountNumberTblview: UITableView!
    
    @IBOutlet weak var mBalanceLbl: UILabel!
    
    var headerArr = ["Saved Card","Saved Bank Account"]
    var userApi : UserAPI?

    override func viewDidLoad() {
        super.viewDidLoad()
        cardListTblview.register(UINib.init(nibName: "cardCellFile", bundle: nil), forCellReuseIdentifier: "cardCellFile")
        userApi = UserAPI.sharedInstance
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        wallet()
    }
    @IBAction func backPressBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
    @IBAction func addMoneyBtn(_ sender: Any) {
        let addBankVC = self.storyboard?.instantiateViewController(withIdentifier: "AddMoneyVCID") as! AddMoneyVC
        self.navigationController?.pushViewController(addBankVC, animated: true)
    }
    @IBAction func addCardBtn(_ sender: Any) {
        let addBankVC = self.storyboard?.instantiateViewController(withIdentifier: "AddCardDetailsVC") as! AddCardDetailsVC
        self.navigationController?.pushViewController(addBankVC, animated: true)
    }
    
    @IBAction func mCashBtnAct(_ sender: Any) {
        let dict : Dictionary<String, AnyObject> = ["user_id":userID as AnyObject]
        self.cashOut(userDict: dict, method: "payOut")
        
    }
    
    
}


//MARK:- Tableview Methods

extension UserWalletVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserVM.sheard.walletDetails.count != 0{
            if section == 0{
                return UserVM.sheard.walletDetails[0].card.count
            }else if section == 1{
                return UserVM.sheard.walletDetails[0].bank.count
            }else{
                return 0
            }
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        tableView.reloadData()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCellFile") as! cardCellFile
        cell.mBaseVw.setShadow()
        if indexPath.section == 0{
            
            cell.accountLbl.text = "XXXXXXXXXXXX\(UserVM.sheard.walletDetails[0].card[indexPath.row].digits!)"
            cell.deteleAtn = { (action) in
                self.deleteCard(card_id: UserVM.sheard.walletDetails[0].card[indexPath.row].id!)
            }
        }else{
            
            cell.accountLbl.text = "XXXXXXXX\(UserVM.sheard.walletDetails[0].bank[indexPath.row].digits!)"
            cell.deteleAtn = { (action) in
                self.deleteBank(bank_id: UserVM.sheard.walletDetails[0].bank[indexPath.row].id!)
            }
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headder = Bundle.main.loadNibNamed("walletHeader", owner: self, options: nil)?.first as! walletHeader
        headder.headerLbl.text = headerArr[section]
        headder.addAtn = { (action) in
            if section == 0{
                let story = self.storyboard?.instantiateViewController(withIdentifier: "AddCardDetailsVC") as! AddCardDetailsVC
                self.navigationController?.pushViewController(story, animated: true)
            }else if section == 1{
                let story = self.storyboard?.instantiateViewController(withIdentifier: "AddBankVC") as! AddBankVC
                self.navigationController?.pushViewController(story, animated: true)
            }
        }
        return headder
    }
}
extension UserWalletVC{
    func wallet() {
        UserVM.sheard.walletDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.wallet(user_id: userID) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    let wallets = UserVM.sheard.walletDetails[0].wallet
                    if wallets != ""{
                    self.mBalanceLbl.text = "$\(wallets ?? "0")"
                    }else{
                         self.mBalanceLbl.text = "$0"
                    }
                    self.cardListTblview.reloadData()
                }else{
                    //self.showAlert(message: message)
                  
                }
            }else{
               // self.showAlert(message: error?.domain)
            }
        }
    }
    func cashOut(userDict:Dictionary<String,AnyObject>,method:String){
        
        userApi!.allPostRequests(userDetials: userDict, method: method) { (isSuccess, response, error) in
            if isSuccess == true{
                if let data = response!["Error"]as? String{
                    
                    self.showAlert(message: data)
                    
                }else{
                    if let message = response!["message"]as? String{
                    self.showAlert(message: message)
                    }
                    self.wallet()
                }
            }else{
                print(userDict)
                
            }
        }
    }
    func deleteBank(bank_id: String) {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.bankDelete(user_id: userID, bank_id: bank_id) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.wallet()
                }else{
                    self.showAlert(message: message)
                }
            }else{
              //  self.showAlert(message: error?.domain)
            }
        }
    }
    
    func deleteCard(card_id: String) {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.cardDelete(user_id: userID, card_id: card_id) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.wallet()
                }else{
                   // self.showAlert(message: message)
                }
            }else{
//                self.showAlert(message: error?.domain)
            }
        }
    }
    
    
    
    
}
