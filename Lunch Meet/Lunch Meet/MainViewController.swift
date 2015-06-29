//
//  MainViewController.swift
//  Lunch Meet
//
//  Created by greyson on 6/10/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit
import iAd

class MainViewController: UIViewController, JTCalendarDataSource {
	
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
		
		tableView.frame = CGRect(origin: CGPoint(x: 0, y: navigationController!.navigationBar.bounds.height + 20), size: CGSize(width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height - (navigationController!.navigationBar.bounds.height - 20)))
		view.addSubview(tableView)
		
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
		
		for subView in view.subviews {
			
			if (subView as? ADBannerView != nil) {
				
				view.bringSubviewToFront(subView as! ADBannerView)
				
				calendarContainerView.frame.size = CGSize(width: calendarContainerView.frame.size.width, height: calendarContainerView.frame.size.height - (subView.frame.size.height + 15))
				
				break
				
			}
			
		}
		
	}
	
	override func viewDidLayoutSubviews() {
		
		calendar.repositionViews()
		
	}
	
	//MARK: - JTCalendar
	func calendar(calendar: JTCalendar!, canSelectDate date: NSDate!) -> Bool {
		
		return true
		
	}
	
	func calendarDidDateSelected(calendar: JTCalendar!, date: NSDate!) {
		
		let dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MMMM d, yyyy"
		
		let datePickerVC = DatePickerViewController(nibName: "DatePickerViewController", bundle: nil)
		datePickerVC.title = dateFormatter.stringFromDate(date)
		
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
	
}
