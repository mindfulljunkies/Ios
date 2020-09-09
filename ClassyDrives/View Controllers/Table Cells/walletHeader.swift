//
//  walletHeader.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 18/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class walletHeader: UITableViewCell {
    @IBOutlet var headerLbl: UILabel!
    
    var addAtn:((walletHeader)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func addBtnAtn(_ sender: Any) {
        addAtn?(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
