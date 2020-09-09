//
//  AboutVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 20/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import WebKit
class AboutVC: UIViewController {
    @IBOutlet var aboutWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutWebView.backgroundColor = UIColor.white
        let url = URL (string: "http://classydrives.com/api/aboutUs")
        let request = URLRequest(url: url!)
        aboutWebView.load(request)
      
    }

    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
