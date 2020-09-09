//
//  ReviewsTableViewCell.swift
//  ClassyDrives
//
//  Created by Sukhwinder Singh on 18/11/19.
//  Copyright © 2019 Safal Bhatia. All rights reserved.
//

import UIKit
import FloatRatingView
class ReviewsTableViewCell: UITableViewCell {
    @IBOutlet weak var ratingView: FloatRatingView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var cornerView: UIView!

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cornerView.layer.cornerRadius = 10.0
        cornerView.layer.borderColor = UIColor.lightGray.cgColor
        cornerView.layer.borderWidth = 1.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
