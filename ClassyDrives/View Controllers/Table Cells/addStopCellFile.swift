//
//  addStopCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class addStopCellFile: UITableViewCell {
    @IBOutlet var addStpBtn: UIButton!
    
    var addStopAtn:((addStopCellFile)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        addStpBtn.setButtonBorder()
        
        addStpBtn.addTarget(self, action: #selector(cellBtnAtn), for: .touchUpInside)
    }

    @objc func cellBtnAtn(){
        addStopAtn?(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
