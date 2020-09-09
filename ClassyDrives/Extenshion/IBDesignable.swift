//
//  IBDesignable.swift

import Foundation
import UIKit




@IBDesignable class MSBButton : UIButton{
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var maskToBound: Bool {
        get {
            return layer.masksToBounds
        }
        set {
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable var shadowEnable : CGFloat{
        get {
            return layer.shadowRadius
        }
        set {
            self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowOffset = CGSize(width: -3.0, height: 3.0)
            self.layer.shadowOpacity = 1.0
            self.layer.masksToBounds = false
            layer.shadowRadius = 3.0
        }
        
        //        if shadowEnable{
        //            self.layer.shadowColor = UIColor.darkGray.cgColor
        //            self.layer.shadowOffset = CGSize(width: -3.0, height: 3.0)
        //            self.layer.shadowOpacity = 1.0
        //            self.layer.shadowRadius = 3.0
        //            self.layer.masksToBounds = false
        //        }else{
        //
        //        }
    }
}


