//
//  HelpCenterVC.swift
//  ClassyDrives
//
//  Created by Shami Kapoor on 13/12/19.
//  Copyright © 2019 Safal Bhatia. All rights reserved.
//

import UIKit

class HelpCenterVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
     var image = [#imageLiteral(resourceName: "password"),#imageLiteral(resourceName: "password"),#imageLiteral(resourceName: "name")]
    //    "Privacy Policy","Terms","About",
        var name = ["Privacy Policy","Terms and conditions","About us"]
        
        var naviArr = ["PrivacyVC","TermVC","AboutVC"]
      
      
       
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
     
        
        
    }
    extension HelpCenterVC : UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return name.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

                tableView.register(UINib.init(nibName: "settingsCellFile", bundle: nil), forCellReuseIdentifier: "settingsCellFile")
                let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCellFile") as! settingsCellFile
                cell.lblText.text = name[indexPath.row]
                cell.cellImg.image = image[indexPath.row]
                return cell
    //        }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
                let story = storyboard?.instantiateViewController(withIdentifier: naviArr[indexPath.row])
                navigationController?.pushViewController(story!, animated: true)
            
        }
        
   
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
