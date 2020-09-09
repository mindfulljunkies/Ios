//
//  offerRedManageTableCell.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 29/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class offerRedManageTableCell: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var picLbl: UILabel!
    @IBOutlet var dropLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var localRideLbl: UILabel!
    @IBOutlet var arrowPoint: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.borderColor = UIColor.red.cgColor
        backView.layer.borderWidth = 1.5
        backView.layer.cornerRadius = 12
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowOffset = CGSize.zero
        backView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
