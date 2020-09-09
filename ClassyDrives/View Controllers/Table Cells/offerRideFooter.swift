//
//  offerRideFooter.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 14/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class offerRideFooter: UITableViewCell {

    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var detourTF: UITextField!
    @IBOutlet var timeTF: UITextField!
    @IBOutlet var dateTF: UITextField!
    @IBOutlet var dropLocationTF: UITextField!
    
    @IBOutlet var detourView: UIView!
    @IBOutlet var timeView: UIView!
    @IBOutlet var dateView: UIView!
    @IBOutlet var dropView: UIView!
    
    var DropBtnAtn:((offerRideFooter)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        nextBtn.setButtonBorder()
        detourView.setShadow()
        timeView.setShadow()
        dateView.setShadow()
        dropView.setShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func dropLocationBtnAtn(_ sender: Any) {
        DropBtnAtn?(self)
    }
    
    @IBAction func detourBtnAtn(_ sender: Any) {
    }
    
    @IBAction func nextBtnAtn(_ sender: Any) {
    }
    
}
