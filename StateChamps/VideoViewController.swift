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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var showVideosArray: Array<Dictionary<NSObject, AnyObject>> = []
    var highlightVideosArray: Array<Dictionary<NSObject, AnyObject>> = []
    var apiKey = youTubeClientID
    let showsPlaylistID = "PL8dd-D6tYC0Bfo5P_gsClzAKu5fCnQcLs"
    let highlightsPlaylistID = "PL8dd-D6tYC0C5v4Qx8DR9p6l8-v_1LLMt"
    let maxResults = 15
    var youTubeVideoSelected = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getVideosForStateChamps()
        loadVideo()

        //  videoSelectionLabel.text! = String(video1.title!)
    }
    
    func loadVideo() {
        videoPlayer.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "0"
        ]
            videoPlayer.loadVideoID(youTubeVideoSelected)
    }
    
    
    
    
    //  TableView set-up section--------------------------------------------------

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return showVideosArray.count
        } else {
            return highlightVideosArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("tableCell") as UITableViewCell!
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tableCell") }
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let videoDetails = showVideosArray[indexPath.row]
            cell.textLabel?.text = videoDetails["title"] as? String
            return cell
        } else {
            let videoDetails = highlightVideosArray[indexPath.row]
            cell.textLabel?.text = videoDetails["title"] as? String
            return cell
        }
    }
    //  LoadVideo() in didSelectRowAtIndexPath updates the video player with the selected video URL.
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let videoDetails = showVideosArray[indexPath.row]
            youTubeVideoSelected = videoDetails["videoID"] as! String
            videoSelectionLabel.text! = String(videoDetails["title"]!)
            print(youTubeVideoSelected)
            loadVideo()
        } else {
            let videoDetails = highlightVideosArray[indexPath.row]
            youTubeVideoSelected = videoDetails["videoID"] as! String
            videoSelectionLabel.text! = String(videoDetails["title"]!)
            print(youTubeVideoSelected)
            loadVideo()
        }
    }

    
    
    
    //  YouTube API set-up section-----------------------------------------------
    
    func performGetRequest(targetURL: NSURL!, completion: (data: NSData?, HTTPStatusCode: Int, error: NSError?) -> Void) {
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
        if segmentedControl.selectedSegmentIndex == 0 {
            
        //  Form the request URL string.
        //  This is where I define the parameters of the search (i.e., PlaylistID, MaxResults, & APIKey)
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(showsPlaylistID)&maxResults=\(maxResults)&key=\(apiKey)"
        
        // Create a NSURL object based on the above string.
        let targetURL = NSURL(string: urlString)!
        
        // Fetch the playlist from Google.
        performGetRequest(targetURL, completion: { (data, HTTPStatusCode, error) -> Void in
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
                        self.showVideosArray.append(desiredPlaylistItemDataDict)
                        
                        // Reload the tableview.
                        self.videoTableView.reloadData()
                    }
                } catch {
                    print(error)
                }
                print(self.showVideosArray)
            }
            else {
                print("HTTP Status Code = \(HTTPStatusCode)")
                print("Error while loading channel videos: \(error)")
            }
        })
        } else {
            
            //  Form the request URL string.
            //  This is where I define the parameters of the search (i.e., PlaylistID, MaxResults, & APIKey)
            let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(highlightsPlaylistID)&maxResults=\(maxResults)&key=\(apiKey)"
            
            // Create a NSURL object based on the above string.
            let targetURL = NSURL(string: urlString)!
            
            // Fetch the playlist from Google.
            performGetRequest(targetURL, completion: { (data, HTTPStatusCode, error) -> Void in
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
                            self.highlightVideosArray.append(desiredPlaylistItemDataDict)
                            
                            // Reload the tableview.
                            self.videoTableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                    print(self.showVideosArray)
                }
                else {
                    print("HTTP Status Code = \(HTTPStatusCode)")
                    print("Error while loading channel videos: \(error)")
                }
            })
        }
    }
    
    @IBAction func segmentedControlPressed(sender: AnyObject) {
        getVideosForStateChamps()
    }
    
}
