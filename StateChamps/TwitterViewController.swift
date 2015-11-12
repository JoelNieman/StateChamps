//
//  TwitterViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/11/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {
    
    //  This view controller will be used to 1) allow the user to post to twitter and 2) see the latest twitter posts by State Champs

    @IBOutlet weak var userInputTweetField: UITextView!
    @IBOutlet weak var tweetCharacterCount: UITextField!
    
    //  These items will be used later to count and limit the number of characters to 140
    //  Need to figure out how to count the characters in a Text View (it's different than a text field)
    
//    var tweetCharacters = Int()
//    let characterLimit = 140
    
    //  Working on setting up the tweets. They should change when touched.

//    @IBOutlet weak var tweet2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //  Twitter API doesn't work yet. This is just representative functionality.
    
    @IBAction func submitTweetButton(sender: AnyObject) {
        areYouSureAlert()
    }
    
    //  Gets rid of keyboard.

    @IBAction func stateChampsButton(sender: AnyObject) {
        userInputTweetField.resignFirstResponder()
    }
    
    func areYouSureAlert() {
        userInputTweetField.resignFirstResponder()
        let alertController = UIAlertController(title: "Are you sure you want to send this Tweet?", message: "Always second guess your social media decisions", preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: {
            (action: UIAlertAction!) in
            self.userInputTweetField.text = "@statechampsnet "
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (action: UIAlertAction!) in
            self.userInputTweetField.text = "@statechampsnet "
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    //   Working on changing the tweets when touching the image. 
    
//    @IBAction func tweet2ButtonPressed(sender: AnyObject) {
//    }
}
