//
//  TwitterFeedTableViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 12/15/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterFeedTableViewController: TWTRTimelineViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "statechampsnet", APIClient: client)
    }
}
