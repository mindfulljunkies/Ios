//
//  createRidePopUp.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 25/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class createRidePopUp: BaseVC {
    @IBOutlet var cancelBtn: UIButton!
    @IBOutlet var viewBtn: UIButton!
    
    var rideFromAdd = String()
    var rideFromLat = String()
    var rideFromLong = String()
    
    var rideToAdd = String()
    var rideToLat = String()
    var rideToLong = String()
    
    var address2 = String()
    var rideLat2 = String()
    var rideLong2 = String()
    
    var address3 = String()
    var rideLat3 = String()
    var rideLong3 = String()
    
    var ridedate = String()
    var rideTime = String()
    var price = String()
    var seats = String()
    var car = String()
    var bank = String()
    var detour = String()
    var comment = String()
    var bookDetail : RideDetail?
    var rideId = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonDesign(btn: cancelBtn)
        buttonDesign(btn: viewBtn)
    }
    
    func buttonDesign( btn: UIButton)  {
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        btn.alpha = 0.8
        btn.clipsToBounds = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view == view{
            self.view.removeFromSuperview()
        }
    }
    @IBAction func cancelBtnAtn(_ sender: Any) {
//       for controller in self.navigationController!.viewControllers as [UIViewController] {
//            if controller is HomeVC {
                self.view.removeFromSuperview()
        self.navigationController?.popViewController(animated: true)
//                break
//            }
//        }
    }
    
    @IBAction func viewBtnAtn(_ sender: Any) {
        //givenSelectedRideVC
        let story = self.storyboard?.instantiateViewController(withIdentifier: "OfferedRideDetailsVCID") as! OfferedRideDetailsVC
        story.rideId = UserVM.sheard.offerRideId
        story.isFromView = true
//        story.isReceived = true
        self.navigationController?.pushViewController(story, animated: true)
        self.view.removeFromSuperview()
    }
 }


//extension createRidePopUp{
//   
//}
