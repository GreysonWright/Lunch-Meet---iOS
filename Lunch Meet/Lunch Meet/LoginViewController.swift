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
	@IBOutlet var loadingBlurView: UIVisualEffectView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		usernameField.delegate = self
		passwordField.delegate = self
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
		loadingBlurView.alpha = 1
		loadingBlurView.center = view.center
	}
}
