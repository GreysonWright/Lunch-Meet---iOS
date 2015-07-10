//
//  LunchMeetSingleton.swift
//  Lunch Meet
//
//  Created by greyson on 7/3/15.
//  Copyright (c) 2015 Greyson Wright. All rights reserved.
//

import UIKit

class LunchMeetSingleton: NSObject {
	
	static let sharedInstance = LunchMeetSingleton()
	
	var lunchPlans = []
	var image:UIImage? = nil
	
}
