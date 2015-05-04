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
	@IBOutlet var signUpButton: UIButton!
	
	@IBOutlet var loadingView: UIVisualEffectView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		UINavigationBar.appearance().barTintColor = UIColor(red: 0/255, green: 102/255, blue: 153/255, alpha: 1)
		
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
		usernameField.addTarget(self, action:"editingChanged:", forControlEvents: .EditingChanged);
		passwordField.addTarget(self, action:"editingChanged:", forControlEvents:.EditingChanged);
		
		loadingView.frame = UIScreen.mainScreen().bounds
		view.addSubview(loadingView)
		
		loginButton.layer.cornerRadius = 15
		signUpButton.layer.cornerRadius = 15
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		usernameField.becomeFirstResponder()
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
	
	func editingChanged(textField: UITextField){
		if usernameField.text != "" && passwordField.text != ""{
			loginButton.enabled = true
			loginButton.alpha = 1
		} else{
			loginButton.enabled = false
			loginButton.alpha = 0.5
		}
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
			dispatch_async(dispatch_get_main_queue(), { () -> Void in
				if response != nil{
					
					let feedNavController = UINavigationController(rootViewController: FeedTableViewController(nibName: "FeedTableViewController", bundle: nil))
					
					let profileNavController = UINavigationController(rootViewController: ProfileViewController(nibName: "ProfileViewController", bundle: nil))
					
					let tabbarController = UITabBarController()
					tabbarController.tabBar.barTintColor = UIColor(red: 0/255, green: 102/255, blue: 153/255, alpha: 1)
					tabbarController.tabBar.tintColor = UIColor(red: 0/255, green: 51/255, blue: 153/255, alpha: 1)
					tabbarController.viewControllers = [feedNavController, profileNavController]
					LunchMeetSingleton.sharedInstance.appDelegate.window?.rootViewController = tabbarController
					
					self.loadingView.hidden = true
				} else{
					self.loadingView.hidden = true
					let alertView = UIAlertView(title: "Uh oh!", message: "Looks like your account doesn't exist. If you think you have an account, check your internet connection.", delegate: self, cancelButtonTitle: "Ok")
					alertView.show()
				}
			})
		})
	}
	
	@IBAction func signUpButtonTapped(sender: AnyObject) {
		let signUpNavController = UINavigationController(rootViewController: SignUpViewController(nibName: "SignUpViewController", bundle: nil))
		presentViewController(signUpNavController, animated: true, completion: nil)
		
	}
}
