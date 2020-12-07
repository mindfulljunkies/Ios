//
//  UserLicenessVerifyVC1.swift
//  ClassyDrives
//
//  Created by Chandan on 13/09/20.
//  Copyright © 2020 Safal Bhatia. All rights reserved.
//

import UIKit
import Alamofire
enum LicenseSide{
    case front
    case back
}
class UserLicenessVerifyVC1:BaseVC {
    @IBOutlet var firstNameTxt: UITextField!
    @IBOutlet var ssnTxt: UITextField!
    @IBOutlet var lastnameTxt: UITextField!
    @IBOutlet var dateofBirthTxt: UITextField!
    @IBOutlet var dateofinsurenceTxt: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var viewNew: UIView!
    @IBOutlet var stateTxt: UITextField!
    @IBOutlet var frontImg: UIImageView!
    var front:Bool = false
    var back:Bool = false
    var licenseSide:LicenseSide = .front
    @IBOutlet var backImg: UIImageView!
    var updatedImage : UIImage? =  nil
    @IBOutlet var licnessnmberTxt: UITextField!
     let imagePicker = UIImagePickerController()
     var picker = UIPickerView()
     var date = UIDatePicker()
       @IBOutlet var backView: UIView!
       @IBOutlet var ssnBtn: UIButton!
       @IBOutlet var licenseBtn: UIButton!
    var buttonValue = 1
    
    var frontPic:Bool = false
    var backPic:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
//
         buttonValue = 1
        backView.setShadow()
               backView.layer.cornerRadius = backView.frame.height/2
               
               licenseBtn.backgroundColor = .black
               licenseBtn.setTitleColor(.white, for: .normal)
               licenseBtn.layer.cornerRadius = licenseBtn.frame.height/2
               ssnBtn.layer.cornerRadius = ssnBtn.frame.height/2
               ssnBtn.clipsToBounds = true
               ssnBtn.clipsToBounds = true
               
        self.stateAPI()
        picker.delegate = self
        picker.dataSource = self
        stateTxt.delegate = self
        stateTxt.isUserInteractionEnabled = true
        dateofBirthTxt.delegate = self
        dateofinsurenceTxt.delegate = self
        licnessnmberTxt.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func givenBtnAtn(_ sender: Any) {
           licenseBtn.backgroundColor = .black
           licenseBtn.setTitleColor(.white, for: .normal)
           ssnBtn.backgroundColor = .white
           ssnBtn.setTitleColor(.black, for: .normal)
        scrollView.isHidden = false
        viewNew.isHidden = true
          buttonValue = 2
           
           
       }
    
    
    @IBAction func frontBtnAtn(_ sender: Any) {
        licenseSide = .front
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
    
    
    @IBAction func backBtnAtn(_ sender: Any) {
        licenseSide = .back
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
    
    
    @IBAction func receivedBtnAtn(_ sender: Any) {
        licenseBtn.backgroundColor = .white
        scrollView.isHidden = true
        viewNew.isHidden = false
        licenseBtn.setTitleColor(.black, for: .normal)
        ssnBtn.backgroundColor = .black
        ssnBtn.setTitleColor(.white, for: .normal)
        buttonValue = 1
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sendBtnActn(_ sender: Any) {
        drivingLicence()
        
    }
    
    @IBAction func skipBtnActn(_ sender: Any) {


        let story = self.storyboard?.instantiateViewController(withIdentifier:"MainTabVC") as! MainTabVC
        DataManager.isLogin = true
        self.navigationController?.pushViewController(story, animated: true)
        
    }
    
    @IBAction func sendSSnBtnActn(_ sender: Any) {
        verifySSN()
        
    }
    
    @IBAction func stateBtn(_ sender: Any) {
    }
   
    func statePickerView(){
          
           let toolbar = UIToolbar()
           toolbar.sizeToFit()
           picker.backgroundColor = .black
           toolbar.backgroundColor = .black
           stateTxt.inputAccessoryView = toolbar
           stateTxt.inputView = self.picker
           self.picker.setValue(UIColor.white, forKeyPath: "textColor")

        
           let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
           cancelBtn.tintColor = .white
           let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.insuranceDoneAction(sender:)))
           doneBtn.tintColor = .white
           let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

           toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
        picker.reloadAllComponents()
       }
    
    func insurancePickerView(){
        self.date.datePickerMode = .date
        self.date.backgroundColor = .black
        self.date.setValue(UIColor.white, forKeyPath: "textColor")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .black
        dateofinsurenceTxt.inputAccessoryView = toolbar
        dateofinsurenceTxt.inputView = self.date

               
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
        cancelBtn.tintColor = .white
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.insuranceDoneAction(sender:)))
        doneBtn.tintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
    }
    func datePickerView(){
        self.date.datePickerMode = .date
        self.date.backgroundColor = .black
        self.date.setValue(UIColor.white, forKeyPath: "textColor")
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.backgroundColor = .black
        dateofBirthTxt.inputAccessoryView = toolbar
        dateofBirthTxt.inputView = self.date

               
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancelBtn))
        cancelBtn.tintColor = .white
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneAction(sender:)))
        doneBtn.tintColor = .white
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        toolbar.setItems([cancelBtn,flexSpace,doneBtn], animated: true)
    }
    @objc func doneAction(sender: UITextField)  {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        dateofBirthTxt.text = "\(formatter.string(from: date.date))"
        self.view.endEditing(true)
    }
    @objc func insuranceDoneAction(sender: UITextField)  {
           let formatter = DateFormatter()
           formatter.dateFormat = "MMM dd,yyyy"
           dateofinsurenceTxt.text = "\(formatter.string(from: date.date))"
           self.view.endEditing(true)
       }
    @objc func cancelBtn(){
        self.view.endEditing(true)
    }
//    @objc func finddoneAction()  {
//          let formatter = DateFormatter()
//          formatter.dateFormat = "MM-dd-yyyy"
//          dateofBirthTxt.text = "\(formatter.string(from: date.date))"
//          self.dateofBirthTxt.endEditing(true)
//      }
}
extension UserLicenessVerifyVC1 : UITextFieldDelegate
{
     func textFieldDidBeginEditing(_ textField: UITextField) {
                if textField == dateofBirthTxt{
                    self.datePickerView()
            }
        
   else if textField == dateofinsurenceTxt{
                    self.insurancePickerView()
        }
        else if textField == stateTxt{
                  self.statePickerView()
//                    self.insurancePickerView()
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == licnessnmberTxt)
        {
        let maxLength = 14
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
        }
        return false
    }
    func verifySSN(){
        
        if ssnTxt.text?.isEmpty ?? false{
            showAlert(message: "Please enter SSN number")
            return
        }
        
         Indicator.sharedInstance.showIndicator()
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""

        UserVM.sheard.verifySSN(user_id: userID, snn:ssnTxt.text ?? "") { (success, message, error) in
             if error == nil{
                 Indicator.sharedInstance.hideIndicator()
                 if success{

                   

                     let story = self.storyboard?.instantiateViewController(withIdentifier:"MainTabVC") as! MainTabVC
                     DataManager.isLogin = true
                     self.navigationController?.pushViewController(story, animated: true)

                 }else{
                     self.showAlert(message: message)
                 }
             }else{
                 self.showAlert(message: error?.domain)
             }
         }
     }
    
    
  func  drivingLicence(){
    
    
    if !frontPic{
        showAlert(message: "Please upload the front pic on left side")
       return
    }
    if !backPic{
        showAlert(message: "Please upload the back pic on right side")
   return
    }
    
    if firstNameTxt.text?.isEmpty ?? false{
        showAlert(message: "Please enter first name")
        return
    }
    if lastnameTxt.text?.isEmpty ?? false{
          showAlert(message: "Please enter last name")
          return
      }
    
    if dateofBirthTxt.text?.isEmpty ?? false{
        showAlert(message: "Please enter date of birth")
        return
    }
    
    if dateofinsurenceTxt.text?.isEmpty ?? false{
        showAlert(message: "Please enter date of insurance")
        return
    }
    if stateTxt.text?.isEmpty ?? false{
        showAlert(message: "Please select the state")
        return
    }
    if licnessnmberTxt.text?.isEmpty ?? false{
        showAlert(message: "Please enter the license number")
        return
    }
    
        let userID = UserDefaults.standard.value(forKey: "LoginID") as? String ?? ""
      let imgData = self.frontImg.image?.jpegData(compressionQuality: 0.5)
        let imgData1 = self.backImg.image?.jpegData(compressionQuality: 0.5)
        
        
          Indicator.sharedInstance.showIndicator()
         
       
         
        let parameters = ["user_id": userID, "first_name": self.firstNameTxt.text ?? "", "last_name": self.lastnameTxt.text ?? "", "dob": self.dateofBirthTxt.text ?? "", "doi": self.dateofinsurenceTxt.text ?? "","state": self.stateTxt.text ?? "","license_number":self.licnessnmberTxt.text ?? ""] as [String : Any]
          
          Alamofire.upload(multipartFormData: {
              
              
              multipartFormData in
              multipartFormData.append(imgData!, withName: "driving_license_img_front", fileName: "file.jpg", mimeType: "image/jpg")
            
            multipartFormData.append(imgData1!, withName: "driving_license_img_back", fileName: "file.jpg", mimeType: "image/jpg")
              
              for (key, value) in parameters {
                  multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
              }
          },
                           usingThreshold:UInt64.init(),
                  to:"https://classydrives.com/api/driving_license",
                           method:.post,
                           encodingCompletion: { encodingResult in
                              switch encodingResult {
                              case .success(let upload, _, _):
                                  upload.responseJSON { response in
                                      Indicator.sharedInstance.hideIndicator()
                                      let valueData = response.result.value
                                      if let valueDict = valueData as? NSDictionary{
                                          let success = valueDict[APIKeys.kstatus] as? Int ?? 0
                                          let message = valueDict[APIKeys.kmessage] as? String
                                          if success == 1{
                                             

                                              let story = self.storyboard?.instantiateViewController(withIdentifier:"MainTabVC") as! MainTabVC
                                              DataManager.isLogin = true
                                              self.navigationController?.pushViewController(story, animated: true)
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



//MRK:- Picker View Methid


extension UserLicenessVerifyVC1{
func stateAPI() {
    Indicator.sharedInstance.showIndicator()
    UserVM.sheard.stateDetails.removeAll()
    UserVM.sheard.state { (success, message, error) in
        if error == nil{
            Indicator.sharedInstance.hideIndicator()
            if success{
//                self.picker.reloadAllComponents()
            }else{
                self.showAlert(message: message)
            }
        }else{
            self.showAlert(message: error?.domain)
        }
    }
    }
}
//MARK:- pickerView
extension UserLicenessVerifyVC1: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return UserVM.sheard.stateDetails.count

    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UserVM.sheard.stateDetails[row].sName

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateTxt.text = UserVM.sheard.stateDetails[row].sName
    
}
}


extension UserLicenessVerifyVC1 : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage]! as? UIImage {
              updatedImage = pickedImage
            
            switch licenseSide {
            case .back:
                backPic = true
                self.backImg.image = self.updatedImage
            case .front:
                frontPic = true
                self.frontImg.image = self.updatedImage
            }
            
            
            
            dismiss(animated: true, completion: nil)
        
        }
    }
}
