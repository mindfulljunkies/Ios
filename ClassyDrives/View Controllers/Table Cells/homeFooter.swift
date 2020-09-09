//
//  homeFooter.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 09/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class homeFooter: UITableViewCell {

    @IBOutlet var nextBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        nextBtn.setButtonBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
