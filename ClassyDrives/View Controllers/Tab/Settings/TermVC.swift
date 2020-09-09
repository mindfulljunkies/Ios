//
//  termVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 20/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import WebKit
class TermVC: UIViewController {
    @IBOutlet var termsConditionWebview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.termsConditionWebview.backgroundColor = UIColor.white
        let url = URL (string: "http://classydrives.com/api/termsAndCondition")
        let request = URLRequest(url: url!)
        termsConditionWebview.load(request)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    

}
