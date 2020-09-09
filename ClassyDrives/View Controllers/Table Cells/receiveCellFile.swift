//
//  receiveCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 12/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView
class receiveCellFile: UITableViewCell {
    @IBOutlet var bgView: UIView!
    @IBOutlet var cellImg: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var picLbl: UILabel!
    @IBOutlet var dropLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var detourImg: UIImageView!
    @IBOutlet weak var mLblExpand: UILabel!
    
    //    @IBOutlet var starRating: FloatRatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
