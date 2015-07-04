//
//  DatePickerViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/28/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

	@IBOutlet var datePicker: UIDatePicker!
	
	var date: NSDate!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: Selector("navigationCancelButtonTapped"))
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: Selector("navigationSaveButtonTapped"))
		
		datePicker.minimumDate = NSDate()
		datePicker.date = date
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MMMM d, yyyy"
		
		title = dateFormatter.stringFromDate(date)
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func navigationCancelButtonTapped() {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	func navigationSaveButtonTapped() {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	@IBAction func datePickerValueChanged(sender: AnyObject) {
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MMMM d, yyyy"
		
		title = dateFormatter.stringFromDate((sender as! UIDatePicker).date)
		
	}
	
}