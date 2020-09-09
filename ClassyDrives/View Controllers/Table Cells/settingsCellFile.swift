//
//  settingsCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class settingsCellFile: UITableViewCell {

    @IBOutlet var backView: UIView!
    @IBOutlet var lblText: UILabel!
    @IBOutlet var cellImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.setShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
