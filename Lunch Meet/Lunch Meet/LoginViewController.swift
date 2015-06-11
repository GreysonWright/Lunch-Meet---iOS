//
//  LoginViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	@IBOutlet var usernameField: UITextField!
	@IBOutlet var passwordField: UITextField!
	@IBOutlet var loginButton: UIButton!

	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
    override func viewDidLoad() {
        super.viewDidLoad()

		usernameField.layer.cornerRadius = 10
		usernameField.layer.borderWidth = 1
		usernameField.layer.borderColor = UIColor(red: 0, green: 102/255, blue: 153/255, alpha: 1).CGColor
		usernameField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)

		passwordField.layer.cornerRadius = 10
		passwordField.layer.borderWidth = 1
		passwordField.layer.borderColor = UIColor(red: 0, green: 102/255, blue: 153/255, alpha: 1).CGColor
		passwordField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
		
		loginButton.layer.cornerRadius = 10
		loginButton.layer.borderWidth = 1
		loginButton.layer.borderColor = UIColor(red: 0, green: 102/255, blue: 153/255, alpha: 1).CGColor
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: - UIButton Actions
	@IBAction func loginButtonTapped(sender: AnyObject) {
		
		let mainVC = MainViewController(nibName: "MainViewController", bundle: nil)
		
		let mainNavigationController = UINavigationController(rootViewController: mainVC)
		
		appDelegate.window?.rootViewController = mainNavigationController
		
	}

}
