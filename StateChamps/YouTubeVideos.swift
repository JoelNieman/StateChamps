//
//  YouTubeVideos.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/5/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import Foundation

//  Set this up as a class because I might later use inheritence to sort (i.e., categories)

class YouTubeVideos {
    var title: String?
    var publishedDate:String?
    var videoURL: String?
    
    init (title: String, publishedDate: String, videoURL: String) {
        self.title = title
        self.publishedDate = publishedDate
        self.videoURL = videoURL
    }
}
