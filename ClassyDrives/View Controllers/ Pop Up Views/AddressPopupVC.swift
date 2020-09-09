//
//  AddressPopupVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 16/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class AddressPopupVC: BaseVC {
    @IBOutlet var topLbl: UILabel!
    @IBOutlet var addressTAble: UITableView!
    
    var delegate:DataEnteredDelegate!
    
    var textValue = Int()
    var codevalue = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        if textValue == 1{
            stateAPI()
        }else if textValue == 2{
            print("\(codevalue)")
            cityAPI(stateID: codevalue)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view == view{
            self.view.removeFromSuperview()
        }
    }
    
    @IBAction func cancelBtnAtn(_ sender: Any) {
        self.view.removeFromSuperview()
    }
}

//MARK:- Table Methods
extension AddressPopupVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  textValue == 1{
            return UserVM.sheard.stateDetails.count
        }else if textValue == 2{
            return UserVM.sheard.cityDetails.count
        }else{
            return 0
        }
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib.init(nibName: "AddressPopupCellFile", bundle: nil), forCellReuseIdentifier: "AddressPopupCellFile")
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressPopupCellFile") as! AddressPopupCellFile
        if textValue == 1{
            cell.NameLbl.text = UserVM.sheard.stateDetails[indexPath.row].sName
        }else if textValue == 2{
           cell.NameLbl.text = UserVM.sheard.cityDetails[indexPath.row].city
        }else{
            cell.NameLbl.text = "0"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if textValue == 1{
            self.delegate.selectedData(name: UserVM.sheard.stateDetails[indexPath.row].sName, Id: UserVM.sheard.stateDetails[indexPath.row].id, txtValue: 1)
        }else{
            self.delegate.selectedData(name: UserVM.sheard.cityDetails[indexPath.row].city, Id: UserVM.sheard.cityDetails[indexPath.row].id, txtValue: 2)
        }
        self.view.removeFromSuperview()
    }
}

//MARK:- API Methods
extension AddressPopupVC{
    func stateAPI( ) {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.stateDetails.removeAll()
        UserVM.sheard.state { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.addressTAble.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func cityAPI(stateID: String) {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.cityDetails.removeAll()
        UserVM.sheard.city(state_id: stateID) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.addressTAble.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}
