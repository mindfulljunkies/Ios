//
//  NotificationAlert.swift
//  ALLAG
//
//  Created by Tech Farmerz on 18/10/18.
//  Copyright © 2018 Gagn deep. All rights reserved.
//

import Foundation
import BRYXBanner
class NotificationAlert {
    
    func NotificationAlert(titles:String){
        let banner = Banner(title: "", subtitle: titles, image: UIImage(named: "logo"), backgroundColor: .white)
        banner.dismissesOnTap = true
        banner.tintColor = #colorLiteral(red: 0.07450980392, green: 0.07450980392, blue: 0.07450980392, alpha: 1)
        banner.titleLabel.textColor = #colorLiteral(red: 0.07450980392, green: 0.07450980392, blue: 0.07450980392, alpha: 1)
        banner.textColor = #colorLiteral(red: 0.07450980392, green: 0.07450980392, blue: 0.07450980392, alpha: 1)
        banner.imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        banner.show(duration: 3.0)
        }
   
//    func NotificationAlertWithTime(titles:String,time:TimeInterval){
//        let banner = Banner(title: "Alert", subtitle: titles, image: #imageLiteral(resourceName: "wopadu Logo"), backgroundColor: .black)
//        banner.dismissesOnTap = true
//        banner.show(duration: time)
//    }
   
   
}
