//
//  carDetailVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class carDetailVC: BaseVC{

    @IBOutlet var modelView: UIView!
    @IBOutlet var makeView: UIView!
    @IBOutlet var yearView: UIView!
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var modelTF: UITextField!
    @IBOutlet var makeTF: UITextField!
    @IBOutlet var yearTF: UITextField!
    
    @IBOutlet var carMakeTx: UITextField!
    @IBOutlet var carYearTxt: UITextField!
    @IBOutlet var carModelTxt: UITextField!
    @IBOutlet var carColorTxt: UITextField!
    
    
    var delegate: DataEnteredDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelView.setShadow()
        makeView.setShadow()
        yearView.setShadow()
        colorView.setShadow()
        addBtn.setButtonBorder()
    }
    
    @IBAction func addCarBtnAtn(_ sender: Any) {
        addCar()
    }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func carMakeBtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "CarDetailsListVC") as! CarDetailsListVC
        story.detailType = 0
        story.delegate = self
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func carModelBtn(_ sender: Any) {
        if carMakeTx.text == ""{
            self.showAlert(message: "Please enter car Make Comapny")
            return
        }
        let story = self.storyboard?.instantiateViewController(withIdentifier: "CarDetailsListVC") as! CarDetailsListVC
        story.detailType = 1
        story.carmake = carMakeTx.text!
        story.delegate = self
        self.navigationController?.pushViewController(story, animated: true)
    }
    @IBAction func carBtnYear(_ sender: Any) {
        if carMakeTx.text == ""{
            self.showAlert(message: "Please enter car Make Comapny")
            return
        }
        if carMakeTx.text == ""{
            self.showAlert(message: "Please enter car model")
            return
        }
        let story = self.storyboard?.instantiateViewController(withIdentifier: "CarDetailsListVC") as! CarDetailsListVC
        story.detailType = 2
        story.carmake = carMakeTx.text!
        story.delegate = self
        story.carmodel = carModelTxt.text!
        self.navigationController?.pushViewController(story, animated: true)
    }
    @IBAction func carColorBtn(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier: "CarDetailsListVC") as! CarDetailsListVC
        story.detailType = 3
        story.delegate = self
        self.navigationController?.pushViewController(story, animated: true)
    }
}

//MARK: - API Methods
extension carDetailVC{
    func addCar() {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.addCar(car_name: carMakeTx.text!, car_model: carModelTxt.text!, car_year: carYearTxt.text!, car_image: "", car_user: userID, car_color: carColorTxt.text ?? "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                   // self.delegate.selectedData(name: "car", Id: "1", txtValue: 1)
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

//MARK:- Set Data
extension carDetailVC : carDetailsdelegate {
    func deatils(type: Int, text: String) {
        if type == 0 {
            self.carMakeTx.text = text
        }
        else if (type == 1){
            self.carModelTxt.text = text
        }
        else if (type == 2){
            self.carYearTxt.text = String(text)
        }
        else{
            self.carColorTxt.text = text
        }
    }
}
