//
//  customTabbar.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 11/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class customTabbar: UIViewController {
    @IBOutlet var homeView: UIView!
    @IBOutlet var settingView: UIView!
    @IBOutlet var chatView: UIView!
    @IBOutlet var profileView: UIView!
    @IBOutlet var lastView: UIView!
    
    
    @IBOutlet var homeBtn: UIButton!
    @IBOutlet var settingBtn: UIButton!
    @IBOutlet var chatBtn: UIButton!
    @IBOutlet var profileBtn: UIButton!
    @IBOutlet var rideBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.isHidden = true
        settingView.isHidden = true
        chatView.isHidden = true
        profileView.isHidden = true
        lastView.isHidden = true
        
//        homeBtn.isHidden = true
//        settingBtn.isHidden = false
//        chatBtn.isHidden = false
//        profileBtn.isHidden = false
//        lastBtn.isHidden = false
}

    
    @IBAction func homeBtnAtn(_ sender: Any) {
        homeView.isHidden = false
        settingView.isHidden = true
        chatView.isHidden = true
        profileView.isHidden = true
        lastView.isHidden = true
        
//        homeBtn.isHidden = true
//        settingBtn.isHidden = false
//        chatBtn.isHidden = false
//        profileBtn.isHidden = false
//        lastBtn.isHidden = false
        let story = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        navigationController?.pushViewController(story, animated: false)
    }
    
    @IBAction func settingsBtnAtn(_ sender: Any) {
        homeView.isHidden = true
        settingView.isHidden = false
        chatView.isHidden = true
        profileView.isHidden = true
        lastView.isHidden = true
        
//        homeBtn.isHidden = false
//        settingBtn.isHidden = true
//        chatBtn.isHidden = false
//        profileBtn.isHidden = false
//        lastBtn.isHidden = false
        let story = storyboard?.instantiateViewController(withIdentifier: "settingsVC") as! settingsVC
        navigationController?.pushViewController(story, animated: false)
    }
    
    @IBAction func chatBtnAtn(_ sender: Any) {
        homeView.isHidden = true
        settingView.isHidden = true
        chatView.isHidden = false
        profileView.isHidden = true
        lastView.isHidden = true
        
//        homeBtn.isHidden = false
//        settingBtn.isHidden = false
//        chatBtn.isHidden = true
//        profileBtn.isHidden = false
//        lastBtn.isHidden = false
        let story = storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        navigationController?.pushViewController(story, animated: false)
    }
    
    @IBAction func profileBtnAtn(_ sender: Any) {
        homeView.isHidden = true
        settingView.isHidden = true
        chatView.isHidden = true
        profileView.isHidden = false
        lastView.isHidden = true
        
//        homeBtn.isHidden = false
//        settingBtn.isHidden = false
//        chatBtn.isHidden = false
//        profileBtn.isHidden = true
//        lastBtn.isHidden = false
       
        let story = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        navigationController?.pushViewController(story, animated: false)
    }
    
    @IBAction func setBtnAtn(_ sender: Any) {
        homeView.isHidden = true
        settingView.isHidden = true
        chatView.isHidden = true
        profileView.isHidden = true
        lastView.isHidden = false
        
       
    }
    
    @IBAction func rideBtnAtn(_ sender: Any) {
        let story = storyboard?.instantiateViewController(withIdentifier: "RideVC") as! RideVC
        navigationController?.pushViewController(story, animated: false)
    }
}
