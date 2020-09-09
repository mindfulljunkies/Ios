//
//  AddCardDetailsVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 31/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import CreditCardForm
import Stripe

class AddCardDetailsVC: UIViewController,STPPaymentCardTextFieldDelegate {
let paymentTextField = STPPaymentCardTextField()
    @IBOutlet var cardView: CreditCardFormView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
       cardView.cardHolderString = ""
    }
    
    @IBAction func backPree(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
    
    @IBAction func nextAction(_ sender: Any) {
        //api call
        self.addCardData()
    }
    
    
    func createTextField() {
        paymentTextField.frame = CGRect(x: 15, y: 199, width: self.view.frame.size.width - 30, height: 44)
        paymentTextField.delegate = self
        paymentTextField.translatesAutoresizingMaskIntoConstraints = false
        paymentTextField.borderWidth = 0
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: paymentTextField.frame.size.height - width, width:  paymentTextField.frame.size.width, height: paymentTextField.frame.size.height)
        border.borderWidth = width
        paymentTextField.layer.addSublayer(border)
        paymentTextField.layer.masksToBounds = true
        
        view.addSubview(paymentTextField)

        NSLayoutConstraint.activate([
            paymentTextField.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 20),
            paymentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paymentTextField.widthAnchor.constraint(equalToConstant: self.view.frame.size.width-20),
            paymentTextField.heightAnchor.constraint(equalToConstant: 44)
            ])
    }
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        cardView.paymentCardTextFieldDidChange(cardNumber: textField.cardNumber, expirationYear: textField.expirationYear, expirationMonth: textField.expirationMonth, cvc: textField.cvc)
    }
    
    func paymentCardTextFieldDidEndEditingExpiration(_ textField: STPPaymentCardTextField) {
        cardView.paymentCardTextFieldDidEndEditingExpiration(expirationYear: textField.expirationYear)
    }
    
    func paymentCardTextFieldDidBeginEditingCVC(_ textField: STPPaymentCardTextField) {
        cardView.paymentCardTextFieldDidBeginEditingCVC()
    }
    
    //    func paymentCardTextFieldDidBeginEditing(_ textField: STPPaymentCardTextField) {
    //        creditCardForm.cardHolderString
    //    }
    
    func paymentCardTextFieldDidEndEditingCVC(_ textField: STPPaymentCardTextField) {
        cardView.paymentCardTextFieldDidEndEditingCVC()
    }
    
    
}


//MARK: - API Methods
extension AddCardDetailsVC{
    func addCardData(){
        print(cardView.cardHolderString)
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.addCard(user_id: userID, card_number: paymentTextField.cardNumber!, exp_month: "\(paymentTextField.expirationMonth)", cvv: "\(paymentTextField.cvc ?? "")", exp_year: "\(paymentTextField.expirationYear)" , card_type: "Visa") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    //                    self.showAlert(message: message)
                    self.navigationController?.popViewController(animated: true)
                }else{
//                    self.showAlert(message: message)
                }
            }else{
//                self.showAlert(message: error?.domain)
            }
        }
    }
}
