//
//  givenCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 12/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class givenCellFile: UITableViewCell {
    @IBOutlet var backView: UIView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var picLbl: UILabel!
    @IBOutlet var dropLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        backView.setShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
