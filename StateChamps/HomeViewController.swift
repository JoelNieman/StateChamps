//
//  HomeViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/3/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import YouTubePlayer
import Parse

class HomeViewController: UIViewController {
    
    @IBOutlet weak var playerView: YouTubePlayerView!
    @IBOutlet weak var promotionalText: UITextView!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var promotionLabel: UIButton!
    
    var myVideoURL = NSURL(string: "")
    var promotionURL = NSURL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        queryParseAndLoadVideo()
    }
        
    func queryParseAndLoadVideo() {
        let query = PFQuery(className: "Promotion")
        query.getObjectInBackgroundWithId("u3xkpfBLAe") {
            (object:PFObject?, error:NSError?) -> Void in
            
            let promotion = object!["text"] as! String
            self.promotionalText.text = promotion
//            self.promotionalText.textAlignment =
//            self.promotionalText.font = 
            
            let headerText = object!["headerText"] as! String
            self.headerText.text = headerText
            
            let homeVideoURL = object!["homeVideoURL"] as! String
            self.myVideoURL = NSURL(string: homeVideoURL)
            
            let promotionLinkURL = object!["promotionURL"] as! String
            self.promotionURL = NSURL(string: promotionLinkURL)
//            self.promotionLabel.text = "Latest promotion goes here"

            self.loadVideo()
        }
    }
    
    //  This sets up the video. The values (0 or 1) change the properties of the video player
    
    func loadVideo() {
        playerView.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "0"
        ]
        playerView.loadVideoURL(myVideoURL!)
    }
    
    //        let testObject = PFObject(className: "TestObject")
    //        testObject["foo"] = "bar"
    //        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
    //            print("Object has been saved.")
    //        }
    //    }
}
