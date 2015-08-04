//
//  DatePickerViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/28/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

protocol DatePickerViewDelegate {
	
	func didSaveDate(date: NSDate)
	
}

class DatePickerViewController: UIViewController {

	@IBOutlet var datePicker: UIDatePicker!
	
	var delegate: DatePickerViewDelegate?
	var date: NSDate!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		canDisplayBannerAds = true
		
		navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: Selector("navigationCancelButtonTapped"))
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: Selector("navigationSaveButtonTapped"))
		
		datePicker.minimumDate = NSDate()
		datePicker.date = date
		datePicker.backgroundColor = UIColor(red: 232.0 / 255.0, green: 239.0 / 255.0, blue: 252.0 / 255.0, alpha: 1)
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MMMM d, yyyy"
		
		title = dateFormatter.stringFromDate(date)
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: - UIButton Actions
	func navigationCancelButtonTapped() {
		
		dismissViewControllerAnimated(true, completion: nil)
		
	}
	
	func navigationSaveButtonTapped() {
		
		dismissViewControllerAnimated(true, completion: nil)
		
		delegate?.didSaveDate(date)
		
	}
	
	//MARK: - DatePicker
	@IBAction func datePickerValueChanged(sender: AnyObject) {
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MMMM d, yyyy"
		
		title = dateFormatter.stringFromDate((sender as! UIDatePicker).date)
		
		date = (sender as! UIDatePicker).date
		
	}
	
}
