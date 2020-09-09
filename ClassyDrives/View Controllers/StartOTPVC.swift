//
//  StartOTPVC.swift
//  ClassyDrives
//
//  Created by Shami Kapoor on 10/12/19.
//  Copyright © 2019 Safal Bhatia. All rights reserved.
//

import UIKit

class StartOTPVC: BaseVC {
    var bookId : String?
    var rideId : String?
    
    @IBOutlet weak var otpTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func checkRide(){

        if (otpTF.text?.length == 0)
        {
            self.showAlert(message: "Please enter OTP")
            return
        }
        Indicator.sharedInstance.showIndicator()
       
        UserVM.sheard.deleteRide(user_id: userID, ride_id: rideId ?? "" ,  action: "1", cancel_reason: "",  comment: "" ,book_id: bookId ?? "" , book_code : otpTF.text ?? "" ) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.navigationController?.popViewController(animated: true)
                    //   self.showAlert(message: message)
                }else{
                    NotificationAlert().NotificationAlert(titles: message!)

                }
            }else{
                //self.showAlert(message: error?.domain)
            }    }
    }
    @IBAction func startRideAction(_ sender: Any) {
        self.checkRide()
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
