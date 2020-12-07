//
//  CarDetailsListVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 31/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

protocol carDetailsdelegate {
    func deatils(type : Int,text : String)
}


class CarDetailsListVC: BaseVC {
   
    @IBOutlet var headerLblTxt: UILabel!
    @IBOutlet var carDetailsTblView: UITableView!
    
    var detailType = 0
    var carmake = ""
    var carmodel = ""
    var textdat = ""
    var delegate : carDetailsdelegate?
    var colorArr = ["White","Silver","Black","Grey","Blue","Red","Brown","Green"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
      setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        if detailType == 0 {
            carmakeApi()
       }
        else if (detailType == 1){
            carmodelApi()
       }
        else if (detailType == 2){
           caryearApi()
        }
        else{
        }
        
    }

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK:- Tableview Methods

extension CarDetailsListVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if detailType == 0 {
          return  UserVM.sheard.makeListData.count
        }
        else if (detailType == 1){
          return  UserVM.sheard.modelListData.count
        }
        else if (detailType == 2){
          return UserVM.sheard.yearListData.count
        }
        else{
          return  colorArr.count
        }
      
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? UITableViewCell
        cell?.backgroundColor = .white
        if detailType == 0 {
            cell?.textLabel?.text = UserVM.sheard.makeListData[indexPath.row].make
        }
        else if (detailType == 1){
            cell?.textLabel?.text = UserVM.sheard.modelListData[indexPath.row].model
        }
        else if (detailType == 2){
            cell?.textLabel?.text = UserVM.sheard.yearListData[indexPath.row].year
        }
        else{
            cell?.textLabel?.text = colorArr[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           if self.detailType == 0 {
                self.textdat = UserVM.sheard.makeListData[indexPath.row].make ?? ""
                self.delegate?.deatils(type: 0, text: self.textdat)
               self.navigationController?.popViewController(animated: true)
            
            }
            else if (self.detailType == 1){
                self.textdat = UserVM.sheard.modelListData[indexPath.row].model ?? ""
                self.delegate?.deatils(type: 1, text: self.textdat)
               self.navigationController?.popViewController(animated: true)
           
    
               }
           else if (self.detailType == 2){
                self.textdat = UserVM.sheard.yearListData[indexPath.row].year ?? ""
                 self.delegate?.deatils(type: 2, text: self.textdat)
               self.navigationController?.popViewController(animated: true)
            
            }
            else{
                self.textdat = self.colorArr[indexPath.row]
                  self.delegate?.deatils(type: 3, text: self.textdat)
               self.navigationController?.popViewController(animated: true)
          
            }
    
    }
    
}

//MARK:-  Api Methods

//MARK: - API Methods
extension CarDetailsListVC{
    
    func carmakeApi(){
        UserVM.sheard.makeListData.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.carMakeList { (success, message, error) in
            if error == nil{
              if success{
                    self.carDetailsTblView.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
                   }   }
            }

    func carmodelApi(){
        UserVM.sheard.modelListData.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.carModel(make: carmake) { (success, message, error) in
            if error == nil{
                if success{
                    self.carDetailsTblView.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }   }
    }
    
    func caryearApi(){
        UserVM.sheard.modelListData.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.carYear(make : carmake,model : carmodel) { (success, message, error) in
            if error == nil{
                if success{
                    
                    self.carDetailsTblView.reloadData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }   }
    }
}


//MARK:- Delegate Methd and Set Data



