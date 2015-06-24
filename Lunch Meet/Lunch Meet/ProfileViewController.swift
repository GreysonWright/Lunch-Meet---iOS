//
//  ProfileViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import iAd

class ProfileViewController: UIViewController, ADBannerViewDelegate {

	@IBOutlet var scrollView: UIScrollView!
	@IBOutlet var containerView: UIView!
	
	@IBOutlet var profileImageView: UIImageView!
	@IBOutlet var editButton: UIButton!
	
	@IBOutlet var firstNameField: TextField!
	@IBOutlet var lastNameField: TextField!
	@IBOutlet var birthdateField: TextField!
	@IBOutlet var cityStateField: TextField!
	@IBOutlet var restaurantField: TextField!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let navSegmentedControl = UISegmentedControl(items: ["Profile", "Friends", "Groups"])
		navigationItem.titleView = navSegmentedControl
		
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	//MARK: - ADBannerViewDelegate
	func bannerViewWillLoadAd(banner: ADBannerView!) {
		
		
		
	}
	
	func bannerViewDidLoadAd(banner: ADBannerView!) {
		
		
		
	}
	
	func bannerViewActionDidFinish(banner: ADBannerView!) {
		
		//optional resume paused game code
		
	}
	
	func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
		
		//optional pause game code
		
		return true
	}
	
	func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
		
		
		
	}
	
}
