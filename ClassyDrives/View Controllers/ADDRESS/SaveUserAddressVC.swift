//
//  SaveUserAddressVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 28/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class SaveUserAddressVC: BaseVC {
    @IBOutlet var homeAddressTxt: UILabel!
    @IBOutlet var workAdressTxt: UILabel!
    @IBOutlet var favouriteAddressTxt: UILabel!
    
    var homeaddress = ""
    var workaddress = ""
    var favouriteaddress = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        homeAddressTxt.layer.cornerRadius = 6
        homeAddressTxt.layer.borderColor = UIColor.lightGray.cgColor
        homeAddressTxt.layer.borderWidth = 0.2
        homeAddressTxt.layer.masksToBounds = true
        homeAddressTxt.text = homeaddress
        homeAddressTxt.padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        workAdressTxt.layer.cornerRadius = 6
        workAdressTxt.layer.borderColor = UIColor.lightGray.cgColor
        workAdressTxt.layer.borderWidth = 0.3
        workAdressTxt.layer.masksToBounds = true
        workAdressTxt.text = workaddress
        workAdressTxt.padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        favouriteAddressTxt.layer.cornerRadius = 6
        favouriteAddressTxt.layer.borderColor = UIColor.lightGray.cgColor
        favouriteAddressTxt.layer.borderWidth = 0.3
        favouriteAddressTxt.layer.masksToBounds = true
        favouriteAddressTxt.text = favouriteaddress
        favouriteAddressTxt.padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)

    }
    
    @IBAction func favouriteAddressBtn(_ sender: Any) {
        let Vc = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        Vc.isComingforSaveAddress = true
        Vc.index = 3
        Vc.addressDelegate = self
        self.navigationController?.pushViewController(Vc, animated: true)
        
    }
    @IBAction func workAddress(_ sender: Any) {
        let Vc = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        Vc.isComingforSaveAddress = true
        Vc.index = 2
        Vc.addressDelegate = self
        self.navigationController?.pushViewController(Vc, animated: true)
    }
    @IBAction func editHomeAddress(_ sender: Any) {
        let Vc = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        Vc.isComingforSaveAddress = true
        Vc.index = 1
        Vc.addressDelegate = self
        self.navigationController?.pushViewController(Vc, animated: true)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


//MARK:- Protocol Delegate Method

extension SaveUserAddressVC : userAddressDelegate{
    func addressData(index: Int, address: String) {
        if index == 1 {
          addAddress(type : "address",address : address)
            homeAddressTxt.text = address
        }
        else if (index == 2) {
            addAddress(type : "work_address",address : address)
            workAdressTxt.text = address
        }
        else{
             addAddress(type : "favourite_address",address : address)
            favouriteAddressTxt.text = address
        }
     }
 }

//MARK:- Api Method

extension SaveUserAddressVC{
    func addAddress(type : String,address : String) {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.addAddress(work_type : type,user_id : userID,favourite_address : address) { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                  
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
}

extension UILabel {
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
//    override open func draw(_ rect: CGRect) {
//        if let insets = padding {
//            self.drawText(in: rect.inset(by: insets))
//        } else {
//            self.drawText(in: rect)
//        }
//    }
    
//    override open var intrinsicContentSize: CGSize {
//        guard let text = self.text else { return super.intrinsicContentSize }
//        
//        var contentSize = super.intrinsicContentSize
//        var textWidth: CGFloat = frame.size.width
//        var insetsHeight: CGFloat = 0.0
//        var insetsWidth: CGFloat = 0.0
//        
//        if let insets = padding {
//            insetsWidth += insets.left + insets.right
//            insetsHeight += insets.top + insets.bottom
//            textWidth -= insetsWidth
//        }
//        
//        let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
//                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
//                                        attributes: [NSAttributedString.Key.font: self.font], context: nil)
//        
//        contentSize.height = ceil(newSize.size.height) + insetsHeight
//        contentSize.width = ceil(newSize.size.width) + insetsWidth
//        
//        return contentSize
//    }
}
