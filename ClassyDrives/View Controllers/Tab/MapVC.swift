//
//  MapVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 11/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

protocol userAddressDelegate {
    func addressData(index : Int,address : String)
}

class MapVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
   
    @IBOutlet var gMap: GMSMapView!
    @IBOutlet var addressView: UIView!
    @IBOutlet var addressLbl: UILabel!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var markerImg: UIImageView!
    
    let locationManager = CLLocationManager()
    var delegate: OfferRideDelegate?
    var addressDelegate : userAddressDelegate?
    var boolPickup = true
    
    var index = Int()
    var addressType = Int()
    var isComingforSaveAddress =  false
    
    var lat:CLLocationDegrees = 0.000
    var long:CLLocationDegrees! = 0.000
    var getAddress = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(index)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        gMap.bringSubviewToFront(addressView)
        addressView.setShadow()
        gMap.bringSubviewToFront(nextBtn)
        nextBtn.layer.shadowColor = UIColor.gray.cgColor
        nextBtn.layer.shadowOpacity = 0.5
        nextBtn.layer.shadowOffset = CGSize.zero
        nextBtn.layer.shadowRadius = 5
        gMap.bringSubviewToFront(markerImg)
        
        gMap.delegate = self
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        returnPostionOfMapView(mapView: mapView)
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        returnPostionOfMapView(mapView: mapView)
    }
    
    func returnPostionOfMapView(mapView:GMSMapView){
        let geocoder = GMSGeocoder()
        let latitute = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        let position = CLLocationCoordinate2DMake(latitute, longitude)
        geocoder.reverseGeocodeCoordinate(position) { response , error in
            if error != nil {
                print("GMSReverseGeocode Error: \(String(describing: error?.localizedDescription))")
            }else {
                let result = response?.results()?.first
                let address = result?.lines?.reduce("") { $0 == "" ? $1 : $0 + ", " + $1 }
                self.addressLbl.text = address
                self.lat = latitute
                self.long = longitude
                self.getAddress = address!
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view == addressView{
            autocompleteClicked()
        }
    }
    @IBAction func backBtnAtn(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextBtnAtn(_ sender: Any) {
        if isComingforSaveAddress == true {
            navigationController?.popViewController(animated: true)
           addressDelegate?.addressData(index: index, address: getAddress)
        }
        else{
            navigationController?.popViewController(animated: true)
            delegate?.getLocation(lat, long, getAddress, index)
        }
        
    }
 
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error" + error.description)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: userLocation!.coordinate.latitude,
                                              longitude: userLocation!.coordinate.longitude, zoom: 15)
        gMap.isMyLocationEnabled = true
        gMap.camera = camera
        locationManager.stopUpdatingLocation()
    }
    
    func autocompleteClicked() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        let filter = GMSAutocompleteFilter()
        filter.type = .noFilter
        autocompleteController.autocompleteFilter = filter
        
        // Display the autocomplete view controller.
        present(autocompleteController, animated: true, completion: nil)
    }
}


extension MapVC: GMSAutocompleteViewControllerDelegate {
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        getAddress = place.formattedAddress ?? place.name ?? ""
        lat = place.coordinate.latitude
        long = place.coordinate.longitude
        addressLbl.text = place.formattedAddress
         dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
