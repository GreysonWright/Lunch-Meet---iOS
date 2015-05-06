//
//  SignUpViewController.swift
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Sign Up"
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: Selector("cancelButtonTapped"))
		navigationItem.rightBarButtonItem?.tintColor = UIColor.whiteColor()
		
	}
	
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func cancelButtonTapped(){
		dismissViewControllerAnimated(true, completion: nil)
	}
}
