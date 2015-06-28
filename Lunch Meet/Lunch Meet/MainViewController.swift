//
//  MainViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Plans"
		
		canDisplayBannerAds = true
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("profileButtonTapped"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: - BarButton Actions
	func profileButtonTapped() {
		
		let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
		
		navigationController?.pushViewController(profileVC, animated: true)
		
	}
	
}
