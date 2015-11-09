//
//  VideoViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/6/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoViewController: UIViewController {

    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    var selectedVideo: String = ""
    var selectedVideoURL = NSURL()

    

    
    override func viewWillAppear(animated: Bool) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadVideo()
    }
    
    func loadVideo() {
        let selectedVideoURL = NSURL(string: selectedVideo)!
        print(selectedVideoURL)
        videoPlayer.playerVars = [
            "playsinline": "1",
            "controls": "1",
            "showinfo": "0"
        ]
        videoPlayer.loadVideoURL(selectedVideoURL)
    }
}

//func unwindForSegue(unwindSegue: UIStoryboardSegue) {
//    if(unwindSegue.sourceViewController .isKindOfClass(VideoViewController)) {
//        let newListView: AddGroceryListViewController =
//        unwindSegue.sourceViewController as! AddGroceryListViewController
//        let newGroceryList = newListView.newGroceryList
//        
//        listOfGroceryLists.groceryListsArray.append(GroceryList(name: newGroceryList!))
//        self.tableView.reloadData()
//        
//    }
//}

