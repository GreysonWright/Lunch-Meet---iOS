//
//  ProfileViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

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
	@IBOutlet var signOutButton: UIButton!

	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Profile"
		
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
		
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	//MARK: - UIButton Actions
	@IBAction func settingsButtonTapped(sender: AnyObject) {
		
		let settingsVC = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
		navigationController?.pushViewController(settingsVC, animated: true)
		
	}
	
	@IBAction func editProfileImageButtonTapped(sender: AnyObject) {
		
		let editImageVC = EditProfileImageViewController(nibName: "EditProfileImageViewController", bundle: nil)
		navigationController?.pushViewController(editImageVC, animated: true)
		
	}
	
	@IBAction func friendsButtonTapped(sender: AnyObject) {
		
		let friendVC = FriendViewController(nibName: "FriendViewController", bundle: nil)
		navigationController?.pushViewController(friendVC, animated: true)
		
	}
	
	@IBAction func groupsButtonTapped(sender: AnyObject) {
		
		let groupVC = GroupViewController(nibName: "GroupViewController", bundle: nil)
		navigationController?.pushViewController(groupVC, animated: true)
		
	}
	
	@IBAction func signOutButtonTapped(sender: AnyObject) {
		
		appDelegate.window?.rootViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
		
	}
}
