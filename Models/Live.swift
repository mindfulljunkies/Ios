//
//  Live.swift
//  Tana
//
//  Created by Gurpreet Singh on 28/06/19.
//  Copyright © 2019 Gurpreet Singh. All rights reserved.
//

import Foundation

public class Live {
    
    
    public var id : Int?
    public var url : String?
    public var youtubeUrl : String?
    
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let User_list = User.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of User Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Live]
    {
        var models:[Live] = []
        for item in array
        {
            models.append(Live(dictionary: item as! NSDictionary)!)
        }
        return models
        
    }
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let User = User(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: User Instance.
     */
    required public init?(dictionary: NSDictionary) {
        print(dictionary)
        id = dictionary["id"] as? Int
        url = dictionary["url"] as? String
        youtubeUrl = dictionary["youtubeUrl"] as? String

        
        
    }
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.url, forKey: "url")
        dictionary.setValue(self.youtubeUrl, forKey: "youtubeUrl")

        return dictionary
    }
    
}
