//
//  NotificationVC.swift
//  ClassyDrives
//
//  Created by Shami Kapoor on 04/03/20.
//  Copyright © 2020 Safal Bhatia. All rights reserved.
//

import UIKit

class NotificationVC: BaseVC {

    
    @IBOutlet weak var tableView: UITableView!
    var userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNotifications(userId: userID)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NotificationVC : UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print("UserVM.sheard.notification.count===\(UserVM.sheard.notification.count)")
            return UserVM.sheard.notification.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

             let user =   UserVM.sheard.notification
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotifyCell") as? NotifyCell
            cell?.titleLbl.text = user[indexPath.row].noti_text
            cell?.descriptionLbl.text = user[indexPath.row].noti_create
            cell?.deleteBtn.tag = indexPath.row
            cell?.deleteBtn.addTarget(self, action: #selector(deleteNoti), for: .touchUpInside)
                return cell ?? UITableViewCell()
    //        }
        }
        
        func getNotifications(userId : String){
              UserVM.sheard.notification.removeAll()
              Indicator.sharedInstance.showIndicator()
              UserVM.sheard.userNotifications(userid: userId) { (success, message, error) in
                  if error == nil{
                      Indicator.sharedInstance.hideIndicator()
                      if success{
                          print(message)
                        self.tableView.reloadData()
                      }else{
                          self.showAlert(message: message)
                      }
                  }else{
                      self.showAlert(message: error?.domain)
                  }
              }
        }
        
 @objc   func deleteNoti(sender : UIButton)
    {
        Indicator.sharedInstance.showIndicator()
        let deleteId =   UserVM.sheard.notification[sender.tag].noti_id ?? ""
        UserVM.sheard.deleteNotification(userid: userID, notifiID: deleteId) { (success, message, error) in
                         if error == nil{
                             Indicator.sharedInstance.hideIndicator()
                             if success{
                                 print(message)
                                self.getNotifications(userId: self.userID)
                             }else{
                                 self.showAlert(message: message)
                             }
                         }else{
                             self.showAlert(message: error?.domain)
                         }
                     }
    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
