//
//  VideoTableViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/6/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {

    @IBOutlet var youTubeVideoTableView: UITableView!
    
    let youTubeVideos = [video1,video2]
    var youTubeVideoSelected = YouTubeVideos(title: "Chomper", publishedDate: "Jan 18, 2015", videoURL: "https://youtu.be/qmhtPEHLmEc")
    
    let youTubeVideoIdentifier = "YouTubeVideoIdentifier"
    let videoIdentifier = "ShowVideoSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youTubeVideos.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tableCell") as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tableCell")
        }
        
        cell.textLabel?.text = youTubeVideos[indexPath.row].title
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        youTubeVideoSelected = youTubeVideos[indexPath.row]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == videoIdentifier {
            if let vc = segue.destinationViewController as? VideoViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let selectedVideo = youTubeVideos[indexPath.row]
                    vc.selectedVideo = selectedVideo.videoURL!
                }
            }
        }
    }
    
    @IBAction func unwindForSegue(unwindSegue: UIStoryboardSegue) {
        if(unwindSegue.sourceViewController .isKindOfClass(VideoViewController)) {
        }
    }
}


