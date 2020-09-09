//
//  carDetailscellXib.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 25/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class carDetailscellXib: UITableViewCell {
    @IBOutlet var carModelLbl: UILabel!
    @IBOutlet var manfuYearLbl: UILabel!
    @IBOutlet var makeLbl: UILabel!
    @IBOutlet var colorLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
