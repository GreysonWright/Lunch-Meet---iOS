//
//  ProfileViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
	
	@IBOutlet var profileImageView: UIImageView!
	@IBOutlet var firstNameField: TextField!
	@IBOutlet var lastNameField: TextField!

    override func viewDidLoad() {
        super.viewDidLoad()

		profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
		profileImageView.layer.borderColor = UIColor.grayColor().CGColor
		profileImageView.layer.borderWidth = 1
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
