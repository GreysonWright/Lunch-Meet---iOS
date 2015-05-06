//
//  ProfileViewController.swift
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	@IBOutlet var editProfileButton: UIButton!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        // Do any additional setup after loading the view.
		
		editProfileButton.layer.borderWidth = 0.5
		editProfileButton.layer.borderColor = UIColor(red: 70, green: 102, blue: 153, alpha: 1).CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		title = "Me"
		tabBarItem.image = UIImage(named: "Image")
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@IBAction func editProfileButtonTapped(sender: AnyObject) {
		
	}
	
}
