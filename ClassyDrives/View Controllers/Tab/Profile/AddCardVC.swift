//
//  AddCardVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 18/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class AddCardVC: BaseVC, UITextFieldDelegate{
    @IBOutlet var cardNoView: UIView!
    @IBOutlet var expMonthView: UIView!
    @IBOutlet var expYearView: UIView!
    @IBOutlet var cvvView: UIView!
    @IBOutlet var addBtn: UIButton!
    
    @IBOutlet var cardNoTF: UITextField!
    @IBOutlet var monthTF: UITextField!
    @IBOutlet var yearTF: UITextField!
    @IBOutlet var cvvTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.setButtonBorder()
        cardNoView.setShadow()
        expMonthView.setShadow()
        expYearView.setShadow()
        cvvView.setShadow()
        
        cardNoTF.delegate = self
        monthTF.delegate = self
        yearTF.delegate = self
        cvvTF.delegate = self
    }
    @IBAction func backbtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addBtnAtn(_ sender: Any) {
        addCardData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = textField.text!.utf8.count + string.utf8.count - range.length
        if(textField == cvvTF){
            return newLength <= 19
        }else if(textField == monthTF){
            return newLength <= 2
        }else if(textField == yearTF){
            return newLength <= 4
        }else if(textField == cvvTF){
            return newLength <= 3
        }
         return true
    }
 }


//MARK: - API Methods
extension AddCardVC{
    func addCardData(){
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.addCard(user_id: userID, card_number: cardNoTF.text!, exp_month: monthTF.text!, cvv: cvvTF.text!, exp_year: yearTF.text!, card_type: "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    //                    self.showAlert(message: message)
                    self.navigationController?.popViewController(animated: true)
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
      }
}
