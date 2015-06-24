//
//  LoginViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet var usernameField: UITextField!
	@IBOutlet var passwordField: UITextField!
	@IBOutlet var loginButton: UIButton!
	@IBOutlet var forgotPasswordButtonBottomConstraint: NSLayoutConstraint!

	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide"), name: UIKeyboardWillHideNotification, object: nil)
		
		usernameField.delegate = self
		passwordField.delegate = self
		
		loginButton.layer.cornerRadius = 3
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func login() {
		
		let mainVC = MainViewController(nibName: "MainViewController", bundle: nil)
		
		let mainNavigationController = UINavigationController(rootViewController: mainVC)
		
		appDelegate.window?.rootViewController = mainNavigationController
		
	}
	
	//MARK: - Keyboard Notifications
	func keyboardWillShow(notification: NSNotification) {
		
		let keyboardFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
		
		forgotPasswordButtonBottomConstraint.constant = keyboardFrame.size.height
		
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			
			self.view.layoutIfNeeded()
			
		})
		
	}
	
	func keyboardWillHide() {
		
		forgotPasswordButtonBottomConstraint.constant = 8
		
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			
			self.view.layoutIfNeeded()
			
		})
		
	}
	
	//MARK: - UITextField
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		if textField == usernameField {
			
			passwordField.becomeFirstResponder()
			
		} else {
			
			if passwordField.text != "" && usernameField.text != "" {
				
				login()
				
			} else {
				
				usernameField.becomeFirstResponder()
				
			}
			
		}
		
		return true
		
	}
	
	//MARK: - UIButton Actions
	@IBAction func loginButtonTapped(sender: AnyObject) {
		
		login()
		
	}

}
