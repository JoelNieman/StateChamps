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
    @IBOutlet weak var videoSelectionLabel: UILabel!
    
    //  This initializes my video collection from the "YouTubeVideos.swift" file in the model folder.
    let youTubeVideos = (youTubeVideoCollection)
    
    //  I'm initializing the first video in the player as video1
    var youTubeVideoSelected = video1

    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
        videoSelectionLabel.text! = String(video1.title!)
    }
    
    //  Same function from the HomeViewController. Works the same.
    
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
    
    //  TableView set-up section
    
    //  Considering setting this up to a 2 section table
    //  1 for State Champs! media and another for user uploads.

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youTubeVideos.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tableCell") as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "tableCell")
        }
        
        cell.textLabel?.text = youTubeVideos[indexPath.row].title
        cell.detailTextLabel?.text = youTubeVideos[indexPath.row].publishedDate
        return cell
    }
    
    //  LoadVideo() in didSelectRowAtIndexPath updates the video player with the selected video URL.
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        youTubeVideoSelected = youTubeVideos[indexPath.row]
        loadVideo()
        videoSelectionLabel.text! = String(youTubeVideoSelected.title!)
    }
}


