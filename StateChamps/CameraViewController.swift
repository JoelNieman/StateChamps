//
//  CameraViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/11/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imagepicker for camera and photo library access
        imagePicker.delegate = self
    }


    @IBAction func captureImageButton(sender: AnyObject) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userImageView!.contentMode = .ScaleAspectFit
            userImageView!.image = pickedImage
        }
        
        dismissViewControllerAnimated(true) {
        }
    }

func takeANewPhoto(sender: UIButton) {
    if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.cameraCaptureMode = .Photo
    }
        
    else if UIImagePickerController.availableCaptureModesForCameraDevice(.Front) != nil {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.cameraCaptureMode = .Photo
        }
    }
}