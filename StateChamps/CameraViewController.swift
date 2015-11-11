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
//    @IBOutlet weak var disposeOfPictureOutlet: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captureImageButton()
        
        //imagepicker for camera and photo library access
        imagePicker.delegate = self
    }


    func captureImageButton() {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userImageView!.contentMode = .ScaleAspectFit
            userImageView!.image = pickedImage
//            disposeOfPictureOutlet.hidden = false
        }
        
        dismissViewControllerAnimated(true) {
        }
    }

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

    
    
    
}