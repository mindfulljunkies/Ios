//
//  PrivacyVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 20/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import WebKit
class PrivacyVC: UIViewController {
    
    @IBOutlet weak var privacyWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.privacyWebView.backgroundColor = UIColor.white

        let url = URL (string: "http://classydrives.com/api/privacyPolicy")
        let request = URLRequest(url: url!)
        privacyWebView.load(request)
        // Do any additional setup after loading the view.
    }
   //
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
