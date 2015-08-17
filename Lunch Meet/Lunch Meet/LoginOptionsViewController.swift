//
//  LoginOptionsViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/28/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

enum LoginOptions: String {
	
	case SignUp = "Sign Up"
	case CreateNew = "New User"
	
}

class LoginOptionsViewController: UIViewController {

	@IBOutlet var signUpView: UIView!
	@IBOutlet var emailField: TextField!
	@IBOutlet var confirmEmailField: TextField!
	@IBOutlet var passwordField: TextField!
	@IBOutlet var firstnameField: TextField!
	@IBOutlet var lastNameField: TextField!
	@IBOutlet var cityStateField: TextField!
	
	@IBOutlet var forgotPasswordView: UIView!
	@IBOutlet var resetEmailField: TextField!
	
//	var type: LoginOptions!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Sign Up"
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: Selector("cancelBarButtonTapped"))
		
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
			signUpView.frame = CGRect(origin: CGPoint(x: 0, y: navigationController!.navigationBar.bounds.height + 20), size: CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - (navigationController!.navigationBar.bounds.height - 20)))
			view.addSubview(signUpView)
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func cancelBarButtonTapped() {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}

}
