//
//  DriverVC.swift
//  ClassyDrives
//
//  Created by Shami Kapoor on 16/12/19.
//  Copyright © 2019 Safal Bhatia. All rights reserved.
//

import UIKit
import SDWebImage
import FloatRatingView
class DriverVC: BaseVC {

    @IBOutlet weak var driveView: MSBView!
    @IBOutlet weak var ssnView: MSBView!
    @IBOutlet weak var drivingVerified: UILabel!
    @IBOutlet weak var ssnVerified: UILabel!
    @IBOutlet weak var phoneVerify: UILabel!
    @IBOutlet weak var chat_cancel: UIImageView!
    @IBOutlet weak var music_cancel: UIImageView!
    @IBOutlet weak var smoke_cancel: UIImageView!
    @IBOutlet weak var pet_cancel: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rating: FloatRatingView!
    @IBOutlet weak var img: UIImageView!
    var userId : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userProfileApi(userId: userId ?? "")
        // Do any additional setup after loading the view.
    }
    func setUIData(){
            phoneVerify.text = "Verified"
            phoneVerify.textColor = #colorLiteral(red: 0.4470588235, green: 0.7019607843, blue: 0.05882352941, alpha: 1)
        if UserVM.sheard.profileDetails[0].profiledata[0].driving_status == "0"{
            
            drivingVerified.text = "Verify"
            drivingVerified.textColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            driveView.isHidden = true
            
        }else{
            drivingVerified.text = "Verified"
            drivingVerified.textColor = #colorLiteral(red: 0.4470588235, green: 0.7019607843, blue: 0.05882352941, alpha: 1)
            driveView.isHidden = false
         }
        
        
        if UserVM.sheard.profileDetails[0].profiledata[0].ssn_status == "0"{
            
            ssnVerified.text = "Verify"
            ssnVerified.textColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            ssnView.isHidden = true
            
        }else{
            ssnVerified.text = "Verified"
            ssnVerified.textColor = #colorLiteral(red: 0.4470588235, green: 0.7019607843, blue: 0.05882352941, alpha: 1)
            ssnView.isHidden = false
         }
        let url = UserVM.sheard.profileDetails[0].profiledata[0].pic ?? ""
         if url != nil {
            img.sd_setImage(with: URL(string: url))
        }
        name.text =  UserVM.sheard.profileDetails[0].profiledata[0].fname
//        emailTxt.text = UserVM.sheard.profileDetails[0].profiledata[0].email
        desc.text = UserVM.sheard.profileDetails[0].profiledata[0].bio
//        phoneTxt.text = UserVM.sheard.profileDetails[0].profiledata[0].mobile
        if  UserVM.sheard.profileDetails[0].profiledata[0].rating != ""{
            rating.rating =  Double(UserVM.sheard.profileDetails[0].profiledata[0].rating) as! Double
        }
        if UserVM.sheard.profileDetails[0].profiledata[0].is_music == "1"{
            music_cancel.image = UIImage(named: "music")
        }
        else{
            music_cancel.image = UIImage(named: "music_cancel")
        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_chat == "1"{
            chat_cancel.image = UIImage(named: "chat_profile")
        }
        else{
            chat_cancel.image = UIImage(named: "chat_cancel")
        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_pets == "1"{
            pet_cancel.image = UIImage(named: "pet")
        }
        else{
            pet_cancel.image = UIImage(named: "pet_cancel")
        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_smoking == "1"{
            smoke_cancel.image = UIImage(named: "smoke")
        }
        else{
            smoke_cancel.image = UIImage(named: "smoke_cancel")
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
//MARK: - API Methods
extension DriverVC{
    func userProfileApi(userId : String){
        UserVM.sheard.profileDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.userProfile(userid: userId) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    print(message)
               self.setUIData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
  }
}
