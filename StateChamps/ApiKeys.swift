//
//  ApiKeys.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/16/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import Foundation

func valueForAPIKey(keyname:String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource("ApiKeys", ofType:"plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    
    let value:String = plist?.objectForKey(keyname) as! String
    return value
}

let youTubeClientID = valueForAPIKey("YOUTUBE_API_CLIENT_ID")
let twitterClientID = valueForAPIKey("TWITTER_CONSUMER_KEY")
