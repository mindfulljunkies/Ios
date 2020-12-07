//
//  AppDelegate.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 08/06/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import GooglePlaces
import GoogleSignIn
import Firebase
import TwitterKit
import FirebaseCrashlytics
import UserNotificationsUI
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate,MessagingDelegate {

    var window: UIWindow?
    static var originalAppDelegate : AppDelegate!
    func sharedInstance() -> AppDelegate{
        return AppDelegate.originalAppDelegate
    }
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        // 1. Convert device token to string
//        let tokenParts = deviceToken.map { data -> String in
//            return String(format: "%02.2hhx", data)
//        }
//        let token = tokenParts.joined()
//        // 2. Print device token to use for PNs payloads
//        print("Device Token: \(token)")
//    }

   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerForPushNotifications()
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
      setrootVC()
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        AppDelegate.originalAppDelegate = self
    
        Messaging.messaging().delegate = self
        TWTRTwitter.sharedInstance().start(withConsumerKey:"khXsQ5v4Vo41lzpQtvMXdu0dl",consumerSecret: "eriMOgEqkycb5SKTaVsumyrrWn4yHAHLsvmBmBnCSqGnIeoMFR")
        GMSServices.provideAPIKey("AIzaSyDsubgZoCwep7yULBIQzhBtljGW4KmB8_4")
        GMSPlacesClient.provideAPIKey("AIzaSyDsubgZoCwep7yULBIQzhBtljGW4KmB8_4")
       
        
        GIDSignIn.sharedInstance().clientID = "724312618163-9jcikfo2ru7phqdlktj5qc0kon5hdjnl.apps.googleusercontent.com"
        
       return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
       }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        TWTRTwitter.sharedInstance().application(app, open: url, options: options)
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    func setrootVC(){
        
        if DataManager.isLogin == true {
            if UserDefaults.standard.value(forKey: "LoginUser") != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "MainTabVC") as! MainTabVC
                navigationController.viewControllers = [initialViewController]
                self.window?.rootViewController = navigationController
                self.window?.makeKeyAndVisible()
            }else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "StartVC") as! StartVC
                navigationController.viewControllers = [initialViewController]
                self.window?.rootViewController = navigationController
                self.window?.makeKeyAndVisible()
            }
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "StartVC") as! StartVC
            navigationController.viewControllers = [initialViewController]
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
        }
        
       
      }
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current()
                 .requestAuthorization(options: [.alert, .sound, .badge]) {
            [weak self] granted, error in
              
            print("Permission granted: \(granted)")
            guard granted else { return }
            self?.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
      UNUserNotificationCenter.current().getNotificationSettings { settings in
        print("Notification settings: \(settings)")
        guard settings.authorizationStatus == .authorized else { return }
        DispatchQueue.main.async {
          UIApplication.shared.registerForRemoteNotifications()
        }
      }
    }
    
//    func fireBasesubscribeToTopic(subscribeToTopic subscribe:Bool = false){
//
//     if  let subscribeTopic = subscribeTopic , !subscribeTopic.isEmpty {
//          if subescribe {
//            Messaging.messaging().subscribe(toTopic: "\(subscribeTopic)")
//
//          }else{
//            Messaging.messaging().unsubscribe(fromTopic: "\(subscribeTopic)")
//          }
//
//      }
//    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
      print("Firebase registration token: \(fcmToken)")

      InstanceID.instanceID().instanceID { result, error in
          if let error = error {
              print("Error fetching remote instance ID: \(error)")
          } else if let result = result {
              print("Remote instance ID token: \(result.token)")
            
           // instanceToken  = result.token
          }
      }
    }

    
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
     
    Messaging.messaging().apnsToken = deviceToken as Data
     guard let refreshedToken = Messaging.messaging().fcmToken else{return}
         print("FCM token retrieved: \(refreshedToken)")
         
     instanceToken = refreshedToken
         }

    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register: \(error)")
    }
    
}

extension AppDelegate{
    
    //Called when a notification is delivered to a foreground app.
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        NSLog(" User Info : %@",notification.request.content.userInfo)
        
        let userInfo = notification.request.content.userInfo
        // create a sound ID, in this case its the tweet sound.
        
        let systemSoundID: SystemSoundID = 1315//1003 // SMSReceived (see SystemSoundID below)
        // to play sound
        AudioServicesPlaySystemSound (systemSoundID)
        
        if UIApplication.shared.applicationState == .active {
            let showAction = self.didReceiveRemoteNotification(userAction: false, resRPUsernse: userInfo)
             if showAction == true {
                completionHandler([.alert, .badge, .sound])
            }else{
                //   completionHandler([.badge, .sound])
            }
        }
        
        
    }
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive resRPUsernse: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = resRPUsernse.notification.request.content.userInfo
        
        _ =  self.didReceiveRemoteNotification(userAction: true,resRPUsernse: userInfo)
        completionHandler()
    }
    
    
    //MARK: -didReceiveRemoteNotification-
    func didReceiveRemoteNotification(userAction:Bool = true,resRPUsernse userInfo: [AnyHashable : Any])->Bool    {
        print("userInfo =" , userInfo)
     return true
    }
    
}
