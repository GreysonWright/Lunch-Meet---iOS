//
//  DatePickerViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/28/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: Selector("navigationCancelButtonTapped"))
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func navigationCancelButtonTapped() {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
}
