//
//  LogoutPopupVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 20/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class LogoutPopupVC: UIViewController {

    @IBOutlet var okBtn: UIButton!
    @IBOutlet var cancelBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonDesign(btn: okBtn)
        buttonDesign(btn: cancelBtn)
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
        self.view.removeFromSuperview()
    }
    
    @IBAction func okBtnAtn(_ sender: Any) {
        DispatchQueue.main.async {
                    UserDefaults.standard.removeObject(forKey: "LoginID")
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
            UserDefaults.standard.synchronize()

        }
        DataManager.isLogin = false
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"LoginVC") as! LoginVC
        navigationController?.pushViewController(story, animated: true)
    }
  
    
}
