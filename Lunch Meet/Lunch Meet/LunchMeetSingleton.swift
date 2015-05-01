//
//  LunchMeetSingleton.swift
//  Lunch Meet
//
//  Created by greyson on 4/30/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

private let _sharedInstance = LunchMeetSingleton()

class LunchMeetSingleton: NSObject {
	
	let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
	
	var accessToken = AccessToken()
	var user = User()
	
	class var sharedInstance: LunchMeetSingleton{
		return _sharedInstance
	}
	
}
