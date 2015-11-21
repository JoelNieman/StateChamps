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
    
    let myVideoURL = NSURL(string: "https://youtu.be/6dgBIZc4C70")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()

        var query = PFQuery(className: "Promotion")
        query.getObjectInBackgroundWithId("u3xkpfBLAe") {
            (object:PFObject?, error:NSError?) -> Void in
            
            let promotion = object!["text"] as! String
            
            print(promotion)
            self.promotionalText.text = promotion
//            self.promotionalText.textAlignment =
//            self.promotionalText.font = 
        }
    }

        
        
        
        
//        let promotionalTextString = PFObject(className: "Promotion")
//        promotionalText.text = String(promotionalTextString)
        
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            print("Object has been saved.")
//        }
//    }
    
    //  This sets up the video. The values (0 or 1) change the properties of the video player
    
    func loadVideo() {
        playerView.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "0"
        ]
        playerView.loadVideoURL(myVideoURL!)
    }
}
