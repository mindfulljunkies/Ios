//
//  offerSelectMangeRideCell.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 28/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import FloatRatingView

class offerSelectMangeRideCell: UITableViewCell {
    @IBOutlet var userImg: UIImageView!
    @IBOutlet var bioLbl: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var picAddress: UILabel!
    @IBOutlet var dropAddress: UILabel!
    @IBOutlet var seat: UILabel!
    @IBOutlet var rejactBtn: UIButton!
    @IBOutlet var profileBtn: UIButton!
    @IBOutlet var acceptBtn: UIButton!
    @IBOutlet var ratingView: FloatRatingView!
    @IBOutlet var requestResponseLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        userImg.layer.cornerRadius = userImg.frame.height/2
//        userImg.clipsToBounds = true
    }
    
    @IBAction func rejectBtnAtn(_ sender: Any) {
    }
    
    @IBAction func acceptBtnAtn(_ sender: Any) {
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
