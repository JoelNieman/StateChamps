//
//  TwitterViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/11/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit

class TwitterViewController: UIViewController {

    @IBOutlet weak var userInputTweetField: UITextView!
    @IBOutlet weak var tweetCharacterCount: UITextField!

    @IBOutlet weak var tweet2: UIButton!
    
    var tweetCharacters = Int()
    let characterLimit = 140
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func submitTweetButton(sender: AnyObject) {
        areYouSureAlert()
    }

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
    @IBAction func tweet2ButtonPressed(sender: AnyObject) {
        tweet2.imageView = 
        
    }
}
