//
//  AddMoneyTableViewCell.swift
//  ClassyDrives
//
//  Created by Sukhwinder Singh on 14/11/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class AddMoneyTableViewCell: UITableViewCell {
    @IBOutlet weak var mLbl: UILabel!
    
    @IBOutlet weak var mCheckBoxBtn: UIButton!
    
    @IBOutlet weak var mBaseVw: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
