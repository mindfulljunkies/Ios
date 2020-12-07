import UIKit
import GoogleMaps
import GooglePlaces
import SwiftyJSON
import Alamofire

enum Location : Int {
    case startLocation = 1
    case point1
    case point2
    case destinationLocation
}

class DirectionMapVC: UIViewController , GMSMapViewDelegate ,  CLLocationManagerDelegate {
    
    @IBOutlet weak var directionBtn: UIButton!
    @IBOutlet weak var googleMaps: GMSMapView!
    var cooridnates : [CLLocationCoordinate2D] = []
    

    var locationManager = CLLocationManager()
    var locationSelected = Location.startLocation
    
    var locationStart = CLLocation()
    var locationEnd = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        directionBtn.layer.cornerRadius = 15.0
        directionBtn.layer.borderColor = UIColor.black.cgColor
        directionBtn.layer.borderWidth = 2.0
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        //Your map initiation code
        let camera = GMSCameraPosition.camera(withLatitude: self.cooridnates[0].latitude, longitude: self.cooridnates[0].longitude, zoom: 9.0)

        self.googleMaps.camera = camera
        self.googleMaps.delegate = self
        self.googleMaps?.isMyLocationEnabled = true
        self.googleMaps.settings.myLocationButton = true
        self.googleMaps.settings.compassButton = true
        self.googleMaps.settings.zoomGestures = true
        self.drawpath(finalPostion: cooridnates)
//        self.drawPath(startLocation: locationStart, endLocation: locationEnd)
        
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    // MARK: function for create a marker pin on map
    func createMarker(titleMarker: String, iconMarker: UIImage, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
        marker.title = titleMarker
        marker.icon = iconMarker
        marker.map = googleMaps
    }
    
    //MARK: - Location Manager delegates
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error to get location : \(error)")
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//
//        let location = locations.last
//
////        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
//
//        let locationTujuan = CLLocation(latitude: 37.784023631590777, longitude: -122.40486681461333)
//
//        createMarker(titleMarker: "Lokasi Tujuan", iconMarker: #imageLiteral(resourceName: "mapspin") , latitude: locationTujuan.coordinate.latitude, longitude: locationTujuan.coordinate.longitude)
//
//        createMarker(titleMarker: "Lokasi Aku", iconMarker: #imageLiteral(resourceName: "mapspin") , latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
//
//        drawPath(startLocation: location!, endLocation: locationTujuan)
//
////        self.googleMaps?.animate(to: camera)
//        self.locationManager.stopUpdatingLocation()
//
//    }
    
    // MARK: - GMSMapViewDelegate
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        googleMaps.isMyLocationEnabled = true
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        googleMaps.isMyLocationEnabled = true
        
        if (gesture) {
            mapView.selectedMarker = nil
        }
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        googleMaps.isMyLocationEnabled = true
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("COORDINATE \(coordinate)") // when you tapped coordinate
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        googleMaps.isMyLocationEnabled = true
        googleMaps.selectedMarker = nil
        return false
    }
    
    

    //MARK: - this is function for create direction path, from start location to desination location
    
//    func drawPath(startLocation: CLLocation, endLocation: CLLocation)
//    {
//        let origin = "\(startLocation.coordinate.latitude),\(startLocation.coordinate.longitude)"
//        let destination = "\(endLocation.coordinate.latitude),\(endLocation.coordinate.longitude)"
//
//
//        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
//
//        Alamofire.request(url).responseJSON { response in
//
//            print(response.request as Any)  // original URL request
//            print(response.response as Any) // HTTP URL response
//            print(response.data as Any)     // server data
//            print(response.result as Any)   // result of response serialization
//
//            let json =  try! JSON(data: response.data!)
//            let routes = json["routes"].arrayValue
//
//            // print route using Polyline
//            for route in routes
//            {
//                let routeOverviewPolyline = route["overview_polyline"].dictionary
//                let points = routeOverviewPolyline?["points"]?.stringValue
//                let path = GMSPath.init(fromEncodedPath: points!)
//                let polyline = GMSPolyline.init(path: path)
//                polyline.strokeWidth = 4
//                polyline.strokeColor = UIColor.red
//                polyline.map = self.googleMaps
//            }
//
//        }
//    }
    
    
    func drawpath( finalPostion: [CLLocationCoordinate2D]) {
       var value : Int = 0
        var positions : [CLLocationCoordinate2D] = []
        positions = finalPostion
        let origin = positions.first!
        let destination = positions.last!
        var wayPoints = ""
        
        
        positions = positions.filter({ !(($0.latitude == 0.0) && ($0.longitude == 0.0)) })
        for point in positions {
            
            
            
            value = value + 1
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: point.latitude,longitude: point.longitude)
            var iconImage: String = ""
                switch (value)
                             {
             case 1: iconImage = "1"
                               break
             case 2: iconImage = "2"
                                break
             case 3: iconImage = "3"
                                break
             case 4: iconImage = "4"
                                break
             default: iconImage = "4"
                }
          
               
            print("valllllll---\(value)")
            if (point.latitude == 0.0)
            {
                break
            }
            
            wayPoints = wayPoints.count == 0 ? "\(point.latitude),\(point.longitude)" : "\(wayPoints)%7C\(point.latitude),\(point.longitude)"

         marker.icon = UIImage(named:iconImage)
         marker.map = self.googleMaps
        }
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin.latitude),\(origin.longitude)&destination=\(destination.latitude),\(destination.longitude)&mode=driving&waypoints=\(wayPoints)&key=AIzaSyB5zsV_cmjqgKusTFhnqfv9hj9Mw1ru_0E"
        Alamofire.request(url).responseJSON { response in

            print(response.request as Any)  // original URL request
            print(response.response as Any) // HTTP URL response
            print(response.data as Any)     // server data
            print(response.result as Any)   // result of response serialization

            let json = try!  JSON(data: response.data!)
            let routes = json["routes"][0]["overview_polyline"]["points"].stringValue

            let path = GMSPath.init(fromEncodedPath: routes)
            let polyline = GMSPolyline.init(path: path)
            polyline.strokeWidth = 4
            polyline.strokeColor = UIColor.red
           
            polyline.map = self.googleMaps
        }


    }
   
    
    // MARK: SHOW DIRECTION WITH BUTTON
    @IBAction func showDirection(_ sender: UIButton) {
        // when button direction tapped, must call drawpath func
        
        
        
        if (UIApplication.shared.canOpenURL(NSURL(string:"comgooglemaps://")! as URL)) {
            var positions :  [CLLocationCoordinate2D] = []
            positions = cooridnates
            let origin = positions.first!
            let destination = positions.last!
            var wayPoints = ""
            positions.removeFirst()
            positions.removeLast()

            for point in positions {
               if (point.latitude == 0.0  )
           {
             
               break
           }
                wayPoints = wayPoints.count == 0 ? "\(point.latitude),\(point.longitude)" : "\(wayPoints)%7C\(point.latitude),\(point.longitude)"
                 
            }
            
//            https://www.google.com/maps/dir/?api=1&travelmode=driving&origin=31.32601519999999,75.57618289999999&destination=30.709560106227666,76.68910257518291&waypoints=31.22402,75.770798%7C30.836399,76.189972
            let url = "https://www.google.com/maps/dir/?api=1&travelmode=driving&origin=\(origin.latitude),\(origin.longitude)&destination=\(destination.latitude),\(destination.longitude)&waypoints=\(wayPoints)"
            
            

            
            UIApplication.shared.open(NSURL(string:
                url )! as URL)

            } else {
            var positions :  [CLLocationCoordinate2D] = []
             positions = cooridnates
             let origin = positions.first!
             let destination = positions.last!
             var wayPoints = ""
             positions.removeFirst()
             positions.removeLast()

             for point in positions {
                if (point.latitude == 0.0  )
            {
              
                break
            }
                 wayPoints = wayPoints.count == 0 ? "\(point.latitude),\(point.longitude)" : "\(wayPoints)%7C\(point.latitude),\(point.longitude)"
                  
             }
            let url = "https://www.google.com/maps/dir/?api=1&travelmode=driving&origin=\(origin.latitude),\(origin.longitude)&destination=\(destination.latitude),\(destination.longitude)&waypoints=\(wayPoints)"
            
            let directionsURL = URL.init(string: url)
            if #available(iOS 10, *) {
                UIApplication.shared.open(directionsURL!)
            } else {

                print("opens directionsURL")
                UIApplication.shared.openURL(directionsURL!)
            }
                NSLog("Can't use comgooglemaps://");
            }
        }
}
    





