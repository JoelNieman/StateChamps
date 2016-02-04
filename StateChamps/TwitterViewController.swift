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
        
        
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                    message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.Alert
                )
                let alertAction = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    self.makeAPICall()
                })
                alert.addAction(alertAction)
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                print("Login error: \(error!.localizedDescription)");
            }
            
        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
    }
    
func makeAPICall() {
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "statechampsnet", APIClient: client)

        tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
    }
}
