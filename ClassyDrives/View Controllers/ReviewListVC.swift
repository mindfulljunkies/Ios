//
//  ReviewListVC.swift
//  ClassyDrives
//
//  Created by Sukhwinder Singh on 18/11/19.
//  Copyright © 2019 Safal Bhatia. All rights reserved.
//

import UIKit

class ReviewListVC: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getList()
        self.tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    func getList()
    {
        UserVM.sheard.ratingDetails.removeAll()
       let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
//UserVM.sheard..count != 0
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.getReviewDetail(userid: userID) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                   self.tableView.reloadData()
//                self.showAlert(message: message)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }    }

    }
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension ReviewListVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserVM.sheard.ratingDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCellID")as! ReviewsTableViewCell
        let detail = UserVM.sheard.ratingDetails[indexPath.row]
        cell.nameLbl.text = detail.firstname
        cell.dateLbl.text = detail.created_date.getCurrentShortDate()
        cell.commentLbl.text = detail.rate_comment
        cell.img.loadImageUsingCache(withUrl: detail.pic ?? "")
        if let number = detail.rate_star
        
        {
            cell.ratingView.rating = Double(number)!
        }
        return cell
    }
    
}
