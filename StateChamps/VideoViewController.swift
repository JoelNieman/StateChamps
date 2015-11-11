//
//  VideoViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/6/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    var selectedVideo: String = ""
    var selectedVideoURL = NSURL()
    
    let youTubeVideos = [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    var youTubeVideoSelected = video1
    
    let youTubeVideoIdentifier = "YouTubeVideoIdentifier"
    let videoIdentifier = "ShowVideoSegue"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
    }
    
    func loadVideo() {
        let selectedVideoURL = NSURL(string: youTubeVideoSelected.videoURL!)!
        print(selectedVideoURL)
        videoPlayer.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "0"
        ]
        videoPlayer.loadVideoURL(selectedVideoURL)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youTubeVideos.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tableCell") as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tableCell")
        }
        
        cell.textLabel?.text = youTubeVideos[indexPath.row].title
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        youTubeVideoSelected = youTubeVideos[indexPath.row]
        loadVideo()
    }
    
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == videoIdentifier {
//            if let vc = segue.destinationViewController as? VideoViewController {
//                if let indexPath = tableView.indexPathForSelectedRow {
//                    let selectedVideo = youTubeVideos[indexPath.row]
//                    vc.selectedVideo = selectedVideo.videoURL!
//                }
//            }
//        }
//    }
}


