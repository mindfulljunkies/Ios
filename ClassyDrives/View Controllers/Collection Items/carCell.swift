//
//  carCell.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class carCell: UICollectionViewCell {

    @IBOutlet var carImg: UIImageView!
    
    @IBOutlet var makeLbl: UILabel!
    @IBOutlet var modellbl: UILabel!
    @IBOutlet var yearLbl: UILabel!
    
    @IBOutlet var plusBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        plusBtn.layer.shadowColor = UIColor.gray.cgColor
        plusBtn.layer.shadowOpacity = 1
        plusBtn.layer.shadowOffset = CGSize.zero
        plusBtn.layer.shadowRadius = 5
    }

}
