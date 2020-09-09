//
//  searchVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 12/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import Alamofire

class searchVC: UIViewController, UITextFieldDelegate {
    @IBOutlet var searchTF: UITextField!
    
    var arrPlaces = NSMutableArray(capacity: 100)
    let operationQueue = OperationQueue()
    let currentLat = 51.5033640
    let currentLong = -0.1276250
//    var LocationDataDelegate : LocationData! = nil
    var tblLocation : UITableView!
    var lblNodata = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTF.delegate = self
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        googlePlacesResult(input: searchTF.text!) { (array) in
//            print(array)
//        }
        searchPlaceFromGoogle(place: searchTF.text!)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchPlaceFromGoogle(place: searchTF.text!)
//        googlePlacesResult(input: searchTF.text!) { (array) in
//            print(array)
//        }
        return true
    }
    @IBAction func backBtnAtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 //
    func searchPlaceFromGoogle(place: String){
         var googleApi = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@\(place)&types=establishment&key=AIzaSyCZxgvuDzMzqVnJHqIe9R6SzTTuAOExRUc"
        googleApi = googleApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        var urlRequest = URLRequest(url: URL(string: googleApi)!)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil{
                    let jsonDict = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                print(jsonDict)
            }else{
                print(error)
            }
            
        }
        }
    
  
    //MARK: - Google place API request -
    func googlePlacesResult(input: String, completion: @escaping (_ result: NSArray) -> Void) {
        let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@\(input)&types=establishment&key=AIzaSyCZxgvuDzMzqVnJHqIe9R6SzTTuAOExRUc"
            print(urlString)
        var url = URLRequest(url: URL(string: urlString)!)
       
            let defaultConfigObject = URLSessionConfiguration.default
            let delegateFreeSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: OperationQueue.main)
            let request = URLRequest(url: URL(string: urlString)!)
            let task =  delegateFreeSession.dataTask(with: request as URLRequest, completionHandler:
            {
                (data, response, error) -> Void in
                if let data = data
                {
                    do {
                        let jSONresult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        let results:NSArray = jSONresult["predictions"] as! NSArray
                        let status = jSONresult["status"] as! String
                        if status == "NOT_FOUND" || status == "REQUEST_DENIED"
                        {
                            let userInfo:NSDictionary = ["error": jSONresult["status"]!]
                            let newError = NSError(domain: "API Error", code: 666, userInfo: userInfo as? [String : Any] )
                            let arr:NSArray = [newError]
                            completion(arr)
                            return
                        }
                        else
                        {
                            completion(results)
                        }
                    }
                    catch
                    {
                        print("json error: \(error)")
                    }
                }
                else if let error = error
                {
                    print(error)
                }
            })
            task.resume()
        }
    }

