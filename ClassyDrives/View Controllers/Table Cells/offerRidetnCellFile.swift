//
//  offerRidetnCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 15/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class offerRidetnCellFile: UITableViewCell {
    @IBOutlet var bgview: UIView!
    @IBOutlet var locationNameTF: UITextField!
    @IBOutlet var cancelImg: UIImageView!
    
    var addLocationAtn:((offerRidetnCellFile) -> Void)?
    var cellAtn:((offerRidetnCellFile)->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        bgview.setShadow()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addLocationBtnAtn(_ sender: Any) {
        addLocationAtn?(self)
    }
    
    @IBAction func cancelBtnAtn(_ sender: Any) {
        cellAtn?(self)
    }
    
}
