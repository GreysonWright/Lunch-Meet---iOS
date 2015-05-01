//
//  LoginViewController.swift
//  Lunch Meet
//
//  Created by greyson on 4/27/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet var usernameField: UITextField!
	@IBOutlet var passwordField: UITextField!
	@IBOutlet var loginButton: UIButton!
	
	@IBOutlet var loadingView: UIVisualEffectView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		usernameField.delegate = self
		passwordField.delegate = self
		
		let textFieldTint = UIColor(red: 0/255, green: 51/255, blue: 153/255, alpha: 1)
		
		usernameField.tintColor = textFieldTint
		passwordField.tintColor = textFieldTint
		usernameField.textColor = textFieldTint
		passwordField.textColor = textFieldTint
		usernameField.layer.cornerRadius = 5
		passwordField.layer.cornerRadius = 5
		usernameField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
		passwordField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0)
		
		loadingView.frame = UIScreen.mainScreen().bounds
		view.addSubview(loadingView)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		if textField == usernameField{
			passwordField.becomeFirstResponder()
		} else{
			passwordField.resignFirstResponder()
			login()
		}
		return true
	}
	
	@IBAction func loginButtonTapped(sender: AnyObject) {
		login()
	}
	
	func login(){
		
		usernameField.resignFirstResponder()
		passwordField.resignFirstResponder()
		
		loadingView.hidden = false
		
		let request = LoginRequest()
		DepotSingleton.sharedDepot.login(request, response: { (response: LoginResponse?) -> Void in
			if response != nil{
				dispatch_async(dispatch_get_main_queue(), { () -> Void in
					
					let feedNavController = UINavigationController(rootViewController: FeedTableViewController(nibName: "FeedTableViewController", bundle: nil))
					
					let profileNavController = UINavigationController(rootViewController: ProfileViewController(nibName: "ProfileViewController", bundle: nil))
					
					let tabbar = UITabBarController()
					tabbar.viewControllers = [feedNavController, profileNavController]
					LunchMeetSingleton.sharedInstance.appDelegate.window?.rootViewController = tabbar
					
					self.loadingView.hidden = true
				})
			}
		})
	}
	
	@IBAction func signUpButtonTapped(sender: AnyObject) {
		let signUpNavController = UINavigationController(rootViewController: SignUpViewController(nibName: "SignUpViewController", bundle: nil))
		presentViewController(signUpNavController, animated: true, completion: nil)
		
	}
}
