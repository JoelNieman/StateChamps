//
//  YouTubeVideos.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/5/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import Foundation

class YouTubeVideos {
    var title: String
    var published: NSDate
    var videoURL: String
    
    init (title: String, published: NSDate, videoURL: String) {
        self.title = title
        self.published = published
        self.videoURL = videoURL
    }
}
