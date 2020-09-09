//
//  NetworkingInterface.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 13/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//
import Foundation
import Alamofire

//MARK: Call Backs
typealias arrayDic = [[String:AnyObject]] //Array of dictionary
typealias JSONDictionary = [String:Any]
typealias JSONArray = [JSONDictionary]
typealias APIServiceSuccessCallback = ((Any?) -> ())
typealias APIServiceFailureCallback = ((NetworkErrorReason?, NSError?) -> ())
typealias JSONArrayResponseCallback = ((JSONArray?) -> ())
typealias JSONDictionaryResponseCallback = ((JSONDictionary?) -> ())
typealias responseCallBack = ((Bool, String?, NSError?) -> ())
typealias responseCallBackNew = ((Bool, String?,String?,String? ,NSError?) -> ())
typealias responseCallBack1 = ((Bool, String?,[String:Any], NSError?) -> ())

typealias responseCallBackArrayDic = ((Bool, arrayDic, NSError?) -> ())
typealias withResponseCallBack = ((Bool, Dictionary<String,Any>?,String?, NSError?) -> ())



//MARK: Constant

public enum NetworkErrorReason: Error {
    case FailureErrorCode(code: Int, message: String)
    case InternetNotReachable
    case UnAuthorizedAccess
    case Other
}

struct Resource {
    let method: HTTPMethod
    let parameters: [String : Any]?
    let headers: [String:String]?
}

protocol APIService {
    var path: String { get }
    var resource: Resource { get }
}

extension APIService {
    
    /**
     Method which needs to be called from the respective model class.
     - parameter successCallback:   successCallback with the JSON response.
     - parameter failureCallback:   failureCallback with ErrorReason, Error description and Error.
     */
    
    //MARK:- Custom Get methods for Url
    func getRequest(image:Data?, isURLEncoded: Bool = false, success: @escaping APIServiceSuccessCallback, failure: @escaping APIServiceFailureCallback){
        do {
            if Indicator.isEnabledIndicator {
                Indicator.sharedInstance.showIndicator()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            debugPrint("********************************* API Request **************************************")
            debugPrint("Request URL:\(path)")
            debugPrint("Request resource: \(resource)")
            debugPrint("************************************************************************************")
            
            var encoding: URLEncoding = .default
            if resource.method == .get || resource.method == .head || resource.method == .delete || isURLEncoded{
                encoding = .queryString
            }
            
            debugPrint("Request method: \(resource.method)")
            debugPrint("Request parameter:\(String(describing: resource.parameters))")
            debugPrint("Request encoding: \(encoding)")
            debugPrint("Request headers: \(String(describing: resource.headers))")
            
            
            Alamofire.upload(multipartFormData:{ multipartFormData in
                if image != nil{
                    multipartFormData.append(image!, withName: "profile_photo", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                }
                for (key, value) in self.resource.parameters! {
                    multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            },
                             usingThreshold:UInt64.init(),
                             to:"https://ts2-au-api.utilihub.io/movoapp/profile",
                             method:.post,
                             headers:resource.headers,
                             encodingCompletion: { encodingResult in
                                if Indicator.isEnabledIndicator {
                                    Indicator.sharedInstance.hideIndicator()
                                }
                                switch encodingResult {
                                case .success(let upload, _, _):
                                    upload.responseJSON { response in
                                        let valueData = response.result.value
                                        success(valueData as AnyObject?)
                                    }
                                case .failure(let error):
                                    self.handleError(response: nil, error: error as NSError, callback: failure)
                                }
            })
            
            
        }
    }
    
    
    
    //MARK: Request Method to Send Request except in Multipart
    func request(isURLEncoded: Bool = false, success: @escaping APIServiceSuccessCallback, failure: @escaping APIServiceFailureCallback) {
        do {
            if Indicator.isEnabledIndicator {
                Indicator.sharedInstance.showIndicator()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            debugPrint("********************************* API Request **************************************")
            debugPrint("Request URL:\(path)")
            debugPrint("Request resource: \(resource)")
            debugPrint("************************************************************************************")
            
            debugPrint("Request method: \(resource.method)")
            debugPrint("Request parameter:\(String(describing: resource.parameters))")
            debugPrint("Request headers: \(String(describing: resource.headers))")
            
            Alamofire.request(path, method: resource.method, parameters: resource.parameters, encoding: URLEncoding.default , headers: resource.headers).responseJSON(completionHandler: { (response) in
                debugPrint("********************************* API Response *************************************")
                debugPrint("\(response.debugDescription)")
                debugPrint("************************************************************************************")
                if Indicator.isEnabledIndicator {
                    Indicator.sharedInstance.hideIndicator()
                }
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(let value):
                    
                    success(value as AnyObject?)
                case .failure(let error):
                    self.handleError(response: response, error: error as NSError, callback: failure)
                }
            })
        }
    }
    
    func newRequest(isURLEncoded: Bool = false, success: @escaping APIServiceSuccessCallback, failure: @escaping APIServiceFailureCallback) {
        do {
            if Indicator.isEnabledIndicator {
                Indicator.sharedInstance.showIndicator()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            debugPrint("********************************* API Request **************************************")
            debugPrint("Request URL:\(path)")
            debugPrint("Request resource: \(resource)")
            debugPrint("************************************************************************************")
            
            debugPrint("Request method: \(resource.method)")
            debugPrint("Request parameter:\(String(describing: resource.parameters))")
            debugPrint("Request headers: \(String(describing: resource.headers))")
            
            
            
            Alamofire.request(path, method: resource.method, parameters: resource.parameters, encoding: JSONEncoding.default , headers: resource.headers).responseJSON(completionHandler: { (response) in
                debugPrint("********************************* API Response *************************************")
                debugPrint("\(response.debugDescription)")
                debugPrint("************************************************************************************")
                if Indicator.isEnabledIndicator {
                    Indicator.sharedInstance.hideIndicator()
                }
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(let value):
                    
                    success(value as AnyObject?)
                case .failure(let error):
                    self.handleError(response: response, error: error as NSError, callback: failure)
                }
            })
        }
    }
    
    //MARK: Request Method to Send Request except in Multipart
    func requestForPost(isURLEncoded: Bool = false, success: @escaping APIServiceSuccessCallback, failure: @escaping APIServiceFailureCallback) {
        do {
            if Indicator.isEnabledIndicator {
                Indicator.sharedInstance.showIndicator()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            debugPrint("********************************* API Request **************************************")
            debugPrint("Request URL:\(path)")
            debugPrint("Request resource: \(resource)")
            debugPrint("************************************************************************************")
            
            debugPrint("Request method: \(resource.method)")
            debugPrint("Request parameter:\(String(describing: resource.parameters))")
            debugPrint("Request headers: \(String(describing: resource.headers))")
            
            
            
            Alamofire.request(path, method: resource.method, parameters: resource.parameters, encoding: JSONEncoding.default , headers: resource.headers).responseJSON(completionHandler: { (response) in
                debugPrint("********************************* API Response *************************************")
                debugPrint("\(response.debugDescription)")
                debugPrint("************************************************************************************")
                if Indicator.isEnabledIndicator {
                    Indicator.sharedInstance.hideIndicator()
                }
                
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(let value):
                    
                    success(value as AnyObject?)
                case .failure(let error):
                    self.handleError(response: response, error: error as NSError, callback: failure)
                }
            })
        }
    }
    
    
    
    //MARK: Request Method to Upload Multipart
    func uploadMultiple(imageDict:[String: Data]?, success:  @escaping APIServiceSuccessCallback, failure: @escaping APIServiceFailureCallback) {
        do {
            debugPrint("********************************* API Request **************************************")
            debugPrint("Request URL:\(path)")
            debugPrint("Request resource: \(resource)")
            debugPrint("image dictionary: \(String(describing: imageDict))")
            
            debugPrint("************************************************************************************")
            if Indicator.isEnabledIndicator {
                Indicator.sharedInstance.showIndicator()
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            let urlRequest = createRequestWithMultipleImages(urlString: path, parameters: resource.parameters, imageDict: imageDict)
            Alamofire.upload((urlRequest?.1)!, with: (urlRequest?.0)!).uploadProgress(closure: { (progress) in
                print(progress.localizedDescription)
            }).responseJSON(completionHandler: { (response) in
                debugPrint("********************************* API Response *************************************")
                debugPrint("\(response.debugDescription)")
                debugPrint("************************************************************************************")
                if Indicator.isEnabledIndicator {
                    Indicator.sharedInstance.hideIndicator()
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch response.result {
                case .success(let value):
                    success(value as AnyObject?)
                case .failure(let error):
                    self.handleError(response: response, error: error as NSError, callback: failure)
                }
            })
        }
    }
    
    func createRequestWithMultipleImages(urlString:String, parameters:[String : Any]?, imageDict: [String: Data]?) -> (URLRequestConvertible, Data)? {
        
        // create url request to send
        var mutableURLRequest = URLRequest(url: NSURL(string: urlString)! as URL)
        mutableURLRequest.httpMethod = resource.method.rawValue
        let boundaryConstant = "myRandomBoundary12345";
        let contentType = "multipart/form-data;boundary="+boundaryConstant
        mutableURLRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        // create upload data to send
        var uploadData = Data()
        if parameters != nil {
            for (key, value) in parameters! {
                uploadData.append("--\(boundaryConstant)\r\n".data(using: String.Encoding.utf8)!)
                uploadData.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                uploadData.append("\(value)\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        if imageDict != nil {
            for (key, value) in imageDict! {
                uploadData.append("--\(boundaryConstant)\r\n".data(using: String.Encoding.utf8)!)
                uploadData.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(key).png\"\r\n".data(using: String.Encoding.utf8)!)
                uploadData.append("Content-Type: image/png\r\n\r\n".data(using: String.Encoding.utf8)!)
                uploadData.append(value)
                uploadData.append("\r\n".data(using: String.Encoding.utf8)!)
            }
        }
        uploadData.append("--\(boundaryConstant)--\r\n".data(using: String.Encoding.utf8)!)
        do {
            let result = try Alamofire.URLEncoding.default.encode(mutableURLRequest, with: nil)
            return (result, uploadData)
        }
        catch _ {
        }
        
        return nil
    }
    
    //MARK: Data Handling
    // Convert from NSData to json object
    private func JSONFromData(data: NSData) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
        } catch let myJSONError {
            debugPrint(myJSONError)
        }
        return nil
    }
    
    // Convert from JSON to nsdata
    private func nsdataFromJSON(json: AnyObject) -> NSData?{
        do {
            return try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData?
        } catch let myJSONError {
            debugPrint(myJSONError)
        }
        return nil;
    }
    
    //MARK: Error Handling
    private func handleError(response: DataResponse<Any>?, error: NSError, callback:APIServiceFailureCallback) {
        Indicator.sharedInstance.hideIndicator()
        Indicator.isEnabledIndicator = true
        if let errorCode = response?.response?.statusCode {
            guard let responseJSON = self.JSONFromData(data: (response?.data)! as NSData) else {
                callback(NetworkErrorReason.FailureErrorCode(code: errorCode, message:"Something went wrong. Please try again."), error)
                debugPrint("Couldn't read the data")
                return
            }
            let message = (responseJSON as? NSDictionary)?["err"] as? String ?? "Something went wrong. Please try again."
            callback(NetworkErrorReason.FailureErrorCode(code: errorCode, message: message), error)
        }
        else {
            let customError = NSError(domain: "Network Error", code: error.code, userInfo: error.userInfo)
            if let errorCode = response?.result.error?.localizedDescription , errorCode == "The Internet connection appears to be offline." {
                callback(NetworkErrorReason.InternetNotReachable, customError)
            }
            else {
                callback(NetworkErrorReason.Other, customError)
            }
        }
    }
}

//MARK: API Manager Class
class APIManager {
    class func errorForNetworkErrorReason(errorReason: NetworkErrorReason) -> NSError {
        var error: NSError!
        
        switch errorReason {
        case .InternetNotReachable:
            error = NSError(domain: "No Internet", code: -1, userInfo: [kMessage : "The Internet connection appears to be offline."])
        case .UnAuthorizedAccess:
            error = NSError(domain: "Authorization Failed", code: 0, userInfo: [kMessage : "Please Re-login to the app."])
        case let .FailureErrorCode(code, message):
            switch code {
            case 500:
                error = NSError(domain: "Server Error", code: code, userInfo: [message : message])
            default:
                error = NSError(domain: "Please try again!", code: code, userInfo: [message : message])
            }
            
        case .Other:
            error = NSError(domain: "Please try again!", code: 0, userInfo: [kMessage : "Something went wrong!"])
        }
        return error
    }
}

//MARK: Indicator Class
public class Indicator {
    
    public static let sharedInstance = Indicator()
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()
    static var isEnabledIndicator = true
    
    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        blurImg.isUserInteractionEnabled = true
        
        
    }
    
    func showIndicator(){
        
        DispatchQueue.main.async( execute: {
            let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "cd_loder", withExtension: "gif")!)
                    let advTimeGif = UIImage.gifImageWithData(imageData!)
                    let imageView2 = UIImageView(image: advTimeGif)
                    imageView2.frame = CGRect(x: 20.0, y: 220.0, width:
                   100, height: 100.0)
            imageView2.center = self.blurImg.center
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            self.blurImg.addSubview(imageView2)
        })
    }
    func hideIndicator(){
        
        DispatchQueue.main.async( execute: {
            self.blurImg.removeFromSuperview()
        })
    }
    
    
}



