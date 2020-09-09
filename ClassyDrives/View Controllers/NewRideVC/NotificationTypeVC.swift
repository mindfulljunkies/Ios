//
//  NotificationTypeVC.swift
//  ClassyDrives
//
//  Created by apple on 04/09/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class NotificationTypeVC: UIViewController {

    @IBOutlet weak var mSwitchOut2: UISwitch!
    @IBOutlet weak var mSwitchOut: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func mBackBtnAct(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
   
    @IBAction func mSwitchBtnAct(_ sender: Any) {
    
    }
    
    @IBAction func mSwitch2BtnAct(_ sender: Any) {
   
    }
    
}
