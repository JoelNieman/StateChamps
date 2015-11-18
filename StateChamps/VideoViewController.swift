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
    
    var videosArray: Array<Dictionary<NSObject, AnyObject>> = []
    var apiKey = youTubeClientID
    let playlistID = "PL8dd-D6tYC0Bfo5P_gsClzAKu5fCnQcLs"
    let maxResults = 15
    var youTubeVideoSelected = ""
    
//    var videoDetails:String = ""
    
    //  This next bloc was used to hardcode in the videos.
    //  This initializes my video collection from the "YouTubeVideos.swift" file in the model folder.
//    let youTubeVideos = (youTubeVideoCollection)
    
    //  I'm initializing the first video in the player as video1
//    var youTubeVideoSelected = video1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getVideosForStateChamps()
        loadVideo("")

//        videoSelectionLabel.text! = String(video1.title!)
    }
    
    func loadVideo(videoToLoad: String) {
        let selectedVideoID = ""
        
//        let youTubeVideoSelectedString = String(youTubeVideoSelected)
//        let selectedVideoURL = NSURL(string: youTubeVideoSelected.videoURL!)!

        videoPlayer.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "0"
        ]
            videoPlayer.loadVideoID(youTubeVideoSelected)
        
//        videoPlayer.loadVideoURL(selectedVideoURL)

    }
    
    //  TableView set-up section

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tableCell") as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tableCell")
        }
        
        let videoDetails = videosArray[indexPath.row]
        cell.textLabel?.text = videoDetails["title"] as? String
        return cell
    }
    
    //  LoadVideo() in didSelectRowAtIndexPath updates the video player with the selected video URL.
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let videoDetails = videosArray[indexPath.row]
        youTubeVideoSelected = videoDetails["videoID"] as! String
        loadVideo(youTubeVideoSelected)
        videoSelectionLabel.text! = String(videoDetails["title"]!)
        print(youTubeVideoSelected)
    }
    
    func performGetRequest(targetURL: NSURL!, maxResults: Int, completion: (data: NSData?, HTTPStatusCode: Int, error: NSError?) -> Void) {
        let request = NSMutableURLRequest(URL: targetURL)
        request.HTTPMethod = "GET"
        
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfiguration)
        
        let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(data: data, HTTPStatusCode: (response as! NSHTTPURLResponse).statusCode, error: error)
            })
        })
        
        task.resume()
    }
    
    func getVideosForStateChamps() {
        
        // Form the request URL string.
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(playlistID)&maxResults=\(maxResults)&key=\(apiKey)"
        
        // Create a NSURL object based on the above string.
        let targetURL = NSURL(string: urlString)!
        
        // Fetch the playlist from Google.
        performGetRequest(targetURL, maxResults: 10, completion: { (data, HTTPStatusCode, error) -> Void in
            if HTTPStatusCode == 200 && error == nil {
                do {
                    // Convert the JSON data into a dictionary.
                    let resultsDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! Dictionary<NSObject, AnyObject>
                    
                    // Get all playlist items ("items" array).
                    let items: Array<Dictionary<NSObject, AnyObject>> = resultsDict["items"] as! Array<Dictionary<NSObject, AnyObject>>
                    
                    // Use a loop to go through all video items.
                    for var i=0; i<items.count; ++i {
                        let playlistSnippetDict = (items[i] as Dictionary<NSObject, AnyObject>)["snippet"] as! Dictionary<NSObject, AnyObject>
                        
                        // Initialize a new dictionary and store the data of interest.
                        var desiredPlaylistItemDataDict = Dictionary<NSObject, AnyObject>()
                        
                        desiredPlaylistItemDataDict["title"] = playlistSnippetDict["title"]
                        
                        desiredPlaylistItemDataDict["videoID"] = (playlistSnippetDict["resourceId"] as! Dictionary<NSObject, AnyObject>)["videoId"]
                        
                        // Append the desiredPlaylistItemDataDict dictionary to the videos array.
                        self.videosArray.append(desiredPlaylistItemDataDict)
                        
                        // Reload the tableview.
                        self.videoTableView.reloadData()
                    }
                } catch {
                    print(error)
                }
                print(self.videosArray)
            }
            else {
                print("HTTP Status Code = \(HTTPStatusCode)")
                print("Error while loading channel videos: \(error)")
            }
        })
    }
}


