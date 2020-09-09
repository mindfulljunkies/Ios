//
//  carTableCell.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 25/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class carTableCell: UITableViewCell {

    @IBOutlet var modelLbl: UILabel!
    @IBOutlet var makeLbl: UILabel!
    @IBOutlet var yearLbl: UILabel!
    @IBOutlet var bgview: UIView!
    
    var deleteBtn:((carTableCell)-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        bgview.setShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteBtnAtn(_ sender: Any) {
        deleteBtn?(self)
    }
}
