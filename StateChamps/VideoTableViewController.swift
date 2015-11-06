//
//  VideoTableViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/6/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {

    let youTubeVideos = [video1,video2]
    
    let youTubeVideoIdentifier = "YouTubeVideoIdentifier"
    
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
        var cell = tableView.dequeueReusableCellWithIdentifier(youTubeVideoIdentifier) as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: youTubeVideoIdentifier)
        }
        cell.textLabel?.text = youTubeVideos[indexPath.row].title
        return cell
        

    }
}
