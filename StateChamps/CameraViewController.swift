//
//  CameraViewController.swift
//  StateChamps
//
//  Created by Joel Nieman on 11/11/15.
//  Copyright © 2015 JoelNieman. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //  Still working on this view controller quite a bit.
    //  Modeling it after the instagram image capture feature.
    
    @IBOutlet weak var userImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    //  captureImageButton called on viewDidLoad makes the camera feature appear first.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureImageButton()
        
    //  imagepicker for camera access
        imagePicker.delegate = self
    }

    //  This is makes the view controller the camera.
    
    func captureImageButton() {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //  This is how the image is set when the capture button is pressed.
    //  The image captured is called the "pickedImage"

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userImageView!.contentMode = .ScaleAspectFit
            userImageView!.image = pickedImage
//            disposeOfPictureOutlet.hidden = false
        }
        
        dismissViewControllerAnimated(true) {
        }
    }
}


    //  getting familiar with below code. Something I borrowed from Kate.
    

//func takeANewPhoto(sender: UIButton) {
//    if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
//        imagePicker.cameraCaptureMode = .Photo
//    }
//        
//    else if UIImagePickerController.availableCaptureModesForCameraDevice(.Front) != nil {
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
//        imagePicker.cameraCaptureMode = .Photo
//        }
//    }
//    
//    @IBAction func disposeOfPictureButton(sender: AnyObject) {
//    }

    
    
    
