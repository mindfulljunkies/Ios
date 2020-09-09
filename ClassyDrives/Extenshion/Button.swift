//
//  Button.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func setButtonBorder() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.alpha = 0.8
        self.clipsToBounds = true
    }
    func setBodderLine(lineWidth: CGFloat) {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = lineWidth
    }
}

extension UIView{
    func setShadow() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 5
    }
}
