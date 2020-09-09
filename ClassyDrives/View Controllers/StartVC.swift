//
//  StartVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    @IBOutlet var pageControls: UIPageControl!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var signBtn: UIButton!
    @IBOutlet var startCollection: UICollectionView!
    
    var scrollTimer = Timer()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.removeObject(forKey: "LoginID")

        loginBtn.setButtonBorder()
        signBtn.setButtonBorder()
        pageControls.numberOfPages = 5
       
        scrollTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollPage), userInfo: nil, repeats: true)
    }

    @objc func scrollPage() {
        if count <= 4{
             pageControls.currentPage = count
            self.startCollection.scrollToItem(at: NSIndexPath(item: count, section: 0) as IndexPath, at: .right, animated: true)
            count = count + 1
            if count == 5{
                count = 0
            }
        }
    }
    @IBAction func loginBtnAtn(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "LoginID")

        scrollTimer.invalidate()
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"LoginVC") as! LoginVC
        navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func signupBtnAtn(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "LoginID")

        scrollTimer.invalidate()
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"SignInVC") as! SignInVC
        navigationController?.pushViewController(story, animated: true)
    }
 }

extension StartVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(UINib.init(nibName: "startCellFile", bundle: nil), forCellWithReuseIdentifier: "startCellFile")
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "startCellFile", for: indexPath) as! startCellFile
        if indexPath.item == 0{
            item.mainImage.image = #imageLiteral(resourceName: "offer_ride_1")
            item.titleLbl.text = "OFFER A RIDE"
            item.detailLbl.text = "Let us know when and where you going to. We will let you know your most preferred co-traveller."
        }else if indexPath.item == 1{
            item.mainImage.image = #imageLiteral(resourceName: "book_ride")
            item.titleLbl.text = "BOOK RIDE"
            item.detailLbl.text = "Going for a holiday or somewhere. Use simple and smartest trusted carpolling classy drive."
        }else if indexPath.item == 2{
            item.mainImage.image = #imageLiteral(resourceName: "local_drive")
            item.titleLbl.text = "LOCAL RIDE"
            item.detailLbl.text = "Visit your local places with shared cost."
        }else if indexPath.item == 3{
            item.mainImage.image = #imageLiteral(resourceName: "car_pooling")
            item.titleLbl.text = "CAR POOLING"
            item.detailLbl.text = "No need to travel alone anymore!"
        }else{
            item.mainImage.image = #imageLiteral(resourceName: "security")
            item.titleLbl.text = "SECURE"
            item.detailLbl.text = "Secure rides and Secure Payments."
        }
        return item
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: startCollection.frame.width, height: startCollection.frame.height)
    }
    
}
