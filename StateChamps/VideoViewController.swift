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
    
    //  This is my collection of objects. They are created on the "YouTubeVideos.swift" file in the model folder.
    let youTubeVideos = [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    
    //  I'm initializing the first video in the player as video1
    var youTubeVideoSelected = video1

    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        youTubeVideoSelected = youTubeVideos[indexPath.row]
        loadVideo()
    }
}


