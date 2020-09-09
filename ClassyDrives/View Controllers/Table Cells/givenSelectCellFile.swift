//
//  givenSelectCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 14/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView
class givenSelectCellFile: UITableViewCell {
    
    @IBOutlet var cellImg: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var pickUpLbl: UILabel!
    @IBOutlet var dropLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var bgView: UIView!
    @IBOutlet var ratingView: FloatRatingView!
    
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
