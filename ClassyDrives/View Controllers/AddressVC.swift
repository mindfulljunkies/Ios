//
//  AddressVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class AddressVC: BaseVC, DataEnteredDelegate{
    
    
    @IBOutlet var stateTf: UITextField!
    @IBOutlet var cityTF: UITextField!
    @IBOutlet var zipTF: UITextField!
    @IBOutlet var stateView: UIView!
    @IBOutlet var cityView: UIView!
    @IBOutlet var zipView: UIView!
    @IBOutlet var nextBtn: UIButton!
    
    
    var firstName = String()
    var lastName = String()
    var dob = String()
    
    var cityCode = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateView.setShadow()
        cityView.setShadow()
        zipView.setShadow()
        nextBtn.setButtonBorder()
    }
  
    @IBAction func nextBtnAtn(_ sender: Any) {
        
        if stateTf.text!.isEmpty {
            showAlert(message: "Please enter state.")
            return
        }
        if cityTF.text!.isEmpty {
            showAlert(message: "Please enter city.")
            return
        }
        if zipTF.text!.isEmpty {
            showAlert(message: "Please enter Zip code.")
            return
        }
        
        if !stateTf.text!.isEmpty && !cityTF.text!.isEmpty && !zipTF.text!.isEmpty{
//            UserDefaults.standard.set(stateTf.text!, forKey: "state")
//            UserDefaults.standard.set(cityTF.text!, forKey: "city")
//            UserDefaults.standard.set(zipTF.text!, forKey: "zip")
            let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"createAccountVC") as! createAccountVC
            story.firstName = firstName
            story.lastName = lastName
            story.dob = dob
            story.state = stateTf.text!
            story.city = cityTF.text!
            story.zip = zipTF.text!
            navigationController?.pushViewController(story, animated: true)
        }
    }
    @IBAction func skipBtnAtn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"createAccountVC") as! createAccountVC
        story.firstName = firstName
        story.lastName = lastName
        story.dob = dob
        navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func stateBtnAtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressPopupVC") as! AddressPopupVC
        popOverVC.textValue = 1
        popOverVC.delegate = self
        self.addChild(popOverVC)
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    @IBAction func cityBtnAtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddressPopupVC") as! AddressPopupVC
        popOverVC.textValue = 2
        popOverVC.codevalue = cityCode
        popOverVC.delegate = self
        self.addChild(popOverVC)
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }

    func selectedData(name: String, Id: String, txtValue: Int) {
        print(name, Id, txtValue)
        
        if txtValue == 1{
            stateTf.text = name
            cityCode = Id
        }else if txtValue == 2{
            cityTF.text = name
        }
    }
}
