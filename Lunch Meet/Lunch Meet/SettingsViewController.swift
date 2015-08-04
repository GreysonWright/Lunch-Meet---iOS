//
//  SettingsViewController.swift
//  Lunch Meet
//
//  Created by greyson on 7/3/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Settings"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .Plain, target: self, action: Selector("logoutButtonTapped"))
		
		canDisplayBannerAds = true
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func logoutButtonTapped() {
		
		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		appDelegate.window!.rootViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
		
	}
	
}
