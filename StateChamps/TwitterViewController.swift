//
//  TwitterViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/11/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: TWTRTimelineViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "statechampsnet", APIClient: client)
        
        tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
    }
}
