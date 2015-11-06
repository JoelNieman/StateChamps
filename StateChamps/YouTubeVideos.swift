//
//  YouTubeVideos.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/5/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import Foundation

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

let video1 = YouTubeVideos(title: "West Side Elite Week 11", publishedDate: "Nov 4, 2015", videoURL: "https://youtu.be/p06_v8zu8Oc")

let video2 = YouTubeVideos(title: "High School Weekend Wrap-Up 10-2015", publishedDate: "Nov 4, 2015", videoURL: "https://youtu.be/kwOvBtYsNP4")