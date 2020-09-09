//
//  DataManger.swift
//  ClassyDrives
//
//  Created by Mindfull Junkies on 19/07/19.
//  Copyright © 2019 Mindfull Junkies. All rights reserved.
//

import Foundation

class DataManager {
    static var isLogin: Bool?{
        set{
            UserDefaults.standard.setValue(newValue, forKey: kLoginStatus)
            UserDefaults.standard.synchronize()
        }
        get{
            return UserDefaults.standard.bool(forKey: kLoginStatus)
        }
    }
}
