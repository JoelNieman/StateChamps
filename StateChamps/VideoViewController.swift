//
//  VideoViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/6/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import YouTubePlayer
import Social

class VideoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var videoTableView: UITableView!
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    @IBOutlet weak var videoSelectionLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var showVideosArray: Array<Dictionary<NSObject, AnyObject>> = []
    var highlightVideosArray: Array<Dictionary<NSObject, AnyObject>> = []
    var apiKey = youTubeClientID
    let showsPlaylistID = "PL8dd-D6tYC0DfIJarU3NrrTHvPmMkCjTd"
    let highlightsPlaylistID = "PL8dd-D6tYC0BeICQ2C3hym16jEyj0SzSJ"
    let maxResults = 17
    var youTubeVideoSelected = ""
    var videoID: String!
    var youTubeURL = "https://youtu.be/"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getVideosForStateChamps()
        loadVideo()
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
    
        //  Facebook and Twitter Sharing
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction] {
        
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
                //  Check if Twitter is available, otherwise display an error message
                
                guard
                    SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) else {
                        let alertMessage = UIAlertController(title: "Twitter Unavailable", message: "You haven't registered your Twitter account. Please go to Settings > Twitter to create one.", preferredStyle: .Alert)
                        alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                        self.presentViewController(alertMessage, animated: true, completion: nil)
                        
                        return
                }
                
                // Display Tweet Composer
                let tweetComposer = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
                if self.segmentedControl.selectedSegmentIndex == 0 {
                    
                    let videoDetails = self.showVideosArray[indexPath.row]
                    self.videoID = (videoDetails["videoID"] as! String)
                    tweetComposer.setInitialText(videoDetails["title"] as! String)
                    tweetComposer.addURL(NSURL(string: "\(self.youTubeURL.self)\(self.videoID)\(self.showsPlaylistID)"))
                    self.presentViewController(tweetComposer, animated: true, completion: nil)
                    
                } else {
                    
                    let videoDetails = self.highlightVideosArray[indexPath.row]
                    self.videoID = (videoDetails["videoID"] as! String)
                    tweetComposer.setInitialText(videoDetails["title"] as! String)
                    tweetComposer.addURL(NSURL(string: "\(self.youTubeURL.self)\(self.videoID)\(self.highlightsPlaylistID)"))
                    self.presentViewController(tweetComposer, animated: true, completion: nil)
                    
                }
            })

                
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                
                //  Check if Facebook is available, otherwise display an error message
                guard
                    SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) else {
                        let alertMessage = UIAlertController(title: "Facebook Unavailable", message: "You haven't registered your Facebook account. Please go to Settings > Facebook to create one.", preferredStyle: .Alert)
                        alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                        self.presentViewController(alertMessage, animated: true, completion: nil)
                        
                        return
                }
                

                
                //  Display Facebook Composer
                let facebookComposer = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
                
                if self.segmentedControl.selectedSegmentIndex == 0 {
                
                let videoDetails = self.showVideosArray[indexPath.row]
                self.videoID = (videoDetails["videoID"] as! String)
                facebookComposer.setInitialText(videoDetails["title"] as! String)
                facebookComposer.addURL(NSURL(string: "\(self.youTubeURL.self)\(self.videoID)\(self.showsPlaylistID)"))
                self.presentViewController(facebookComposer, animated: true, completion: nil)
                
                } else {
                
                let videoDetails = self.highlightVideosArray[indexPath.row]
                self.videoID = (videoDetails["videoID"] as! String)
                facebookComposer.setInitialText(videoDetails["title"] as! String)
                facebookComposer.addURL(NSURL(string: "\(self.youTubeURL.self)\(self.videoID)\(self.highlightsPlaylistID)"))
                self.presentViewController(facebookComposer, animated: true, completion: nil)
                
                }
            })
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            }
        )
        
        return [shareAction]
    }
    

    //  End TableView set-up section---------------------------------------------
    
    
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
        
        // Fetch the playlist from YouTube.
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
                    print(self.highlightVideosArray)
                }
                else {
                    print("HTTP Status Code = \(HTTPStatusCode)")
                    print("Error while loading channel videos: \(error)")
                }
            })
        }
    }
    
    //  Should set this up so it only calls twice.
    
    @IBAction func segmentedControlPressed(sender: AnyObject) {
        getVideosForStateChamps()
    }
    
    //  End YouTube API set-up section-------------------------------------------
    
}
