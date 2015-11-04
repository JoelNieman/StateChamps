//
//  HomeViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/3/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import YouTubePlayer

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var playerView: YouTubePlayerView!

    let myVideoURL = NSURL(string: "https://youtu.be/6dgBIZc4C70")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadVideo() {
        playerView.playerVars = [
            "playsinline": "1",
            "controls": "0",
            "showinfo": "0"
        ]
        playerView.loadVideoURL(myVideoURL!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
