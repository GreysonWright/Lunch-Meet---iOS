//
//  EditProfileImageViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/27/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import MobileCoreServices


class EditProfileImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@IBOutlet var imageView: UIImageView!
	@IBOutlet var noImageLabel: UILabel!

	var savedImage: UIImage?
	var newMedia: Bool?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if savedImage != nil {
			
			imageView.image = savedImage
			noImageLabel.hidden = true
			
		} else {
			
			imageView.backgroundColor = UIColor.whiteColor()
			noImageLabel.hidden = false
			
		}
		
		imageView.layer.borderColor = UIColor.grayColor().CGColor
		imageView.layer.borderWidth = 1
		
        // Do any additional setup after loading the view.
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func presentImagePicker(sourceType: UIImagePickerControllerSourceType) {
		
		if UIImagePickerController.isSourceTypeAvailable(sourceType) {
			
			let imagePickerVC = UIImagePickerController()
			
			imagePickerVC.delegate = self
			imagePickerVC.sourceType = sourceType
			imagePickerVC.mediaTypes = [kUTTypeImage as NSString]
			imagePickerVC.allowsEditing = false
			
			self.presentViewController(imagePickerVC, animated: true, completion: nil)
			newMedia = true
			
		}
		
	}
	
	//MARK: - UIImagePickerController
	func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
		
		imageView.image = image
		LunchMeetSingleton.sharedInstance.image = image
		
		noImageLabel.hidden = true
		
		picker.dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	//MARK: - UIButton Actions
	@IBAction func doneButtonTapped(sender: AnyObject) {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	@IBAction func photoButtonTapped(sender: AnyObject) {
		
		presentImagePicker(.PhotoLibrary)
		
	}
	
	@IBAction func cameraButtonTapped(sender: AnyObject) {
		
		presentImagePicker(.Camera)
		
	}
	
}
