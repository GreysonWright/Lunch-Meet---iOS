//
//  DatePickerViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/28/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import MapKit

protocol DatePickerViewDelegate {
	
	func didSaveDate(date: NSDate)
	
}

class DatePickerViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

	@IBOutlet var partyMembersField: TextField!
	@IBOutlet var locationButton: UIButton!
	@IBOutlet var datePicker: UIDatePicker!
	@IBOutlet var mapView: MKMapView!
	
	var delegate: DatePickerViewDelegate?
	
	var date: NSDate!
	var locationTopContainerView: UIView!
	var locationTableView: UITableView!
	var restaurantData: [MKMapItem] = []
	
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
		
		let locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.requestAlwaysAuthorization()
		
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
	
	func locationDoneButtonTapped() {
		
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			
			self.locationTableView.frame.origin.y = UIScreen.mainScreen().bounds.height
			self.locationTopContainerView.frame.origin.y = 0
			
			}) { (completed:Bool) -> Void in
				
				self.locationTableView.removeFromSuperview()
				self.locationTopContainerView.removeFromSuperview()
				
		}
		
	}
	
	@IBAction func locationButtonTapped(sender: AnyObject) {
		
		locationTopContainerView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 44))
		locationTopContainerView.backgroundColor = UIColor.blue50()
		
		let locationField = UITextField(frame: CGRectMake(10, 0, UIScreen.mainScreen().bounds.width - 60, 44))
		locationField.addTarget(self, action: Selector("locationFieldValueChanged:"), forControlEvents: UIControlEvents.EditingChanged)
		locationField.placeholder = "Location"
		locationField.tintColor = UIColor.grey700()
		locationField.textColor = UIColor.grey700()
		locationField.backgroundColor = UIColor.blue50()
		locationField.font = UIFont(name: "HelveticaNeue", size: 22)
		locationField.borderStyle = .None
		locationField.clearButtonMode = .WhileEditing
		
		let locationDoneButton = UIButton(frame: CGRectMake(locationField.frame.width + 7, 0, 53, 44))
		locationDoneButton.addTarget(self, action: Selector("locationDoneButtonTapped"), forControlEvents: .TouchUpInside)
		locationDoneButton.backgroundColor = UIColor.blue700()
		locationDoneButton.setTitle("Cancel", forState: .Normal)
		locationDoneButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		locationDoneButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
		
		locationTableView = UITableView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.size.height, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 60))
		locationTableView.delegate = self
		locationTableView.dataSource = self
		locationTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "LocationCell")
		
		locationTopContainerView.addSubview(locationField)
		locationTopContainerView.addSubview(locationDoneButton)
		view.addSubview(locationTopContainerView)
		view.addSubview(locationTableView)
		
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			
			self.locationTableView.frame.origin.y = 108
			self.locationTopContainerView.frame.origin.y = 64
			
			}) { (completed:Bool) -> Void in
				
				locationField.becomeFirstResponder()
				
		}
		
	}
	
	//MARK: - DatePicker
	@IBAction func datePickerValueChanged(sender: AnyObject) {
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MMMM d, yyyy"
		
		title = dateFormatter.stringFromDate((sender as! UIDatePicker).date)
		
		date = (sender as! UIDatePicker).date
		
	}
	
	//MARK: - UITextField
	func locationFieldValueChanged(field: UITextField) {
	
		let searchRequest = MKLocalSearchRequest()
		searchRequest.naturalLanguageQuery = field.text
		searchRequest.region = mapView.region
		
		let search = MKLocalSearch(request: searchRequest)
		search.startWithCompletionHandler { (response: MKLocalSearchResponse?, error: NSError?) -> Void in
			
			if response != nil {
			
				self.restaurantData = response!.mapItems as! [MKMapItem]
				
			} else {
				
				self.restaurantData = []
				
			}
			
			println(error)
			
			self.locationTableView.reloadData()
			
		}
		
	}
	
	//MARK: - Location Manager
	func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
		
		manager.startUpdatingLocation()
		
	}
	
	//MARK: - UITableView
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return restaurantData.count
		
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath) as! UITableViewCell
	
		cell.textLabel?.text = restaurantData[indexPath.row].name
		cell.detailTextLabel?.text = "\(restaurantData[indexPath.row].placemark)"
		
		return cell
		
	}
	
}
