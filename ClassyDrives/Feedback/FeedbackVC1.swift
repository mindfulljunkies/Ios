//
//  FeedbackVC1.swift
//  ClassyDrives
//
//  Created by Chandan on 04/10/20.
//  Copyright © 2020 Safal Bhatia. All rights reserved.
//

import UIKit

class FeedbackVC1: UIViewController {
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var lbl: UILabel!
    var userName:String = ""
    var currentUserId:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "THANKS FOR CARPOOLING WITH \(userName)".uppercased()
        nextBtn.layer.cornerRadius = 25
        nextBtn.layer.borderWidth = 1
        nextBtn.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func mBackBtnAct(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let story = self.storyboard?.instantiateViewController(withIdentifier:"FeedbackVC2") as! FeedbackVC2
        story.otherUserId = currentUserId
        self.navigationController?.pushViewController(story, animated: true)
        
    }
}
