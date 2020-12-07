//
//  ManageTableViewCell.swift
//  ClassyDrives
//
//  Created by apple on 18/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView

class ManageTableViewCell: UITableViewCell {
    @IBOutlet weak var pickLocation: UIView!
    @IBOutlet weak var dropLocation: UIView!
    @IBOutlet weak var stop1Location: UIView!
    @IBOutlet weak var stop2Location: UIView!
    @IBOutlet weak var mFrstLocImg: UIImageView!
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var mSecLocImg: UIImageView!
    
    @IBOutlet weak var mLocalRideLbl: UILabel!
    
    @IBOutlet weak var mExpandLbl2: UILabel!
    @IBOutlet weak var mCstntLoc2: NSLayoutConstraint!
    
    @IBOutlet weak var mCstntLoc1: NSLayoutConstraint!
    
    
    @IBOutlet var bgView: UIView!
    
    @IBOutlet var cellImg: UIImageView!
    
    @IBOutlet weak var sndLblHeight: NSLayoutConstraint!
    @IBOutlet var nameLbl: UILabel!
    
    @IBOutlet var picLbl: UILabel!
    
    @IBOutlet var dropLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var detourImg: UIImageView!
    @IBOutlet weak var mLblExpand: UILabel!
    
    @IBOutlet weak var mCntntImgWidht: NSLayoutConstraint!
    
    @IBOutlet weak var mCntntImgHgt: NSLayoutConstraint!
    @IBOutlet weak var fstLBlHeight: NSLayoutConstraint!
    
    @IBOutlet weak var fstLbl: UILabel!
    
    @IBOutlet weak var sndLbl: UILabel!
    
    @IBOutlet weak var mRatingVw: FloatRatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellImg.layer.cornerRadius = cellImg.frame.height/2
        cellImg.clipsToBounds = true
        
        bgView.layer.cornerRadius = 12
        bgView.layer.shadowColor = UIColor.gray.cgColor
        bgView.layer.shadowOpacity = 0.5
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
