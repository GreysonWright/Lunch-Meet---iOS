//
//  MainViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import iAd

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ADBannerViewDelegate, JTCalendarDataSource {
	
	@IBOutlet var calendarContainerView: UIView!
	@IBOutlet var menuView: JTCalendarMenuView!
	@IBOutlet var calendarView: JTCalendarContentView!
	@IBOutlet var tableView: UITableView!
	
	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
	var calendar: JTCalendar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Plans"
		
		canDisplayBannerAds = true
		
		let navigationSegmentedControl = UISegmentedControl(items: ["List", "Calendar"])
		navigationSegmentedControl.setWidth(95, forSegmentAtIndex: 0)
		navigationSegmentedControl.setWidth(95, forSegmentAtIndex: 1)
		navigationSegmentedControl.tintColor = UIColor(red: 0, green: 102/255, blue: 153/255, alpha: 1)
		navigationSegmentedControl.selectedSegmentIndex = 0
		navigationSegmentedControl.addTarget(self, action: Selector("navigationSegmentedControl:"), forControlEvents: UIControlEvents.ValueChanged)
		navigationItem.titleView = navigationSegmentedControl
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("profileButtonTapped"))
		
		calendar = JTCalendar()
		calendar.calendarAppearance.dayCircleColorTodayOtherMonth = UIColor(red: 0, green: 102/255, blue: 153/255, alpha: 1)
		calendar.calendarAppearance.dayCircleColorSelected = UIColor(red: 183/255, green: 214/255, blue: 1, alpha: 1)
		calendar.calendarAppearance.dayCircleColorSelectedOtherMonth = UIColor(red: 183/255, green: 214/255, blue: 1, alpha: 1)
		calendar.calendarAppearance.dayCircleColorToday = UIColor(red: 0, green: 102/255, blue: 153/255, alpha: 1)
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
		
//		tableView.registerNib(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainCell")
//		tableView.frame = CGRect(origin: CGPoint(x: 0, y: navigationController!.navigationBar.bounds.height + 20), size: CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - (navigationController!.navigationBar.bounds.height + 20)))
//		view.addSubview(tableView)
		
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
	
	//MARK: - JTCalendar
	func calendar(calendar: JTCalendar!, canSelectDate date: NSDate!) -> Bool {
		
		return true
		
	}
	
	func calendarDidDateSelected(calendar: JTCalendar!, date: NSDate!) {
		
		let datePickerVC = DatePickerViewController(nibName: "DatePickerViewController", bundle: nil)
		datePickerVC.date = date
		
		let datePickerNavController = UINavigationController(rootViewController: datePickerVC)
		
		navigationController!.presentViewController(datePickerNavController, animated: true, completion: nil)
		
	}
	
	func calendarHaveEvent(calendar: JTCalendar!, date: NSDate!) -> Bool {
		
		return false
		
	}
	
	//MARK: - BarButton Actions
	func profileButtonTapped() {
		
		let profileVC = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
		
		navigationController?.pushViewController(profileVC, animated: true)
		
	}
	
	//MARK: UITableView
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		return 67
		
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return LunchMeetSingleton.sharedInstance.lunchPlans.count
		
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("MainCell", forIndexPath: indexPath) as! MainTableViewCell
		
		return cell
		
	}
	
}
