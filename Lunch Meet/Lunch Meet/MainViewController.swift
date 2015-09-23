//
//  MainViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import iAd

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ADBannerViewDelegate, JTCalendarDataSource, DatePickerViewDelegate {
	
	@IBOutlet var calendarContainerView: UIView!
	@IBOutlet var menuView: JTCalendarMenuView!
	@IBOutlet var calendarView: JTCalendarContentView!
	@IBOutlet var tableView: UITableView!
	
	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
	var calendar: JTCalendar!
	var calendarPassCount = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Plans"
		
		canDisplayBannerAds = true
		
		let navigationSegmentedControl = UISegmentedControl(items: ["List", "Calendar"])
		navigationSegmentedControl.setWidth(95, forSegmentAtIndex: 0)
		navigationSegmentedControl.setWidth(95, forSegmentAtIndex: 1)
		navigationSegmentedControl.tintColor = UIColor.blue700()
		navigationSegmentedControl.selectedSegmentIndex = 0
		navigationSegmentedControl.addTarget(self, action: Selector("navigationSegmentedControl:"), forControlEvents: UIControlEvents.ValueChanged)
		navigationItem.titleView = navigationSegmentedControl
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("profileButtonTapped"))
		
		calendar = JTCalendar()
		calendar.calendarAppearance.dayCircleColorToday = UIColor.blue200()
		calendar.calendarAppearance.dayCircleColorTodayOtherMonth = UIColor.blue200()
		calendar.calendarAppearance.dayCircleColorSelected = UIColor.blue700()
		calendar.calendarAppearance.dayCircleColorSelectedOtherMonth = UIColor.blue700()
		calendar.menuMonthsView = menuView
		calendar.contentView = calendarView
		calendar.dataSource = self
		calendar.reloadData()
		calendar.reloadAppearance()
		
		tableView.registerNib(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCell")
		tableView.frame = CGRect(origin: CGPoint(x: 0, y: navigationController!.navigationBar.bounds.height + 20), size: CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - (navigationController!.navigationBar.bounds.height + 20)))
		view.addSubview(tableView)
		
	}
	
	override func viewWillAppear(animated: Bool) {
		
		super.viewWillAppear(animated)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func navigationSegmentedControl(sender: AnyObject) {
		
		if (sender as! UISegmentedControl).selectedSegmentIndex == 0 {
			
			calendarContainerView.removeFromSuperview()
			
			tableView.frame = CGRect(origin: CGPoint(x: 0, y: navigationController!.navigationBar.bounds.height + 20), size: CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - (navigationController!.navigationBar.bounds.height + 20)))
			view.addSubview(tableView)
			tableView.reloadData()
			
		} else {
			
			tableView.removeFromSuperview()
			
			calendarContainerView.frame = CGRect(origin: CGPoint(x: 0, y: navigationController!.navigationBar.bounds.height + 20), size: CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - (navigationController!.navigationBar.bounds.height + 20)))
			view.addSubview(calendarContainerView)
			calendarView.reloadData()
			
		}
		
	}
	
	override func viewDidLayoutSubviews() {
		
		calendar.repositionViews()
		
		for subView in view.subviews {
			
			if (subView as? ADBannerView != nil) {
				
				if(subView as! ADBannerView).bannerLoaded {
					
					view.bringSubviewToFront(subView as! ADBannerView)
					
					calendarContainerView.frame.size = CGSize(width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height - ((subView.frame.size.height * 2) + 15))
					tableView.frame.size = CGSize(width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height - ((subView.frame.size.height * 2) + 15))
					
				}
				
				break
				
			}
			
		}
		
	}
	
	//MARK: - DatePickerView
	func didSaveDate(date: NSDate) {
		
		calendar.currentDateSelected = date
		calendar.reloadAppearance()
		calendar.reloadData()
		
	}
	
	func presentDatePicker(date: NSDate) {
		
		let datePickerVC = DatePickerViewController(nibName: "DatePickerViewController", bundle: nil)
		datePickerVC.delegate = self
		datePickerVC.date = date
		
		let datePickerNavController = UINavigationController(rootViewController: datePickerVC)
		
		navigationController!.presentViewController(datePickerNavController, animated: true, completion: nil)
		
	}
	
	//MARK: - JTCalendar
	func calendar(calendar: JTCalendar!, canSelectDate date: NSDate!) -> Bool {
		
		let dateFormatter = NSDateFormatter()
		
		dateFormatter.dateFormat = "dd"
		let selectedDay = Int(dateFormatter.stringFromDate(date))
		let currentDay = Int(dateFormatter.stringFromDate(NSDate()))
		
		dateFormatter.dateFormat = "MM"
		let selectedMonth = Int(dateFormatter.stringFromDate(date))
		let currentMonth = Int(dateFormatter.stringFromDate(NSDate()))
		
		dateFormatter.dateFormat = "yyyy"
		let selectedYear = Int(dateFormatter.stringFromDate(date))
		let currentYear = Int(dateFormatter.stringFromDate(NSDate()))
		
		if (selectedDay >= currentDay && selectedMonth >= currentMonth && selectedYear >= currentYear) || (selectedMonth > currentMonth && selectedYear >= currentYear) || (selectedYear > currentYear) {
			
			return true
			
		}
		
		let alertController = UIAlertController(title: nil, message: "Dates prior to today cannot be selected.", preferredStyle: .Alert)
		presentViewController(alertController, animated: true, completion: nil)
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
			
			alertController.dismissViewControllerAnimated(true, completion: nil)
			
		}
		
		calendar.currentDate = NSDate()
		calendar.reloadAppearance()
		
		return false
		
	}
	
	func calendarDidDateSelected(calendar: JTCalendar!, date: NSDate!) {
		
		presentDatePicker(date)
		
	}
	
	func calendarHaveEvent(calendar: JTCalendar!, date: NSDate!) -> Bool {
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MM/dd/yyyy"
		
		for scheduledDate in LunchMeetSingleton.sharedInstance.scheduledDates {
			
			if dateFormatter.stringFromDate(date) == scheduledDate {
				
				return true
				
			}
			
		}
		
		return false
		
	}
	
	//MARK: - UIButton Actions
	func profileButtonTapped() {
		
		let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
		
		navigationController?.pushViewController(profileVC, animated: true)
		
	}
	
	func addButtonTapped() {
		
		presentDatePicker(NSDate())
		
	}
	
	//MARK: UITableView
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		return 67
		
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return LunchMeetSingleton.sharedInstance.scheduledDates.count
		
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) as! MainTableViewCell
		
		return cell
		
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		
		return 44
		
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		let addButton = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.mainScreen().bounds.width, height: tableView.sectionHeaderHeight)))
		addButton.addTarget(self, action: Selector("addButtonTapped"), forControlEvents: .TouchUpInside)
		addButton.backgroundColor = UIColor.blue700()
		addButton.setTitle("Plan Lunch", forState: .Normal)
		addButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 22)
		
		return addButton
		
	}
	
}
