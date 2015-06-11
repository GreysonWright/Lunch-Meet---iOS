//
//  MainViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import iAd

class MainViewController: UIViewController, ADBannerViewDelegate {

	var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
    override func viewDidLoad() {
        super.viewDidLoad()

		canDisplayBannerAds = true
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("profileButtonTapped"))
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

	//MARK: - BarButton Actions
	func profileButtonTapped() {
		
		let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
		
		navigationController?.pushViewController(profileVC, animated: true)
		
	}
	
}
