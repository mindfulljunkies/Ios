//
//  FeedbackVC2.swift
//  ClassyDrives
//
//  Created by Chandan on 04/10/20.
//  Copyright © 2020 Safal Bhatia. All rights reserved.
//

import UIKit
import FloatRatingView
class FeedbackVC2: UIViewController {
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var cleanBTN: UIButton!
    @IBOutlet var saveBTN: UIButton!
    @IBOutlet var friendlyBTN: UIButton!
    @IBOutlet var lbl: UILabel!
    @IBOutlet var punBTN: UIButton!
    @IBOutlet var ratingView: FloatRatingView!
    @IBOutlet var commentTxtView: UITextView!
    var userName:String = ""
    var otherUserId:String = ""
    var  is_clean: String = "0"
   var is_friendly: String = "0"
    var is_safe: String = "0"
    var is_punctual: String = "0"
         
         var like_dislike: String = "1"
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text  = "What was great about by \(userName)!".uppercased()
        userImage.layer.cornerRadius = 40
        userImage.layer.masksToBounds = true
        commentTxtView.delegate = self
        commentTxtView.layer.cornerRadius = 6
        commentTxtView.layer.borderWidth = 0.5
        commentTxtView.layer.borderColor = UIColor.lightGray.cgColor
        
        cleanBTN.layer.cornerRadius = 6
        cleanBTN.layer.borderWidth = 0.5
        cleanBTN.layer.borderColor = UIColor.black.cgColor
        
        saveBTN.layer.cornerRadius = 6
        saveBTN.layer.borderWidth = 0.5
        saveBTN.layer.borderColor = UIColor.black.cgColor
        
        friendlyBTN.layer.cornerRadius = 6
        friendlyBTN.layer.borderWidth = 0.5
        friendlyBTN.layer.borderColor = UIColor.black.cgColor
        
        punBTN.layer.cornerRadius = 6
        punBTN.layer.borderWidth = 0.5
        punBTN.layer.borderColor = UIColor.black.cgColor
        
        
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
extension FeedbackVC2: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        commentTxtView.text = ""
        commentTxtView.textColor = .black
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if commentTxtView.text! == ""{
            commentTxtView.textColor = .lightGray
            commentTxtView.text = "More Details"
        }
    }
    
    @IBAction func mBackBtnAct(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cleanBtn(_ sender: Any) {
        
        cleanBTN.backgroundColor = .yellow
       is_clean = "1"
        
    }
    
    @IBAction func safeBtn(_ sender: Any) {
        saveBTN.backgroundColor = .yellow
       is_safe = "1"
        
    }
    
    @IBAction func friendlyBtn(_ sender: Any) {
        friendlyBTN.backgroundColor = .yellow
        is_friendly = "1"
    }
    
    @IBAction func punctualBtn(_ sender: Any) {
        punBTN.backgroundColor = .yellow
       is_punctual = "1"
        
    }
    @IBAction func nextBtn(_ sender: Any) {
       
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.feedback(rate_from_user: userID, rate_to_user: otherUserId, rate_star: "\(ratingView.rating)", rate_comment: commentTxtView.text ?? "", is_clean: is_clean, is_friendly: is_friendly, is_safe: is_safe, is_punctual: is_punctual, like_dislike: like_dislike)
         { (success, message, error) in
                  if error == nil{
                      Indicator.sharedInstance.hideIndicator()
                      if success{
                        self.navigationController?.popToRootViewController(animated: true)
        //                  self.showAlert(message: message)
                      }else{
                        //  self.showAlert(message: message)
                      }
                  }else{
                     // self.showAlert(message: error?.domain)
                  }
         }
    }
    
}
