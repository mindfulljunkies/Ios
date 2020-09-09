//
//  ChatingTableViewCell.swift
//  ClassyDrives
//
//  Created by apple on 27/08/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class ChatingTableViewCell: UITableViewCell {

    @IBOutlet weak var mSenderTimeLbl: UILabel!
    @IBOutlet weak var mSenderLbl: UILabel!
    @IBOutlet weak var mReciverTimeLbl: UILabel!
    @IBOutlet weak var mReciverLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
