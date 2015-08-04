//
//  ProfileViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import MobileCoreServices

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	@IBOutlet var scrollView: UIScrollView!
	@IBOutlet var containerView: UIView!
	
	@IBOutlet var profileImageView: UIImageView!
	@IBOutlet var editButton: UIButton!
	
	@IBOutlet var firstNameField: TextField!
	@IBOutlet var lastNameField: TextField!
	@IBOutlet var emailField: TextField!
	@IBOutlet var birthdateField: TextField!
	@IBOutlet var cityStateField: TextField!
	@IBOutlet var restaurantField: TextField!
	@IBOutlet var friendsButton: UIButton!
	@IBOutlet var groupsButton: UIButton!

	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
	var savedImage: UIImage?
	var newMedia: Bool?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Profile"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: Selector("settingsNavigationButtonTapped:"))
		
		editButton.layer.cornerRadius = editButton.frame.height / 2
		
		profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
		profileImageView.layer.borderColor = UIColor.grayColor().CGColor
		profileImageView.layer.borderWidth = 1
		
		containerView.frame.size.width = UIScreen.mainScreen().bounds.width
		scrollView.contentSize = containerView.frame.size
		scrollView.addSubview(containerView)
		
		canDisplayBannerAds = true
		
        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		profileImageView.image = LunchMeetSingleton.sharedInstance.image
		
		if profileImageView.image == nil {
			
			editButton.setTitle("Add", forState: .Normal)
			
		} else {
			
			editButton.setTitle("Edit", forState: .Normal)
			
		}
		
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
	
	//MARK: - UITextField
	@IBAction func textFieldDidBeginEditing(textField: UITextField) {
		
		if textField == birthdateField {
			
			let containerView = UIView(frame: UIScreen.mainScreen().bounds)
			containerView.backgroundColor = UIColor.blackColor()
			containerView.alpha = 0.3
			
			let datePickerView = UIDatePicker(frame: UIScreen.mainScreen().bounds)
//			datePickerView.addTarget(self, action: Selector("dateSelected"), forControlEvents: UIControlEvents.ValueChanged)
			containerView.addSubview(datePickerView)
			
			view.addSubview(containerView)
			
			textField.resignFirstResponder()
			
		}
		
	}
	
	//MARK: - UIImagePickerController
	func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
		
		profileImageView.image = image
		LunchMeetSingleton.sharedInstance.image = image
		
		editButton.setTitle("edit", forState: UIControlState.Normal)
		
		picker.dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	//MARK: - NavButton Actions
	func settingsNavigationButtonTapped(sender: AnyObject) {
		
		let settingsVC = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
		let settingsNavigationController = UINavigationController(rootViewController: settingsVC)
		
		navigationController?.presentViewController(settingsNavigationController, animated: true, completion: nil)
		
	}
	
	//MARK: - UIButton Actions
	@IBAction func editProfileImageButtonTapped(sender: AnyObject) {
		
		let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
		actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (action: UIAlertAction!) -> Void in
			
			self.presentImagePicker(.PhotoLibrary)
			
		}))
		actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (action: UIAlertAction!) -> Void in
			
			self.presentImagePicker(.Camera)
			
		}))
		actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
		presentViewController(actionSheet, animated: true, completion: nil)
		
	}
	
	@IBAction func friendsButtonTapped(sender: AnyObject) {
		
		let friendVC = ProfileListTableViewController(nibName: "ProfileListTableViewController", bundle: nil)
		friendVC.title = "Friends"
		
		navigationController?.pushViewController(friendVC, animated: true)
		
	}
	
	@IBAction func groupsButtonTapped(sender: AnyObject) {
		
		let groupVC = ProfileListTableViewController(nibName: "ProfileListTableViewController", bundle: nil)
		groupVC.title = "Parties"
		
		navigationController?.pushViewController(groupVC, animated: true)
		
	}
	
}
