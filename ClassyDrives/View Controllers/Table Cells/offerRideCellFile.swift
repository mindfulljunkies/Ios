//
//  offerRideCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 09/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class offerRideCellFile: UITableViewCell {
    @IBOutlet var cellImg: UIImageView!
    @IBOutlet var cellName: UITextField!
    @IBOutlet var cellBtn: UIButton!
    @IBOutlet var cellView: UIView!
    
    var cellAtn:((offerRideCellFile)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.setShadow()
        cellBtn.addTarget(self, action: #selector(cellBtnAtn), for: .touchUpInside)
        
    }
    
    @objc func cellBtnAtn(){
        cellAtn?(self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
