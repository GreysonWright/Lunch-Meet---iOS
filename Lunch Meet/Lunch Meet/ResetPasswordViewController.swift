//
//  ResetPasswordViewController.swift
//  Lunch Meet
//
//  Created by greyson on 5/8/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		title = "Reset Password"
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: Selector("cancelButtonTapped"))
		navigationItem.rightBarButtonItem?.tintColor = UIColor.whiteColor()
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func cancelButtonTapped(){
		dismissViewControllerAnimated(true, completion: nil)
	}
	
}
