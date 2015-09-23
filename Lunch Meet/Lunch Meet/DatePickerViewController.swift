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

class DatePickerViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate, UITextFieldDelegate {

	@IBOutlet var partyMembersField: TextField!
	@IBOutlet var locationButton: UIButton!
	@IBOutlet var datePicker: UIDatePicker!
	@IBOutlet var mapView: MKMapView!
	
	var delegate: DatePickerViewDelegate?
	let locationManager = CLLocationManager()
	var date: NSDate!
	var membersTableView: UITableView!
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
		
		if CLLocationManager.authorizationStatus() == .NotDetermined {
		
			locationManager.delegate = self
			locationManager.requestWhenInUseAuthorization()
			
		} else if CLLocationManager.authorizationStatus() == .Restricted || CLLocationManager.authorizationStatus() == .Denied {
			
			presentDeniedAccessAlert()
			
		} else {
			
			beginShowingUserLocation()
			
		}
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func dismissLocationSearch() {
		
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			
			self.locationTableView.frame.origin.y = UIScreen.mainScreen().bounds.height
			self.locationTopContainerView.frame.origin.y = 0
			
			}) { (completed:Bool) -> Void in
				
				self.locationTableView.removeFromSuperview()
				self.locationTopContainerView.removeFromSuperview()
				
		}
		
	}
	
	func presentDeniedAccessAlert() {
		
		let alertController = UIAlertController(title: nil, message: "Lunch Meet must access your location to function properly.", preferredStyle: .Alert)
		alertController.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: { (action: UIAlertAction!) -> Void in
			
			UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
			
		}))
		presentViewController(alertController, animated: true, completion: nil)
		
	}
	
	func beginShowingUserLocation() {
	
//		locationManager.startUpdatingLocation()
		mapView.showsUserLocation = true
	
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
		
		dismissLocationSearch()
		
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
		locationField.returnKeyType = .Done
		locationField.delegate = self
		
		let locationDoneButton = UIButton(frame: CGRectMake(locationField.frame.width + 7, 0, 53, 44))
		locationDoneButton.addTarget(self, action: Selector("locationDoneButtonTapped"), forControlEvents: .TouchUpInside)
		locationDoneButton.backgroundColor = UIColor.blue700()
		locationDoneButton.setTitle("Cancel", forState: .Normal)
		locationDoneButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		locationDoneButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
		
		locationTableView = UITableView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.size.height, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height - 107))
		locationTableView.keyboardDismissMode = .OnDrag
		
		locationTableView.delegate = self
		locationTableView.dataSource = self
		locationTableView.registerNib(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationCell")
		
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
	
	@IBAction func partyMembersFieldButtonTapped(sender: AnyObject) {
		
		membersTableView = UITableView(frame: UIScreen.mainScreen().bounds)
		membersTableView.dataSource = self
		membersTableView.delegate = self
		
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
			
				self.restaurantData = response!.mapItems 
				
			} else {
				
				self.restaurantData = []
				
			}
			
			print(error)
			
			self.locationTableView.reloadData()
			
		}
		
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		textField.endEditing(true)
		
		return true
		
	}
	
	//MARK: - Location Manager
	func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
		
		if CLLocationManager.authorizationStatus() == .Restricted || CLLocationManager.authorizationStatus() == .Denied {
			
			presentDeniedAccessAlert()
			
		} else {
			
			beginShowingUserLocation()
			
		}
		
	}
	
	//MARK: - MapView
	func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
		
		print(mapView.annotations.count)
		
		if mapView.annotations.count == 1 {
		
			var region = MKCoordinateRegion()
			region.center = mapView.userLocation.coordinate
			region.span.latitudeDelta = 0.01
			region.span.longitudeDelta = 0.01
			
			mapView.setRegion(region, animated: true)
			mapView.userTrackingMode = .Follow
			
		}
		
	}
	
	func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
		
		if let annotation = annotation as? Annotation {
			
			let identifier = "LocationAnnotationView"
			var view: MKPinAnnotationView
			
			if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView {
				
					dequeuedView.annotation = annotation
					view = dequeuedView
				
			} else {
				
				view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
				view.canShowCallout = true
				
			}
			
			return view
			
		}
		
		return nil
		
	}
	
	//MARK: - UITableView
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		return 60
		
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return restaurantData.count
		
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("LocationCell", forIndexPath: indexPath) as! LocationTableViewCell
		cell.nameLabel.text = restaurantData[indexPath.row].name
		cell.addressLabel.text = "\(restaurantData[indexPath.row].placemark.thoroughfare), \(restaurantData[indexPath.row].placemark.locality), \(restaurantData[indexPath.row].placemark.administrativeArea) - \(restaurantData[indexPath.row].placemark.postalCode)"
		
		return cell
		
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		dismissLocationSearch()
		
		mapView.removeAnnotations(mapView.annotations)
		
		let mapItem = restaurantData[indexPath.row]
		let annotation = Annotation(coordinate: mapItem.placemark.location!.coordinate, title: mapItem.name!, subtitle: nil)
		
		var region = MKCoordinateRegion()
		region.center = annotation.coordinate
		region.span.latitudeDelta = 0.01
		region.span.longitudeDelta = 0.01
		
		mapView.setRegion(region, animated: true)
		mapView.userTrackingMode = .None
		mapView.addAnnotation(annotation)
		mapView.selectAnnotation(annotation, animated: true)
		
	}
	
}
