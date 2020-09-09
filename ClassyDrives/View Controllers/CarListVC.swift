//
//  CarListVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 25/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class CarListVC: UIViewController {
    @IBOutlet var cardListTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        cardListTblView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    func userProfileApi(){
          UserVM.sheard.profileDetails.removeAll()
          Indicator.sharedInstance.showIndicator()
          UserVM.sheard.userProfile(userid: userID) { (success, message, error) in
              if error == nil{
                  Indicator.sharedInstance.hideIndicator()
                  if success{
                      print(message)
                    
                    self.cardListTblView.reloadData()
                  }else{
                      
                  }
              }else{
                  
              }
          }
    }
    
    @IBAction func addCarAction(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "carDetailVC") as! carDetailVC
        self.navigationController?.pushViewController(story, animated: true)
    }
    

}

//MARK:- Tableview Methods

extension CarListVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserVM.sheard.profileDetails[0].carData.count > 0{
        return UserVM.sheard.profileDetails[0].carData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib.init(nibName: "carDetailscellXib", bundle: nil), forCellReuseIdentifier: "carDetailscellXib")
        let cell = tableView.dequeueReusableCell(withIdentifier: "carDetailscellXib") as! carDetailscellXib
        cell.backgroundColor = .white
        cell.carModelLbl.text =  UserVM.sheard.profileDetails[0].carData[indexPath.row].name
        cell.makeLbl.text = UserVM.sheard.profileDetails[0].carData[indexPath.row].model
        cell.colorLbl.text = UserVM.sheard.profileDetails[0].carData[indexPath.row].car_color
        cell.manfuYearLbl.text = UserVM.sheard.profileDetails[0].carData[indexPath.row].year
    
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    
}
