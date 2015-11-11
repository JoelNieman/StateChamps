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

let video2 = YouTubeVideos(title: "High School Weekend Wrap-Up 11-2015", publishedDate: "Nov 9, 2015", videoURL: "https://youtu.be/gBzfAibgUCc")

let video3 = YouTubeVideos(title: "Prep Sport Junkies Week 11", publishedDate: "Nov 10, 2015", videoURL: "https://youtu.be/osGxhh0Bxlg")

let video4 = YouTubeVideos(title: "State Champs Chat #30", publishedDate: "Nov 10, 2015", videoURL: "https://youtu.be/wwfmL0-0rEc")

let video5 = YouTubeVideos(title: "State Champs! Extra Point", publishedDate: "Nov 8th, 2015", videoURL: "https://youtu.be/cmSPDWlsoMg")

let video6 = YouTubeVideos(title: "State Champs! - November 8th, 2015 Show", publishedDate: "Nov 8th, 2015", videoURL: "https://youtu.be/I45dFKzyg8c")

let video7 = YouTubeVideos(title: "Lawrence Tech: New Women's Lacrosse Coach", publishedDate: "Nov 7, 2015", videoURL: "https://youtu.be/PFmnjRhkwTE")

let video8 = YouTubeVideos(title: "Saline vs. Detroit Country Day - 2015 Division 2 Field Hockey State Championship", publishedDate: "Nov 7, 2015", videoURL: "https://youtu.be/NNxlyk-dt9Y")

let video9 = YouTubeVideos(title: "High School Weekend Wrap-Up 10-2015", publishedDate: "Nov 4, 2015", videoURL: "https://youtu.be/kwOvBtYsNP4")

let video10 = YouTubeVideos(title: "College Football 2015-Craziest Ending To A Football You'll Ever See", publishedDate: "Oct 17, 2015", videoURL: "https://youtu.be/gxbUqaVoDeQ")