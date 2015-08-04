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
		navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .Plain, target: self, action: Selector("logoutButtonTapped"))
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: Selector("doneButtonTapped"))
		
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
	
	func doneButtonTapped() {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
}
