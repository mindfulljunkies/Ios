//
//  LocalRideVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 10/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import CoreLocation

class LocalRideVC: BaseVC, OfferRideDelegate {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var findRideBtn: UIButton!
    @IBOutlet var offerRideBtn: UIButton!
    @IBOutlet var localCollectionView: UICollectionView!
    
    
    var findPic = String()
    var findPicLat = String()
    var findPicLong = String()
    
    var findDrop = String()
    var findDropLat = String()
    var findDropLong = String()
    
    var offerPic = String()
    var offerPicLat = String()
    var offerPicLong = String()
    
    var offerDrop = String()
    var offerDropLat = String()
    var offerDropLong = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.setShadow()
        backView.layer.cornerRadius = backView.frame.height/2
        
        findRideBtn.backgroundColor = .black
        findRideBtn.setTitleColor(.white, for: .normal)
        findRideBtn.layer.cornerRadius = findRideBtn.frame.height/2
        offerRideBtn.layer.cornerRadius = offerRideBtn.frame.height/2
        findRideBtn.clipsToBounds = true
        offerRideBtn.clipsToBounds = true
    }
    
    @IBAction func findRideBtnAtn(_ sender: Any) {
        findRideBtn.backgroundColor = .black
        findRideBtn.setTitleColor(.white, for: .normal)
        offerRideBtn.backgroundColor = .white
        offerRideBtn.setTitleColor(.black, for: .normal)
//        if (findPicLat == "" ||  findDropLat == "")
//        {
//            self.showAlert(message: "Please enter the Pickup and drop Location")
//            return
//        }
         self.localCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: false)
    }
   
    @IBAction func offerRideBtnAtn(_ sender: Any) {
        findRideBtn.backgroundColor = .white
        findRideBtn.setTitleColor(.black, for: .normal)
        offerRideBtn.backgroundColor = .black
        offerRideBtn.setTitleColor(.white, for: .normal)
       
         self.localCollectionView.scrollToItem(at: NSIndexPath(item: 1, section: 0) as IndexPath, at: .right, animated: false)
    }
    
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func getLocation(_ lat: CLLocationDegrees, _ long:CLLocationDegrees, _ str:String, _ index:Int) {
        if index == 1{
            self.offerPic = str
            self.offerPicLat = "\(lat)"
            self.offerPicLong = "\(long)"
         }else if index == 2{
            self.offerDrop = str
            self.offerDropLat = "\(lat)"
            self.offerDropLong = "\(long)"
        }
        
        
        else if index == 4{
            self.findPic = str
            self.findPicLat = "\(lat)"
            self.findPicLong = "\(long)"
        }else if index == 5{
            self.findDrop = str
            self.findDropLat = "\(lat)"
            self.findDropLong = "\(long)"
        }
        self.localCollectionView.reloadData()
    }
}

//MARK: Collection Methods
extension LocalRideVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func covertDate(date : String) -> String
    {
        let dateString = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.locale = Locale.init(identifier: "en_GB")

        let dateObj = dateFormatter.date(from: dateString)

        dateFormatter.dateFormat = "MM-dd-yyyy"
        return dateFormatter.string(from: dateObj ?? Date())
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            collectionView.register(UINib.init(nibName: "localFindCellXib", bundle: nil), forCellWithReuseIdentifier: "localFindCellXib")
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "localFindCellXib", for: indexPath) as! localFindCellXib
            
            item.picTF.text = findPic
            item.dropTF.text = findDrop
            item.picAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
                story.index = 4
                story.delegate = self
                self.navigationController?.pushViewController(story, animated: true)
            }
            item.dropAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
                story.index = 5
                story.delegate = self
                self.navigationController?.pushViewController(story, animated: true)
            }
            item.doneAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "allRides") as! allRides
                
                
                
                let coordinate0 = CLLocation(latitude: Double(self.findPicLat) ?? 0.0, longitude: Double(self.findPicLong) ?? 0.0)
                let coordinate1 = CLLocation(latitude: Double(self.findDropLat) ?? 0.0, longitude: Double(self.findDropLong) ?? 0.0)

                let distanceInMeters = coordinate0.distance(from: coordinate1)
                if (self.findPic == "" || self.findPicLat == "" ||  self.findPicLong == ""   )
                {
                    self.showAlert(message: "Please fill all data")
                     
                }else if distanceInMeters >= 136765{
                    self.showAlert(message: "Your ride distance is over 85 miles. Please use the back arrow and choose the ride option from the screen below")
                }
                story.rideFromAdd = self.findPic
                story.rideFromLat = self.findPicLat
                story.rideFromLong = self.findPicLong
                story.rideToAdd = self.findDrop
                story.rideToLat = self.findDropLat
                story.rideToLong = self.findDropLong
                story.topvalue = (item.picTF.text ?? "" )  + "\n" +  (item.dropTF.text ?? "")
                story.date = item.dateTF.text ?? ""
                story.ridedate = self.covertDate(date: item.dateTF.text ?? "")
                story.isFromLocalRide = true
                self.navigationController?.pushViewController(story, animated: true)
            }
            return item
        }else{
            collectionView.register(UINib.init(nibName: "localOfferCellXib", bundle: nil), forCellWithReuseIdentifier: "localOfferCellXib")
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: "localOfferCellXib", for: indexPath) as! localOfferCellXib
//            if (findPicLat == "" ||  findDropLat == "")
//                   {
//                       self.showAlert(message: "Please fill all data")
//
//                   }
            item.picTF.text = offerPic
            item.dropTF.text = offerDrop
            
            item.picAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
                story.index = 1
                story.delegate = self
                self.navigationController?.pushViewController(story, animated: true)
            }
            item.dropAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
                story.index = 2
                story.delegate = self
                self.navigationController?.pushViewController(story, animated: true)
            }
            item.doneAtn = { (action) in
                let story = self.storyboard?.instantiateViewController(withIdentifier: "RideDetailsVC") as! RideDetailsVC
                
                let coordinate0 = CLLocation(latitude: Double(self.offerPicLat) ?? 0.0, longitude: Double(self.offerPicLong) ?? 0.0)
                let coordinate1 = CLLocation(latitude: Double(self.offerDropLat) ?? 0.0, longitude: Double(self.offerDropLong) ?? 0.0)
                let distanceInMeters = coordinate0.distance(from: coordinate1)
                if (self.offerPicLat == "" || self.offerPic == "" ||   self.offerPicLat == "" || self.offerDrop == "" || item.dateTF.text! == "" || self.offerPicLong == "" || item.timeTF.text! == "" ||  self.offerDropLong == "")
                               {
                                   self.showAlert(message: "Please fill all data")
                                    
                               }
                
                
                else if distanceInMeters >= 136765{
                    self.showAlert(message: "Your ride distance is over 85 miles. Please use the back arrow and choose the ride option from the screen below")
                }
                story.rideFromAdd = self.offerPic //item.picTF.text!
                story.rideFromLat = self.offerPicLat
                story.rideFromLong = self.offerPicLong
                
                story.rideToAdd = self.offerDrop
                story.rideToLat = self.offerDropLat
                story.rideToLong = self.offerDropLong
                story.ridedate = self.covertDate(date: item.dateTF.text ?? "")
                story.rideTime = item.timeTF.text!
                story.is_local_ride = true
                self.navigationController?.pushViewController(story, animated: true)
            }
            
            return item
        }
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: localCollectionView.frame.height)
    }
}
