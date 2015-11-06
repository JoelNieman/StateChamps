//
//  VideoViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/6/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoViewController: UIViewController {

    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    var selectedVideo = String()
    
    let myVideoURL = NSURL(selectedVideo)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
    }
    
    func loadVideo() {
       videoPlayer.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "0"
        ]
        videoPlayer.loadVideoURL(myVideoURL!)
    }
}
