//
//  AddressPopupCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 16/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class AddressPopupCellFile: UITableViewCell {
    @IBOutlet var bgView: UIView!
    @IBOutlet var NameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.setShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
