//
//  updateProfileVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 28/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import Alamofire

class updateProfileVC: BaseVC{

    @IBOutlet var userImg: UIImageView!
    @IBOutlet var editBtn: UIButton!
    @IBOutlet var firstView: UIView!
    @IBOutlet var lastView: UIView!
    @IBOutlet var bioView: UIView!
 
    @IBOutlet var fNameTF: UITextField!
    @IBOutlet var lNameTF: UITextField!
    @IBOutlet var bioTF: UITextView!
    @IBOutlet var saveBtn: UIButton!
    
    @IBOutlet var smokingImage: UIImageView!
    @IBOutlet var petImage: UIImageView!
    @IBOutlet var musicImage: UIImageView!
    @IBOutlet var chatImg: UIImageView!
    
    @IBOutlet weak var mEmerVW: UIView!
    @IBOutlet weak var mEmergTxt: UITextField!
    
    
    
    //MARK:- Variables
    var updatedImage : UIImage? =  nil
    let imagePicker = UIImagePickerController()
    var  isPet = ""
    var isSmoke = ""
    var ischat = ""
    var isMusic = ""
    
    var cityCode = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        userImg.layer.cornerRadius = userImg.frame.height/2
        userImg.clipsToBounds = true
        mEmergTxt.delegate = self
        editBtn.setButtonBorder()
        firstView.setShadow()
        lastView.setShadow()
        bioView.setShadow()
        mEmerVW.setShadow()
     //   stateView.setShadow()
      //  cityView.setShadow()
        saveBtn.setButtonBorder()
        userProfileApi()
    }
    
    func setUIData(){
        let url = UserVM.sheard.profileDetails[0].profiledata[0].pic ?? ""
        if url != nil {
            userImg.sd_setImage(with: URL(string: url))
        }
        fNameTF.text =  UserVM.sheard.profileDetails[0].profiledata[0].fname
        lNameTF.text = UserVM.sheard.profileDetails[0].profiledata[0].email
        bioTF.text = UserVM.sheard.profileDetails[0].profiledata[0].bio
      
        if UserVM.sheard.profileDetails[0].profiledata[0].is_smoking == "0"{
            smokingImage.image = UIImage(named: "smoke_cancel")

            isSmoke = "0"
        }
        else{
            smokingImage.image = UIImage(named: "smoke")

            isSmoke = "1"
        }
        
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_chat == "0"{
            ischat = "0"
            chatImg.image = UIImage(named: "chat_cancel")

        }
        else{
            chatImg.image = UIImage(named: "chat_profile")

               ischat = "1"
        }
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_pets == "0"{
            petImage.image = UIImage(named: "pet_cancel")

            isPet = "0"
        }
        else{
            petImage.image = UIImage(named: "pet")

             isPet = "1"
        }
        
      
        
        if UserVM.sheard.profileDetails[0].profiledata[0].is_music == "0"{
            musicImage.image = UIImage(named: "music_cancel")

            isMusic = "0"
        }
        else{
            isMusic = "1"

            musicImage.image = UIImage(named: "music")

        }
        
    }
    
    @IBAction func chatBtnActn(sender: AnyObject) {
        if chatImg.image == UIImage(named: "chat_profile") {
            chatImg.image = UIImage(named: "chat_cancel")
            ischat = "0"
        }
        else{
           chatImg.image = UIImage(named: "chat_profile")
            ischat = "1"
        }
    }
    
    @IBAction func musicBtnActn(sender: AnyObject) {
        if musicImage.image == UIImage(named: "music") {
            musicImage.image = UIImage(named: "music_cancel")
            isMusic = "0"
        }
        else{
            musicImage.image = UIImage(named: "music")
            isMusic = "1"
        }
    }
    
    @IBAction func smokingBtnActn(sender: AnyObject) {
        if smokingImage.image == UIImage(named: "smoke") {
            smokingImage.image = UIImage(named: "smoke_cancel")
            isSmoke = "0"
        }
        else{
            smokingImage.image = UIImage(named: "smoke")
            isSmoke = "1"
        }
    }
    
    @IBAction func petBtnActn(sender: AnyObject) {
        if petImage.image == UIImage(named: "pet") {
            petImage.image = UIImage(named: "pet_cancel")
            isPet = "0"
        }
        else{
            petImage.image = UIImage(named: "pet")
            isPet = "1"
        }
    }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func userImgBtn(_ sender: Any) {
    }
    
    @IBAction func editBtnAtn(_ sender: Any) {
        imagePicker.delegate = self
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default){ UIAlertAction in
            if(UIImagePickerController.isSourceTypeAvailable(.camera)){
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }else{
                // self.showAlert(message: "You don't have camera")
            }
        }
        let gallaryAction = UIAlertAction(title: "Gallery", style: .default){ UIAlertAction in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ UIAlertAction in
        }
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        alert.popoverPresentationController?.sourceView = self.view
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func stateBtnAtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressPopupVC") as! AddressPopupVC
        popOverVC.textValue = 1
    //    popOverVC.delegate = self
        self.addChild(popOverVC)
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    @IBAction func cityBtnAtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressPopupVC") as! AddressPopupVC
        popOverVC.textValue = 2
        popOverVC.codevalue = cityCode
      //  popOverVC.delegate = self
        self.addChild(popOverVC)
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    @IBAction func saveBtnAtn(_ sender: Any) {
        if updatedImage != nil{
           uploadImageAndData()
        }
        else{
           updateProfile()
        }
  }
    
    
 
}

//MARK:- ImagePicker
extension updateProfileVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage]! as? UIImage {
              updatedImage = pickedImage
            self.userImg.image = self.updatedImage
            dismiss(animated: true, completion: nil)
        
        }
    }
}


extension updateProfileVC{
    func updateProfile(){
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.updateProfileData(userid: userID, firstName: fNameTF.text!, lastName: lNameTF.text!, pic: "", city: "", state:"", zip: "", dob: "", bio: bioTF.text!,is_smoking : isSmoke,is_pets : isPet,is_music : isMusic,is_chat : ischat, relative_mobile: "+1" + (mEmergTxt.text ?? "") ) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.navigationController?.popViewController(animated: true)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func userProfileApi(){
        UserVM.sheard.profileDetails.removeAll()
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.userProfile(userid: userID) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    self.setUIData()
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    
      func uploadImageAndData(){
            let imgData = updatedImage?.jpegData(compressionQuality: 0.7)
            Indicator.sharedInstance.showIndicator()
            
        let parameters = ["userid": userID, "firstName": fNameTF.text!, "lastName": lNameTF.text!, "city": ""," state":"", "zip": "", "dob": "", "bio": bioTF.text!,"is_smoking" : isSmoke,"is_pets" : isPet,"is_music" : isMusic,"is_chat" : ischat,"relative_mobile": self.mEmergTxt.text!] as [String : Any]
            
            Alamofire.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData!, withName: "pic", fileName: "file.jpg", mimeType: "image/jpg")
                for (key, value) in parameters {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            },
                             usingThreshold:UInt64.init(),
                    to:"https://classydrives.com/api/updateProfile",
                             method:.post,
                             encodingCompletion: { encodingResult in
                                switch encodingResult {
                                case .success(let upload, _, _):
                                    upload.responseJSON { response in
                                        Indicator.sharedInstance.hideIndicator()
                                        let valueData = response.result.value
                                        if let valueDict = valueData as? NSDictionary{
                                            let success = valueDict[APIKeys.kstatus] as? String
                                            let message = valueDict[APIKeys.kmessage] as? String
                                            if success == "1"{
                                                //    UserVM.shared.parseUserData(responseDict: valueDict as! JSONDictionary)
                                                self.showAlert(message: "Updated successfully", title: "Profile", otherButtons: nil, cancelTitle: "Ok", cancelAction: nil)
                                            }else{
                                                self.showAlert(message: message)
                                            }
                                        }
                                    }
                                case .failure(let error):
                                    self.showAlert(message: error.localizedDescription)
                                }
            })
     //   }
        
    }
}
extension updateProfileVC : UITextFieldDelegate
{
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let maxLength = 10
    let currentString: NSString = textField.text! as NSString
    let newString: NSString =
        currentString.replacingCharacters(in: range, with: string) as NSString
    return newString.length <= maxLength
    }
}
