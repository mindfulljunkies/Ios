//
//  WalletVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 18/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class WalletVC: BaseVC {
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var walletTable: UITableView!
    
    var headerArr = ["Saved Card","Saved Bank"]
    override func viewDidLoad() {
        super.viewDidLoad()
       walletTable.register(UINib.init(nibName: "cardCellFile", bundle: nil), forCellReuseIdentifier: "cardCellFile")
    }
    override func viewWillAppear(_ animated: Bool) {
         wallet()
    }
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Table Methods
extension WalletVC: UITableViewDelegate, UITableViewDataSource{
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headder = Bundle.main.loadNibNamed("walletHeader", owner: self, options: nil)?.first as! walletHeader
        headder.headerLbl.text = headerArr[section]
        headder.addAtn = { (action) in
            if section == 0{
                let story = self.storyboard?.instantiateViewController(withIdentifier: "AddCardVC") as! AddCardVC
                self.navigationController?.pushViewController(story, animated: true)
            }else if section == 1{
                let story = self.storyboard?.instantiateViewController(withIdentifier: "AddBankVC") as! AddBankVC
                self.navigationController?.pushViewController(story, animated: true)
            }
        }
        return headder
    }
}

//MARK: - API Methods
extension WalletVC{
    func wallet() {
        UserVM.sheard.walletDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.wallet(user_id: userID) { (success,response, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.walletTable.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
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
                self.showAlert(message: error?.domain)
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
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    
    
    
}
