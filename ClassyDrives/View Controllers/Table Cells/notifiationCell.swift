//
//  notifiationCell.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 20/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class notifiationCell: UITableViewCell {
    @IBOutlet var cellImg: UIImageView!
    @IBOutlet var cellLbl: UILabel!
    @IBOutlet var switchBtn: UISwitch!
    @IBOutlet var bgview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgview.setShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
