//
//  cardCellFile.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 20/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class cardCellFile: UITableViewCell {
    @IBOutlet var accountLbl: UILabel!
    
    @IBOutlet weak var mBaseVw: UIView!
    
    var deteleAtn:((cardCellFile)-> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func deleteBtnatn(_ sender: Any) {
        deteleAtn?(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
