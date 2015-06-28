//
//  GroupViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/27/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
    override func viewDidLoad() {
        super.viewDidLoad()

		canDisplayBannerAds = true
		
        // Do any additional setup after loading the view.
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
