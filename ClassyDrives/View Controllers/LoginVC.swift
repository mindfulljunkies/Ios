//
//  LoginVC.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit
import TwitterKit
import AuthenticationServices

class LoginVC: BaseVC,GIDSignInDelegate {
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var emailView: UIView!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var passview: UIView!
    var  apple_id : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        nextBtn.setButtonBorder()
        emailView.setShadow()
        passview.setShadow()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK:- Social Login Btn
    
    @IBAction func facebookBtn(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logOut()
        
        let fbLoginManager : LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : LoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")) {
                        if((AccessToken.current) != nil){
                            GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                                if (error == nil){
                                    print(result!)
                                    if let data = result as? NSDictionary {
                                        let fullname = data["name"] as! String
                                        let username = data["first_name"] as! String
                                        let email = data["email"] as! String
                                        let id = data["id"] as! String
                                        let lastname = data["last_name"] as! String
                                        self.socialoginUser(email : email,socialtoken : id,firstname : username,lastname : lastname, loginType: 1)
                                    }  }
                            })
                        }  }   }
            }
        }
    }
    
    @IBAction func googleBtn(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func twiterBtn(_ sender: Any) {
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as \(session?.userName)");
            } else {
                print("error: \(error?.localizedDescription)");
            }
        })
        
    }
    
    @IBAction func loginBtnAtn(_ sender: Any) {
        if emailTF.text!.isEmpty {
            showAlert(message: "please enter username.")
            return
        }
        
        if passwordTF.text!.isEmpty {
            showAlert(message: "please enter password.")
            return
        }
        loginUser()
    }
    
    
    @IBAction func signUpBtnAtn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"SignInVC") as! SignInVC
        navigationController?.pushViewController(story, animated: true)
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        let story = self.storyboard?.instantiateViewController(withIdentifier:"forgetPasswordVC") as! forgetPasswordVC
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    //MARK:- Google Integration
    
    func sign(_ signIn: GIDSignIn!, present viewController:UIViewController!) {
        self.present(viewController,animated: true,completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func appleSignin(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            
            request.requestedScopes = [.fullName, .email]
            
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            
            
            authorizationController.delegate = self
            
            authorizationController.presentationContextProvider = self
            
            authorizationController.performRequests()
        }
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        }
        else
        {
            
            let gplusapi = "https://www.googleapis.com/oauth2/v3/userinfo?access_token=\(user!.authentication.accessToken!)"
            let url = NSURL(string: gplusapi)!
            
            
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "GET"
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            let session = URLSession.shared
            
            
            session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
                
                do {
                    let userData = try JSONSerialization.jsonObject(with: data!, options:[]) as? [String:AnyObject]
                    let picture = userData!["picture"] as? String ?? ""
                    let username = userData!["given_name"] as? String ?? ""
                    let fullname = userData!["name"] as? String ?? ""
                    let useremail = userData!["email"] as? String ?? ""
                    let lastname = userData!["family_name"] as? String ?? ""
                    let userId = user.userID ?? ""
                    self.socialoginUser(email : useremail,socialtoken : userId,firstname : username,lastname : lastname, loginType: 2)
                    
                } catch {
                    NSLog("Account Information could not be loaded")
                }
                
            }).resume()
            
            
        }
    }
    
    
}


//MARK:- Api Methos
extension LoginVC {
    func loginUser( ) {
        Indicator.sharedInstance.showIndicator()
        UserVM.sheard.loginUser(login_type: 0, email: emailTF.text!, password: passwordTF.text!, device_type: "ios", device_token: instanceToken, device_id: "") { (success, message, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    UserDefaults.standard.set(message, forKey: "LoginUser")
                    let story = self.storyboard?.instantiateViewController(withIdentifier:"MainTabVC") as! MainTabVC
                    DataManager.isLogin = true
                    self.navigationController?.pushViewController(story, animated: true)
                }else{
                    
                    if message == "Otp not verified!"{
                        let story = self.storyboard?.instantiateViewController(withIdentifier:"MobileVC") as! MobileVC
                        
                        self.navigationController?.pushViewController(story, animated: true)
                    }
                    else{
                        self.showAlert(message: message)
                    }
                    
                    
                    
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }
    }
    
    func socialoginUser(email : String,socialtoken : String,firstname : String,lastname : String,loginType : Int) {
        Indicator.sharedInstance.showIndicator()
        let deviceID  =  UIDevice.current.identifierForVendor!.uuidString
        
        let email1 = email
        UserVM.sheard.socialLogin(email : email,device_type : "ios",device_token : instanceToken,socialtoken : socialtoken,firstname : firstname,lastname : lastname,login_type : loginType, response: { (success, message,email ,mobile, error) in
            if error == nil{
                Indicator.sharedInstance.hideIndicator()
                if success{
                    UserDefaults.standard.set(message, forKey: "LoginUser")
                    let otp_status = UserDefaults.standard.value(forKey: "otp_status") as? String
                    
                    let already_exist =    UserDefaults.standard.value(forKey: "already_exist") as? Int ?? 0
                    
                    if let otp_status = otp_status
                    {
                        if otp_status == "0"
                        {
                            
                            if email == "" && mobile == ""{
                                let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"createAccountVC") as! createAccountVC
                                story.isFromSocialLogin = true
                                
                                story.emailFromSocialLogin = email1 ?? ""
                                self.navigationController?.pushViewController(story, animated: true)
                                return
                            }else if mobile == "" && otp_status == "0"{
                                let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MobileVC") as! MobileVC
                                story.email = email ?? ""
                                
                                 story.isFromSocailLogin = true
                                
                                self.navigationController?.pushViewController(story, animated: true)
                                return
                            }else{
                                let story = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"MobileVC") as! MobileVC
                                
                                 story.email = email ?? ""
                                story.isFromSocailLogin = true
                                self.navigationController?.pushViewController(story, animated: true)
                                return
                            }
                            
                            
                            
                        }
                    }
                    
                    let story = self.storyboard?.instantiateViewController(withIdentifier:"MainTabVC") as! MainTabVC
                    DataManager.isLogin = true
                    self.navigationController?.pushViewController(story, animated: true)
                    
                    
                }else{
                    self.showAlert(message: message)
                }
            }else{
                self.showAlert(message: error?.domain)
            }
        }) { (success, message, error) in
            if error == nil{
                self.showAlert(message: message)
            }else{
                self.showAlert(message: error?.domain)
            }
        }
        
    }
    
    
}
//

@available(iOS 13.0, *)
extension LoginVC: ASAuthorizationControllerDelegate {
    
    // ASAuthorizationControllerDelegate function for authorization failed
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    // ASAuthorizationControllerDelegate function for successful authorization
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential
        {
        case let credential as ASAuthorizationAppleIDCredential:
            
            let email = credential.email
            let appleUserFirstName = credential.fullName?.givenName ?? ""
            apple_id = credential.user
            
            let appleUserLastName = credential.fullName?.familyName ?? ""
            self.socialoginUser(email : "",socialtoken : apple_id ?? "",firstname : appleUserFirstName,lastname : appleUserLastName, loginType: 4 )
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userID) {  (credentialState, error) in
                switch credentialState {
                case .authorized:
                    // The Apple ID credential is valid.
                    break
                case .revoked:
                    // The Apple ID credential is revoked.
                    break
                case .notFound: break
                // No credential was found, so show the sign-in UI.
                default:
                    break
                }
                
                
            }
        case let credential as ASPasswordCredential:
            let credential1 = authorization.credential as? ASAuthorizationAppleIDCredential
            let appleUserFirstName = credential1?.fullName?.givenName ?? ""
            let appleUserLastName = credential1?.fullName?.familyName ?? ""
            apple_id = credential.user
            let email = credential1?.email ?? ""
            self.socialoginUser(email :"",socialtoken : apple_id ?? "",firstname : appleUserFirstName,lastname : appleUserLastName, loginType: 4)
            
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userID) {  (credentialState, error) in
                switch credentialState {
                case .authorized:
                    // The Apple ID credential is valid.
                    break
                case .revoked:
                    // The Apple ID credential is revoked.
                    break
                case .notFound: break
                // No credential was found, so show the sign-in UI.
                default:
                    break
                }
            }
            
        default: break
        }
        //        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
        //            // Create an account as per your requirement
        //            let appleId = appleIDCredential.user ?? ""
        //            let defaults = UserDefaults.standard
        //                      defaults.set(appleId, forKey: "userIdentifier1")
        //
        //                      //Save the UserIdentifier somewhere in your server/database
        //
        //
        //            let appleUserFirstName = appleIDCredential.fullName?.givenName ?? ""
        //            let appleUserLastName = appleIDCredential.fullName?.familyName ?? ""
        //            let appleUserEmail = appleIDCredential.email ?? ""
        //
        //            //Write your code
        //        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
        //            let appleUsername = passwordCredential.user
        //            let applePassword = passwordCredential.password
        //Write your code
    }
    
    
}



extension LoginVC: ASAuthorizationControllerPresentationContextProviding {
    //For present window
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

