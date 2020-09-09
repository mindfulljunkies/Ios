//
//  StartPage.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class StartPage: UIViewController {
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet weak var mLogoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.setButtonBorder()
        signUpBtn.setButtonBorder()
//        let jeremyGif = UIImage.gifImageWithName("tick-gif")
//        mLogoImg.image = jeremyGif
    }
   
    @IBAction func loginBtnAtn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"LoginVC") as! LoginVC
        navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func signUpBtnAtn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"SignInVC") as! SignInVC
        navigationController?.pushViewController(story, animated: true)
    }
}
