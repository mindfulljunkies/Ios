//
//  ViewController.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.setButtonBorder()
    }


    @IBAction func nextBtnAtn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"StartPage") as! StartPage
        navigationController?.pushViewController(story, animated: true)
    }
}

