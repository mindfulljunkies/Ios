//
//  UserProfileVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 25/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView
class UserProfileVC: BaseVC {

    
    @IBOutlet weak var mExpLbl: UILabel!
    @IBOutlet weak var mEmerLbl: UILabel!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var ratingView: FloatRatingView!
    @IBOutlet var nameTXt: UILabel!
    @IBOutlet var emailTxt: UILabel!
    @IBOutlet var descTxt: UILabel!
    @IBOutlet var phoneTxt: UILabel!
    @IBOutlet var petImage: UIImageView!
    @IBOutlet var smokingImg: UIImageView!
    @IBOutlet var musicImg: UIImageView!
    @IBOutlet var chatImg: UIImageView!
    @IBOutlet weak var mPhoneVerfiedLbkl: UILabel!
    @IBOutlet weak var mSSNVerfiedLbl: UILabel!
    @IBOutlet weak var mDrivingLicLbl: UILabel!

    var isSSNVerfied : Bool = false
    var isDriveLicVerfied : Bool = false

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImage.layer.cornerRadius = 40
        userImage.layer.masksToBounds = true
        
      
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        userProfileApi()
    }
    func setUIData(){
        let url = UserVM.sheard.profileDetails[0].profiledata[0].pic ?? ""
         if url != nil {
            userImage.sd_setImage(with: URL(string: url))
        }
        nameTXt.text =  UserVM.sheard.profileDetails[0].profiledata[0].fname
        emailTxt.text = UserVM.sheard.profileDetails[0].profiledata[0].email
        descTxt.text = UserVM.sheard.profileDetails[0].profiledata[0].bio
        phoneTxt.text = UserVM.sheard.profileDetails[0].profiledata[0].mobile
        if  UserVM.sheard.profileDetails[0].profiledata[0].rating != ""{
            ratingView.rating =  Double(UserVM.sheard.profileDetails[0].profiledata[0].rating) as! Double
        }
        if UserVM.sheard.profileDetails[0].profiledata[0].is_music == "1"{
            musicImg.image = UIImage(named: "music")
        }
        else{
            musicImg.image = UIImage(named: "music_cancel")
        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_chat == "1"{
            chatImg.image = UIImage(named: "chat_profile")
        }
        else{
            chatImg.image = UIImage(named: "chat_cancel")
        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_pets == "1"{
            petImage.image = UIImage(named: "pet")
        }
        else{
            petImage.image = UIImage(named: "pet_cancel")
        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_smoking == "1"{
            smokingImg.image = UIImage(named: "smoke")
        }
        else{
            smokingImg.image = UIImage(named: "smoke_cancel")
        }
        if UserVM.sheard.profileDetails[0].profiledata[0].relative_mobile != nil{
            mEmerLbl.text = UserVM.sheard.profileDetails[0].profiledata[0].relative_mobile ?? ""
        }
        if let lvl = UserVM.sheard.profileDetails[0].profiledata[0].experienceLevel{
            mExpLbl.text = "\(lvl)"
        }
        if UserVM.sheard.profileDetails[0].profiledata[0].ssn_status == "0"{
            mSSNVerfiedLbl.text = "Verify"
            mSSNVerfiedLbl.textColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            isSSNVerfied = false
        }else{
            mSSNVerfiedLbl.text = "Verified"
            mSSNVerfiedLbl.textColor = #colorLiteral(red: 0.4470588235, green: 0.7019607843, blue: 0.05882352941, alpha: 1)
            isSSNVerfied = true

        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].driving_status == "0"{
            mDrivingLicLbl.text = "Verify"
            mDrivingLicLbl.textColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1)
            isDriveLicVerfied = false
        }else{
            mDrivingLicLbl.text = "Verified"
            mDrivingLicLbl.textColor = #colorLiteral(red: 0.4470588235, green: 0.7019607843, blue: 0.05882352941, alpha: 1)
            isDriveLicVerfied = true

        }
        
    }

    @IBAction func mReviewBtnAct(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "ReviewListVC") as! ReviewListVC
              self.navigationController?.pushViewController(story, animated: true)
    }
    
    
    @IBAction func walletBtnActn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "UserWalletVC") as! UserWalletVC
        self.navigationController?.pushViewController(story, animated: true)
    }
    // Note: remove comment & segue identity
    
    
    @IBAction func licenceBtnActn(_ sender: Any) {
        if isDriveLicVerfied == false{

      let story = self.storyboard?.instantiateViewController(withIdentifier: "UserLicenessVerifyVC") as! UserLicenessVerifyVC
        self.navigationController?.pushViewController(story, animated: true)
        }
    }
   
    @IBAction func ssnVerfiyBtn(_ sender: Any) {
          if isSSNVerfied == false{
        let story = self.storyboard?.instantiateViewController(withIdentifier: "UserssnVerficationVC") as! UserssnVerficationVC
        self.navigationController?.pushViewController(story, animated: true)
        }
    }
   
    @IBAction func phoneVerifyBtn(_ sender: Any) {
    }
    
    @IBAction func addessBtnActn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "SaveUserAddressVC") as! SaveUserAddressVC
        story.homeaddress = UserVM.sheard.profileDetails[0].profiledata[0].address ?? ""
        story.workaddress = UserVM.sheard.profileDetails[0].profiledata[0].work_address ?? ""
        story.favouriteaddress = UserVM.sheard.profileDetails[0].profiledata[0].favourite_address ?? ""
        self.navigationController?.pushViewController(story, animated: true)
    }
   
    @IBAction func editBtnActn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "updateProfileVC") as! updateProfileVC
        self.navigationController?.pushViewController(story, animated: true)
    }
}

//profileDetails

//MARK: - API Methods
extension UserProfileVC{
    func userProfileApi(){
        UserVM.sheard.profileDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.userProfile(userid: userID) { (success, message, error) in
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
