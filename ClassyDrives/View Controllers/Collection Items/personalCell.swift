//
//  personalCell.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView
class personalCell: UICollectionViewCell {

    @IBOutlet var userImg: UIImageView!
    @IBOutlet var userName: UILabel!
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var stateLbl: UILabel!
    @IBOutlet var cityLbl: UILabel!
    @IBOutlet var editBtn: UIButton!
    @IBOutlet var paymentBtn: UIButton!
    @IBOutlet var bioLbl: UILabel!
    @IBOutlet var starView: FloatRatingView!
    @IBOutlet var phoneVarifyImg: UIImageView!
    @IBOutlet var paymentVarifyImg: UIImageView!
    
    
    var paymentAtn:((personalCell)->Void)?
    var editAtn:((personalCell)-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        userImg.layer.cornerRadius = userImg.frame.height/2
        userImg.clipsToBounds = true
        userImg.layer.borderColor = UIColor.black.cgColor
        userImg.layer.borderWidth = 2
        paymentBtn.addTarget(self, action: #selector(paymentBtnAtn), for: .touchUpInside)
    }

    @objc func paymentBtnAtn(){
        paymentAtn?(self)
    }
    
    @IBAction func editBtnAtn(_ sender: Any) {
        editAtn?(self)
    }
    
}
